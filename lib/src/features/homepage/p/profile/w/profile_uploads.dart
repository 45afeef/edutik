import 'package:flutter/material.dart';

class HorizontalScrollPage extends StatelessWidget {
  final String pageName;

  const HorizontalScrollPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: List.generate(
          10,
          (index) => Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(child: Text('$pageName Page ${index + 1}')),
          ),
        ),
      ),
    );
  }
}

class ProfileUploads extends StatelessWidget {
  const ProfileUploads({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Column(
        children: [
          const TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              Tab(text: 'Classes'),
              Tab(text: 'Exams'),
              Tab(text: 'Followers'),
              Tab(text: 'Paid Services'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const TabBarView(
              children: [
                HorizontalScrollPage(pageName: 'Classes'),
                HorizontalScrollPage(pageName: 'Exams'),
                HorizontalScrollPage(pageName: 'Followers'),
                HorizontalScrollPage(pageName: 'Paid Services'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
