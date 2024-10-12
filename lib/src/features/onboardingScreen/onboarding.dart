import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    super.key,
    this.completionPage = '/signup',
    this.fallbackPage = '/',
  });

  final String completionPage;
  final String fallbackPage;

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
          'https://img.freepik.com/free-vector/hand-drawn-flat-design-people-waving-illustration_23-2149226266.jpg?t=st=1728727745~exp=1728731345~hmac=baf96d8fb07c830210898a5175b251036a54c9edf422fc1eb537407a25a667fb&w=996',
      'title': 'Faster Learning',
      'content': "Learn anything in a matter of second's",
    },
    {
      'image':
          'https://img.freepik.com/free-vector/college-university-graduates-illustration-afro-american-boy-glasses-girls-students_33099-473.jpg?t=st=1728728630~exp=1728732230~hmac=5a4624447d19a9ed4cc5aac65bb2875226d59d858679ed13e0b70569b336bcd4&w=740',
      'title': 'Expert Creators',
      'content':
          'Your teachers are not jsut Content Creators but experts and passionate mentors'
    },
    {
      'image':
          'https://img.freepik.com/free-vector/schoolboy-standing-books-raising-hand-speaking-pupil-reading-home-task-report-flat-vector-illustration-school-education-knowledge_74855-8576.jpg?t=st=1728728615~exp=1728732215~hmac=709de477cd747e35faa0ea6091ad46c474348aaed26cf22420ecf225cf98d5a2&w=740',
      'title': 'Earn while you learn',
      'content':
          'Share your expertize, Offer Mentorship and Teach the World. We will pay for you'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dot Indicator
          Positioned(
            top: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: index == _currentPage
                            ? Colors.blue
                            : Colors.lightBlueAccent,
                      ),
                      width: index == _currentPage ? 50 : 10,
                      height: 5,
                    ),
                  );
                },
              ),
            ),
          ),
          PageView(
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
          Positioned(
            bottom: 100,
            width: MediaQuery.of(context).size.width * 0.9,
            child: _fade
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          onboardingData[_currentPage]['title']!,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ).animate().fadeIn().slideY(begin: 1),
                        const SizedBox(height: 20),
                        Text(onboardingData[_currentPage]['content']!)
                            .animate(delay: 500.ms)
                            .fadeIn()
                            .slideY(begin: 1),
                      ],
                    ),
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
                } else {
                  Get.offAllNamed(widget.completionPage);
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
