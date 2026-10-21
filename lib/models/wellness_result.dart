class WellnessResult {
  static const int maxScore = 20;

  static String classify(int score) {
    if (score >= 16) return 'Excellent Wellness Habits';
    if (score >= 10) return 'Moderate Wellness Habits';
    return 'Needs Improvement';
  }

  static String recommendation(int score) {
    if (score >= 16) return 'Keep maintaining your current habits.';
    if (score >= 10) return 'Good start. Focus on one area, such as sleep or stress.';
    return 'Consider small changes: a regular sleep schedule and short study breaks.';
  }

  const WellnessResult._();
}