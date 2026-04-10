import type { VercelRequest, VercelResponse } from '@vercel/node';
import express, { type Request, type Response } from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import Anthropic from '@anthropic-ai/sdk';
import axios from 'axios';

const app = express();

// Security and Middleware
app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(morgan('dev'));

// Initialize Anthropic
const anthropic = new Anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY || '',
});

// Environment Validation
const validateEnv = () => {
  if (!process.env.ANTHROPIC_API_KEY) {
    console.warn('WARNING: ANTHROPIC_API_KEY is not set. AI analysis will fail.');
  }
};
validateEnv();

// Health check
app.get('/api/health', (req: Request, res: Response) => {
  res.json({ 
    status: 'ok', 
    service: 'skinseek-api',
    environment: process.env.NODE_ENV || 'development'
  });
});

/**
 * POST /api/analyze
 * Orchestrates skincare ingredient analysis using Anthropic Claude.
 */
app.post('/api/analyze', async (req: Request, res: Response) => {
  try {
    const { ingredients, skinType, concerns } = req.body;

    if (!ingredients) {
      return res.status(400).json({ error: 'Ingredients list is required' });
    }

    if (!process.env.ANTHROPIC_API_KEY) {
      return res.status(503).json({ error: 'AI Service currently unavailable' });
    }

    const prompt = `
      Act as an expert cosmetic chemist and dermatologist. 
      Analyze the following skincare ingredient list based on the user's profile.
      
      User Profile:
      - Skin Type: ${skinType || 'Not specified'}
      - Concerns: ${concerns ? concerns.join(', ') : 'Not specified'}
      
      Ingredients:
      ${ingredients}
      
      Please provide a structured JSON response with the following fields:
      {
        "summary": "String (brief assessment of the product function)",
        "key_actives": [
          {"name": "String", "benefit": "String (why it's good for this user)"}
        ],
        "potential_irritants": [
          {"name": "String", "reason": "String (why it might be a risk)"}
        ],
        "comedogenic_rating": "String (Low/Medium/High/Unknown)",
        "recommendation": "String (Is it a good fit? Why?)",
        "safety_score": "Number (1-10, where 10 is safest)"
      }
      
      IMPORTANT: Return ONLY valid JSON.
    `;

    const message = await anthropic.messages.create({
      model: 'claude-3-haiku-20240307',
      max_tokens: 1500,
      messages: [
        { role: 'user', content: prompt }
      ],
    });

    const textBlock = message.content[0];
    const content = textBlock && textBlock.type === 'text' ? textBlock.text : '';
    
    if (!content) {
      return res.status(500).json({ error: 'AI returned an empty response' });
    }
    try {
      // Find JSON block if Claude adds preamble
      const jsonMatch = content.match(/\{[\s\S]*\}/);
      const extractedStr = jsonMatch ? jsonMatch[0] : content;
      // Also potentially fix markdown code blocks
      const cleanJson = extractedStr.replace(/```json\n?|\n?```/g, '').trim();
      const result = JSON.parse(cleanJson);
      res.json({ success: true, data: result });
    } catch (parseError) {
      console.error('Failed to parse Claude response:', content);
      res.status(500).json({ error: 'Failed to process AI analysis result' });
    }

  } catch (error: any) {
    console.error('Analysis Error:', error);
    res.status(500).json({ 
      error: 'Analysis failed', 
      message: error.message 
    });
  }
});

/**
 * GET /api/barcode/:code
 * Proxies OpenBeautyFacts to get product details from a barcode.
 */
app.get('/api/barcode/:code', async (req: Request, res: Response) => {
  const { code } = req.params;
  
  try {
    // OpenBeautyFacts API
    const url = `https://world.openbeautyfacts.org/api/v0/product/${code}.json`;
    const response = await axios.get(url);
    
    if (response.data.status === 0) {
      return res.status(404).json({ error: 'Product not found' });
    }

    const product = response.data.product;
    res.json({
      success: true,
      data: {
        name: product.product_name || 'Unknown Product',
        brand: product.brands || 'Unknown Brand',
        ingredients: product.ingredients_text || '',
        image_url: product.image_url || '',
      }
    });

  } catch (error: any) {
    console.error('Barcode Error:', error);
    res.status(500).json({ 
      error: 'Barcode lookup failed',
      message: error.message 
    });
  }
});

// Start logic for local dev vs vercel
if (process.env.NODE_ENV !== 'production' && !process.env.VERCEL) {
  const port = process.env.PORT || 3000;
  app.listen(port, () => {
    console.log(`Development server running on http://localhost:${port}`);
  });
}

// Export for Vercel
export default (req: VercelRequest, res: VercelResponse) => {
  return app(req as any, res as any);
};
