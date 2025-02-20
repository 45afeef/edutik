import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/auth_service.dart';
import '../../homepage/do/content.dart';
import '../../institute/p/controllers/institute_controller.dart';
import '../da/models/course_model.dart';
import '../da/models/price_model.dart';

class CourseCreationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _bannerImageUriController =
      TextEditingController();
  final AuthService _authService = AuthService();
  final InstituteController _instituteController =
      Get.find<InstituteController>();

  CourseCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Course Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the course name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _bannerImageUriController,
                decoration:
                    const InputDecoration(labelText: 'Banner Image URI'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the banner image URI';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final currentUser = _authService.currentUser;
                    final institute = _instituteController.institute.value;

                    // Create a new course instance
                    final courseModel = CourseModel(
                      name: _nameController.text,
                      price: PriceModel(
                        amount: double.parse(_priceController.text),
                        currency: '₹',
                      ),
                      bannerImageUri: _bannerImageUriController.text,
                      creatorName: currentUser?.displayName ?? 'Unknown',
                      creatorRef: currentUser?.uid ?? '',
                      creatorType: UserType.user,
                      ownerName: institute.name,
                      ownerRef: institute.id!,
                      ownerType: UserType.institute,
                    );

                    // Handle the created course (e.g., save to a database or navigate)
                    _instituteController.saveInstitutesCourse(courseModel);
                    Get.back(result: courseModel);
                  }
                },
                child: const Text('Create Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
