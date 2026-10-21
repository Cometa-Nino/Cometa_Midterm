import 'package:flutter/material.dart';
import '../data/wellness_questions.dart';
import '../widgets/answer_button.dart';
import '../widgets/question_card.dart';
import 'results_screen.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  int _currentIndex = 0;
  int _totalScore = 0;

  void _onAnswerSelected(int points) {
    final isLast = _currentIndex == wellnessQuestions.length - 1;

    if (isLast) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultsScreen(score: _totalScore + points),
        ),
      );
      return;
    }

    setState(() {
      _totalScore += points;
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = wellnessQuestions[_currentIndex];
    final total = wellnessQuestions.length;
    final isLandscape =
        MediaQuery.orientationOf(context) == Orientation.landscape;

    final questionSection = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        QuestionCard(
          questionNumber: _currentIndex + 1,
          totalQuestions: total,
          prompt: question.prompt,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: LinearProgressIndicator(
            value: (_currentIndex + 1) / total,
          ),
        ),
      ],
    );

    final answersSection = ListView(
      shrinkWrap: true,
      children: [
        for (final choice in question.choices)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: AnswerButton(
              text: choice.text,
              onPressed: () => _onAnswerSelected(choice.score),
            ),
          ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Assessment')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: isLandscape
              ? Row(
                  children: [
                    Expanded(flex: 5, child: questionSection),
                    const SizedBox(width: 16),
                    Expanded(flex: 4, child: answersSection),
                  ],
                )
              : Column(
                  children: [
                    questionSection,
                    const SizedBox(height: 16),
                    Expanded(child: answersSection),
                  ],
                ),
        ),
      ),
    );
  }
}