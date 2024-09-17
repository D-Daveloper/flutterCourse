import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: data["correct_answer"] == data["user_answer"]
                          ? Colors.green
                          : Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          data["questions"] as String,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          data["user_answer"] as String,
                          style: TextStyle(color: Colors.red[400]),
                        ),
                        Text(
                          data["correct_answer"] as String,
                          style: const TextStyle(color: Colors.green),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
