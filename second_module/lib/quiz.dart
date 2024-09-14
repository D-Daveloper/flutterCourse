import 'package:flutter/material.dart';
import 'package:second_module/data/questions.dart';
import 'package:second_module/questions_screen.dart';
import 'package:second_module/result_screen.dart';
import 'package:second_module/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "startScreen";

  void switchScreen() {
    setState(() {
      activeScreen = "QuestonsScreen";
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "startScreen";
    });
    selectedAnswers = [];
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "resultScreen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "my quiz app",
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "My quiz app 😁",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 75, 11, 185),
                Color.fromARGB(255, 105, 23, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: activeScreen == "startScreen"
                ? StartScreen(switchScreen)
                : activeScreen != "resultScreen"
                    ? QuestionsScreen(
                        onSelectAnswer: chooseAnswer,
                      )
                    : ResultScreen(
                        chosenAnswers: selectedAnswers,
                        startQuiz: restartQuiz,
                      ),
          ),
        ));
  }
}
