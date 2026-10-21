class AnswerChoice {
  final String text;
  final int score;

  const AnswerChoice({required this.text, required this.score});
}

class WellnessQuestion {
  final String prompt;
  final List<AnswerChoice> choices;

  const WellnessQuestion({required this.prompt, required this.choices});
}