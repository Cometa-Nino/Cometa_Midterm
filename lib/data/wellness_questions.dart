import '../models/wellness_question.dart';

const List<WellnessQuestion> wellnessQuestions = [
  WellnessQuestion(
    prompt: 'How many hours do you typically sleep?',
    choices: [
      AnswerChoice(text: 'Less than 4', score: 1),
      AnswerChoice(text: '4–6 hours', score: 2),
      AnswerChoice(text: '7–8 hours', score: 4),
      AnswerChoice(text: 'More than 8', score: 3),
    ],
  ),
  WellnessQuestion(
    prompt: 'How often do you exercise each week?',
    choices: [
      AnswerChoice(text: 'Never', score: 0),
      AnswerChoice(text: '1–2 times', score: 2),
      AnswerChoice(text: '3–4 times', score: 3),
      AnswerChoice(text: '5 or more times', score: 4),
    ],
  ),
  WellnessQuestion(
    prompt: 'How would you rate your stress level today?',
    choices: [
      AnswerChoice(text: 'Very high', score: 0),
      AnswerChoice(text: 'High', score: 1),
      AnswerChoice(text: 'Moderate', score: 3),
      AnswerChoice(text: 'Low', score: 4),
    ],
  ),
  WellnessQuestion(
    prompt: 'How do you usually prepare for exams or quizzes?',
    choices: [
      AnswerChoice(text: 'Cramming the night before', score: 0),
      AnswerChoice(text: 'Last-minute reviews', score: 1),
      AnswerChoice(text: 'Regular short sessions', score: 3),
      AnswerChoice(text: 'Planned study with breaks', score: 4),
    ],
  ),
  WellnessQuestion(
    prompt: 'How often do you eat balanced meals?',
    choices: [
      AnswerChoice(text: 'Rarely', score: 0),
      AnswerChoice(text: 'Sometimes', score: 2),
      AnswerChoice(text: 'Most days', score: 3),
      AnswerChoice(text: 'Every day', score: 4),
    ],
  ),
];