import 'package:flutter/material.dart';

import '/src/features/homepage/p/w/upcomming_feature.dart';
import 'joined_batches.dart';
import 'quizzes_grid_widget.dart';

class ProfileUploads extends StatelessWidget {
  final bool isOwnProfile;

  const ProfileUploads({super.key, required this.isOwnProfile});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: isOwnProfile ? 3 : 2, // Number of tabs
      child: Column(
        children: <Widget>[
          TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              const Tab(text: 'Classes'),
              const Tab(text: 'Quizzes'),
              if (isOwnProfile) const Tab(text: 'Joined Batches'),
            ],
          ), 
          Expanded(
            child: TabBarView(
              children: [
                const UpcomingFeature(featureName: 'Classes'),
                const QuizzesGrid(),
                if (isOwnProfile) const JoinedBatches(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
