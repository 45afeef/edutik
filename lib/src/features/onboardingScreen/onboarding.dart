import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _fade = true;

  List<Map<String, String>> onboardingData = [
    {
      'image':
          'https://images.unsplash.com/photo-1720048171419-b515a96a73b8?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Title 111',
      'content': 'Content for page 1111'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1727775909609-7cf324b9a46d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Title 22222',
      'content': 'Content for page 2222'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1728088734769-9cc6bef11087?q=80&w=1886&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'title': 'Title 3333',
      'content': 'Content for page 3333'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 300,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _fade = false;
                      });
                      Future.delayed(const Duration(milliseconds: 500), () {
                        setState(() {
                          _currentPage = index;
                          _fade = true;
                        });
                      });
                    },
                    children: onboardingData
                        .map((item) => Image.network(item['image']!))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 200,
            left: 50,
            child: _fade
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        onboardingData[_currentPage]['title']!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ).animate().fadeIn().slideY(begin: 1),
                      Text(onboardingData[_currentPage]['content']!)
                          .animate(delay: 500.ms)
                          .fadeIn()
                          .slideY(begin: 1),
                    ],
                  )
                : const SizedBox(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
