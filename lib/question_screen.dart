import 'package:flutter/material.dart';

import 'package:basic_quize_app_practice/questions.dart';
import 'package:basic_quize_app_practice/result_screen.dart';

// import 'package:basic_quize_app_practice/quize_questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0; // Index of the current question
  double opacity = 1;
  int score = 0;
  List<String> chosenAnswers = []; // Define the lists here
  List<String> correctAnswers = [];

  var colorOne = const Color.fromARGB(99, 53, 68, 204);
  var colorTwo = const Color.fromARGB(98, 71, 80, 161);

  void answerQuestion(int selectedAnswerIndex) {
    final correctAnswerIndex =
        questions[currentQuestionIndex].correctAnswerIndex;
    if (correctAnswerIndex == selectedAnswerIndex) {
      score++;
    }

    chosenAnswers
        .add(questions[currentQuestionIndex].answer[selectedAnswerIndex]);
    correctAnswers
        .add(questions[currentQuestionIndex].answer[correctAnswerIndex]);

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        opacity = 1; //after clickig it's vanish
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              chosenAnswers: chosenAnswers,
              correctAnswers: correctAnswers,
              score: score,
            ),
          ),
        );
      }
    });
  }

  // List<String> shuffledAnsweroption() {
  //   final correctAnswer = questions[currentQuestionIndex].answer[0];
  //   final otherAnswer =
  //       List<String>.from(questions[currentQuestionIndex].answer)..removeAt(0);
  //   otherAnswer.shuffle();
  //   otherAnswer.insert(0, correctAnswer);
  //   return otherAnswer;
  // }
  List<String> shuffledAnswerOption() {
    final correctAnswer = questions[currentQuestionIndex].answer[0];
    final otherAnswer =
        List<String>.from(questions[currentQuestionIndex].answer)..removeAt(0);
    otherAnswer.shuffle();
    otherAnswer.insert(0, correctAnswer);
    return otherAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/quize_Background_image.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [colorOne, colorTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.white,
                child: Text(
                  questions[currentQuestionIndex].text,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: shuffledAnswerOption().map((answer) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      answerQuestion(shuffledAnswerOption().indexOf(answer));

                      setState(() {
                        opacity =
                            opacity; //Make The question viible after questioning a answer
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromARGB(255, 13, 2, 61),
                        elevation: 4,
                        padding: const EdgeInsets.all(15)),
                    child: Text(answer, style: const TextStyle(fontSize: 16)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
