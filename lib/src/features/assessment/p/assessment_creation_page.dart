import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../da/models/items/mcq_model.dart';
import 'controllers/assessment_creation_controller.dart';

class AssessmentCreationPage extends StatelessWidget {
  final AssessmentDraftController _draftController =
      Get.put(AssessmentDraftController());
  final TextEditingController _assessmentNameController =
      TextEditingController();

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
                        controller: _assessmentNameController,
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
                    onPressed: _draftController.questions.length < 3
                        ? null
                        : () {
                            // TODO - validate the input data
                            if (_assessmentNameController.text.isEmpty) {
                              Get.snackbar(
                                'Name is missing',
                                'Choose the right name for the assessment before saving',
                              );
                              return;
                            }
                            // Save the Assessment to cloud
                            _draftController
                                .saveAssessment(_assessmentNameController.text)
                                .then((value) {
                              // Delete the Assessment details from the local draft (db)
                              _draftController
                                  .deleteAssessmentDataFromDraftTable();
                            });
                          },
                    child: Text('${'publish'.tr} ${'assessment'.tr}'),
                  ),
                ),
                const SizedBox(height: 150),
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
                        McqModel mcq = McqModel(
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
