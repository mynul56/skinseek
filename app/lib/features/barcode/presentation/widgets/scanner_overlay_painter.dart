import 'package:flutter/material.dart';

class ScannerOverlayPainter extends CustomPainter {
  final double scanLineOffset;
  final Color borderColor;
  final Color overlayColor;

  ScannerOverlayPainter({
    required this.scanLineOffset,
    this.borderColor = const Color(0xFFFFE088), // tertiary-fixed
    this.overlayColor = const Color(0x661A1C1A), // surface with 40% opacity
  });

  @override
  void paint(Canvas canvas, Size size) {
    final frameWidth = size.width * 0.85;
    final frameHeight = frameWidth * (4 / 3);
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(center: center, width: frameWidth, height: frameHeight);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(24));

    // 1. Draw Overlay (Cutout)
    final paintOverlay = Paint()..color = overlayColor;
    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(rrect)
      ..fillType = PathFillType.evenOdd;
    canvas.drawPath(path, paintOverlay);

    // 2. Draw Frame Border
    final paintBorder = Paint()
      ..color = borderColor.withValues(alpha: 0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRRect(rrect, paintBorder);

    // 3. Draw Corner Accents
    final paintCorner = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    const cornerSize = 32.0;

    // Top Left
    canvas.drawPath(
      Path()
        ..moveTo(rect.left, rect.top + cornerSize)
        ..lineTo(rect.left, rect.top + 16)
        ..quadraticBezierTo(rect.left, rect.top, rect.left + 16, rect.top)
        ..lineTo(rect.left + cornerSize, rect.top),
      paintCorner,
    );

    // Top Right
    canvas.drawPath(
      Path()
        ..moveTo(rect.right - cornerSize, rect.top)
        ..lineTo(rect.right - 16, rect.top)
        ..quadraticBezierTo(rect.right, rect.top, rect.right, rect.top + 16)
        ..lineTo(rect.right, rect.top + cornerSize),
      paintCorner,
    );

    // Bottom Left
    canvas.drawPath(
      Path()
        ..moveTo(rect.left, rect.bottom - cornerSize)
        ..lineTo(rect.left, rect.bottom - 16)
        ..quadraticBezierTo(rect.left, rect.bottom, rect.left + 16, rect.bottom)
        ..lineTo(rect.left + cornerSize, rect.bottom),
      paintCorner,
    );

    // Bottom Right
    canvas.drawPath(
      Path()
        ..moveTo(rect.right - cornerSize, rect.bottom)
        ..lineTo(rect.right - 16, rect.bottom)
        ..quadraticBezierTo(rect.right, rect.bottom, rect.right, rect.bottom + 16)
        ..lineTo(rect.right, rect.bottom + cornerSize),
      paintCorner,
    );

    // 4. Draw Scanning Line
    final lineY = rect.top + (rect.height * scanLineOffset);
    final paintLine = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          borderColor.withValues(alpha: 0.8),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(rect.left, lineY - 2, rect.width, 4));

    canvas.drawRect(Rect.fromLTWH(rect.left, lineY - 1, rect.width, 2), paintLine);
  }

  @override
  bool shouldRepaint(ScannerOverlayPainter oldDelegate) =>
      oldDelegate.scanLineOffset != scanLineOffset;
}
