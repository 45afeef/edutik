import 'package:flutter/material.dart';

import '../../w/upcomming_feature.dart';
import 'quizzes_grid_widget.dart';

class HorizontalScrollPage extends StatelessWidget {
  final String pageName;

  const HorizontalScrollPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: Colors.primaries.map((color) {
        return Container(
          color: color,
          height: 150.0,
          child: Center(
              child: Text(
                  '$pageName Page ${Colors.primaries.indexOf(color) + 1}')),
        );
      }).toList(),
    );
  }
}

class ProfileUploads extends StatelessWidget {
  const ProfileUploads({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4, // Number of tabs
      child: Column(
        children: <Widget>[
          TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              Tab(text: 'Classes'),
              Tab(text: 'Quizzes'),
              Tab(text: 'Paid Services'),
              Tab(text: 'Monetization'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                UpcomingFeature(featureName: 'Classes'),
                QuizzesGrid(),
                UpcomingFeature(featureName: 'Paid Services'),
                UpcomingFeature(excerpt: 'You can Earn money from EduKit'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
