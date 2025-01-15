import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../do/closed_ended/mcq.dart';
import 'controllers/assessment_creation_controller.dart';

class AssessmentCreationPage extends StatelessWidget {
  final AssessmentDraftController _draftController =
      Get.put(AssessmentDraftController());

  final TextEditingController _topicController = TextEditingController();
  final TextEditingController _aiResponseController = TextEditingController();

  AssessmentCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Existing UI elements...
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'add_your_assessment_name'.tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _draftController.assessmentNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Text(
                      'questions'.tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                        child: Obx(
                          () => Text(
                            _draftController.questions.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white24),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(24, 20)),
                  ),
                  child: Obx(
                    () {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _draftController.questions.length,
                        itemBuilder: (context, index) {
                          final question = _draftController.questions[index];

                          return ListTile(
                            title: Text(
                              question['question'],
                              style: Get.theme.textTheme.titleLarge,
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 16),
                                ...[
                                  question['option1'],
                                  question['option2'],
                                  question['option3'],
                                  question['option4']
                                ].map(
                                  (option) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          option.trim(),
                                          style: Get.theme.textTheme.labelSmall,
                                        ),
                                        option == question['answer']
                                            ? const Icon(Icons.check_circle)
                                            : const SizedBox(
                                                width: 24,
                                                height: 24,
                                              )
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                            onLongPress: () => _showDeleteForm(context),
                            onTap: () => _editQuestion(question),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(color: Colors.white24);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 100),
                Obx(
                  () => ElevatedButton(
                    onPressed: _draftController.questions.length < 5
                        ? null
                        : () {
                            // Save the Assessment to cloud
                            _draftController.saveAssessment();
                          },
                    child: Text('${'publish'.tr} ${'assessment'.tr}'),
                  ),
                ),
                const SizedBox(height: 150),
                // New section for AI-assisted creation
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter Topic for AI-assisted Creation',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _topicController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _generateAndCopyPrompt,
                        child: const Text('Generate and Copy Prompt'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Paste AI Response Here',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _aiResponseController,
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _convertResponseToAssessment,
                        child: const Text('Convert to Assessment'),
                      ),
                    ],
                  ),
                ),
                // Existing UI elements...
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showQuestionTypeSelection(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _convertResponseToAssessment() {
    final response = _aiResponseController.text;

    // Parse the response and convert it to questions format
    // Example: Parse JSON or other structured data from response and add it to _draftController.questions
    _draftController.addQuestions(response);
  }

  void _editQuestion(Map<String, dynamic> question) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        final TextEditingController questionController =
            TextEditingController(text: question['question']);
        final TextEditingController option1Controller =
            TextEditingController(text: question['option1']);
        final TextEditingController option2Controller =
            TextEditingController(text: question['option2']);
        final TextEditingController option3Controller =
            TextEditingController(text: question['option3']);
        final TextEditingController option4Controller =
            TextEditingController(text: question['option4']);
        int selectedOption = [
          question['option1'],
          question['option2'],
          question['option3'],
          question['option4'],
        ].indexOf(question['answer']);

        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
          ),
          child: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: questionController,
                      decoration:
                          const InputDecoration(labelText: 'Edit Question'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: option1Controller,
                            decoration:
                                const InputDecoration(labelText: 'Option A'),
                          ),
                        ),
                        Radio<int>(
                          value: 0,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: option2Controller,
                            decoration:
                                const InputDecoration(labelText: 'Option B'),
                          ),
                        ),
                        Radio<int>(
                          value: 1,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: option3Controller,
                            decoration:
                                const InputDecoration(labelText: 'Option C'),
                          ),
                        ),
                        Radio<int>(
                          value: 2,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: option4Controller,
                            decoration:
                                const InputDecoration(labelText: 'Option D'),
                          ),
                        ),
                        Radio<int>(
                          value: 3,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final updatedQuestion = Map.of(question);
                        updatedQuestion['question'] = questionController.text;
                        updatedQuestion['option1'] = option1Controller.text;
                        updatedQuestion['option2'] = option2Controller.text;
                        updatedQuestion['option3'] = option3Controller.text;
                        updatedQuestion['option4'] = option4Controller.text;
                        updatedQuestion['answer'] = [
                          option1Controller.text,
                          option2Controller.text,
                          option3Controller.text,
                          option4Controller.text,
                        ][selectedOption];
                        _draftController.updateQuestion(updatedQuestion);

                        Navigator.pop(context);
                      },
                      child: const Text('Update Question'),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _generateAndCopyPrompt() {
    final topic = _topicController.text;
    final prompt = 'Create an assessment on the following topic: $topic. '
        'Include multiple-choice questions with four options each and indicate the correct option.'
        'replay in this json format {"name": "Assessment-Name","items": [{"question": "String","answer": "String","options": ["Option1","Option2","Option3","Option4"],"type": "String"}]}';
    Clipboard.setData(ClipboardData(text: prompt));
    Get.snackbar('Prompt Copied',
        'The prompt has been copied to the clipboard. Please paste it into your preferred AI model.');
  }

  void _showDeleteForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('are_you_sure_to_delete_this_question'.tr),
              TextButton(
                onPressed: () {
                  throw UnimplementedError();
                },
                child: Text('confirm_delete'.tr),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showQuestionForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final TextEditingController questionController =
            TextEditingController();
        final TextEditingController option1Controller = TextEditingController();
        final TextEditingController option2Controller = TextEditingController();
        final TextEditingController option3Controller = TextEditingController();
        final TextEditingController option4Controller = TextEditingController();
        int selectedOption = 0; // Default selected option

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: questionController,
                    decoration: const InputDecoration(labelText: 'Question'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: option1Controller,
                          decoration: InputDecoration(labelText: 'option_a'.tr),
                        ),
                      ),
                      Radio<int>(
                        value: 0,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: option2Controller,
                          decoration: InputDecoration(labelText: 'option_b'.tr),
                        ),
                      ),
                      Radio<int>(
                        value: 1,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: option3Controller,
                          decoration: InputDecoration(labelText: 'option_c'.tr),
                        ),
                      ),
                      Radio<int>(
                        value: 2,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: option4Controller,
                          decoration: InputDecoration(labelText: 'option_d'.tr),
                        ),
                      ),
                      Radio<int>(
                        value: 3,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (questionController.text.isEmpty ||
                          option1Controller.text.isEmpty ||
                          option2Controller.text.isEmpty ||
                          option3Controller.text.isEmpty ||
                          option4Controller.text.isEmpty) {
                        // Show an error message
                        Get.snackbar('Error', 'Please fill in all fields.');
                      } else if ({
                            option1Controller.text,
                            option2Controller.text,
                            option3Controller.text,
                            option4Controller.text,
                          }.length <
                          4) {
                        // Show an error message if options are not unique
                        Get.snackbar('Error', 'Options must be unique.');
                      } else {
                        final options = [
                          option1Controller.text,
                          option2Controller.text,
                          option3Controller.text,
                          option4Controller.text,
                        ];
                        MCQ mcq = MCQ(
                          question: questionController.text,
                          options: options,
                          answer: options[selectedOption],
                        );
                        _draftController.addQuestion(mcq);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('save_question'.tr),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showQuestionTypeSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              title: const Text('Multiple Choice Question'),
              onTap: () => _showQuestionForm(context),
            ),
            ListTile(
              title: const Text(
                  'More assessment item types can be added in future releases.'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
