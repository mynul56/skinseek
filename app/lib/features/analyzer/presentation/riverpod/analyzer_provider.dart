import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:skinseek_app/features/analyzer/data/analyzer_repository.dart';
import 'package:skinseek_app/features/analyzer/domain/models/analysis_result.dart';

part 'analyzer_provider.g.dart';

@riverpod
class AnalyzerState extends _$AnalyzerState {
  @override
  AsyncValue<AnalysisResult?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> analyze(String ingredients) async {
    state = const AsyncValue.loading();
    try {
      final repository = ref.read(analyzerRepositoryProvider);
      
      final future1 = repository.analyzeIngredients(ingredients: ingredients);
      final future2 = Future.delayed(const Duration(seconds: 4));
      
      await Future.wait([future1, future2]);
      final result = await future1;
      
      state = AsyncValue.data(result);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
