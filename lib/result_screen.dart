import 'package:flutter/material.dart';
import 'package:basic_quize_app_practice/questions.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final List<String> correctAnswers;
  final int score;

  const ResultScreen({
    required this.chosenAnswers,
    required this.correctAnswers,
    required this.score,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Your Quiz Result",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < questions.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${i + 1}: ${questions[i].text}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("Your Answer: ${chosenAnswers[i]}"),
                    Text("Correct Answer: ${correctAnswers[i]}"),
                    const Divider(),
                  ],
                ),
              const SizedBox(height: 20),
              Text(
                "Your Score: $score / ${questions.length}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
