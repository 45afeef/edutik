import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int selectedOption = -1; // Default no option selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: Chip(
                  label: Text('Question x / N'),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Here is the question text. It should be placed above the options.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),
              for (int i = 0; i < 4; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOption = i;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedOption == i
                            ? Colors.orange
                            : Colors.white.withOpacity(0.5),
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Option ${i + 1}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    // Handle the next button tap
                  },
                  child: const Chip(
                    label: Text(
                      'Next',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
