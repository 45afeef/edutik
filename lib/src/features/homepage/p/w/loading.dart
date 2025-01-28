import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/breathing.json');
  }
}
