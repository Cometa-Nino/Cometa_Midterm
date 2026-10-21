import 'package:flutter/material.dart';
import '../models/wellness_result.dart';

class ResultView extends StatelessWidget {
  final int score;

  const ResultView({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final progress = score / WellnessResult.maxScore;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Wellness Score', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              '$score / ${WellnessResult.maxScore}',
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: progress),
            const SizedBox(height: 24),
            Text('Classification', style: theme.textTheme.labelLarge),
            Text(
              WellnessResult.classify(score),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text('Recommendation', style: theme.textTheme.labelLarge),
            Text(
              WellnessResult.recommendation(score),
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}