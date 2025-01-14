import 'package:flutter/material.dart';

import '../../w/upcomming_feature.dart';
import 'quizzes_grid_widget.dart';

class ProfileUploads extends StatelessWidget {
  const ProfileUploads({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: <Widget>[
          TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              Tab(text: 'Classes'),
              Tab(text: 'Quizzes'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                UpcomingFeature(featureName: 'Classes'),
                QuizzesGrid(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
