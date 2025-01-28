import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/shared_prefs.dart';

class OnboardingPage extends StatefulWidget {
  final String completionPage;

  const OnboardingPage({
    super.key,
    this.completionPage = '/signup',
  });

 
  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  
  final PageController _pageController = PageController();

  int _currentPage = 0;
  bool _fade = true;

  List<Map<String, String>> onboardingData = [
    {
      'image': 'audio_conversation.svg',
      'title': 'Faster Learning',
      'content': "Learn anything in a matter of second's",
    },
    {
      'image': 'educator.svg',
      'title': 'Expert Creators',
      'content':
          'Your teachers are not jsut Content Creators but experts and passionate mentors'
    },
    {
      'image': 'favourite_item.svg',
      'title': 'Earn while you learn',
      'content':
          'Share your expertize, Offer Mentorship and Teach the World. We will pay for you'
    },
    {
      'image': 'team_effort.svg',
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
            top: 100,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      duration: 300.ms,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: index == _currentPage
                            ? Colors.blue
                            : Colors.lightBlueAccent,
                      ),
                      width: index == _currentPage ? 50 : 10,
                      height: 10,
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
                .map((item) =>
                    SvgPicture.asset("assets/images/${item['image']}"))
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
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
                } else {
                  SharedPrefsUtil.setOnboardingShown(true);
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

  @override
  void initState() {
    super.initState();
  }
}
