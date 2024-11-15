import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../do/shorts_data.dart';
import '../controller.dart';

class ShortsCreationWidget extends StatefulWidget {
  const ShortsCreationWidget({super.key, required this.onSubmit});

  final Function() onSubmit;

  @override
  State<ShortsCreationWidget> createState() => _ShortsCreationWidgetState();
}

class _ShortsCreationWidgetState extends State<ShortsCreationWidget> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late String _description;
  late String _videoUrl;
  VideoSource? _videoSource;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '${'msg_please_enter_a_'.tr}title';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) _title = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '${'msg_please_enter_a_'.tr}description';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) _description = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Video URL'),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return '${'msg_please_enter_a_'.tr}video URL';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) _videoUrl = value;
                },
              ),
              DropdownButtonFormField<VideoSource>(
                decoration: const InputDecoration(labelText: 'Video Source'),
                value: _videoSource,
                items: VideoSource.values.map((VideoSource source) {
                  return DropdownMenuItem<VideoSource>(
                    value: source,
                    child: Text(source.toString().split('.').last),
                  );
                }).toList(),
                onChanged: (VideoSource? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _videoSource = newValue;
                    });
                  }
                },
                validator: (value) => value == null
                    ? '${'msg_please_enter_a_'.tr}video source'
                    : null,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        var controller = Get.find<CreationController>();
                        controller.isCreating = false;
                      },
                      child: Text("lbl_cancel".tr),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          // Do something with the data
                          print('Title: $_title');
                          print('Description: $_description');
                          print('Video URL: $_videoUrl');
                          print('Video Source: $_videoSource');
                        }
                      },
                      child: Text('lbl_submit'.tr),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
