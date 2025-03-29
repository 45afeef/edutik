import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../do/assessment.dart';
import '../../controllers/assessment_controller.dart';

class LeaderboardPage extends StatefulWidget {
  final String assessmentId;
  final String? utmSource;
  final String? campaign;

  const LeaderboardPage({
    super.key,
    required this.assessmentId,
    this.utmSource,
    this.campaign,
  });

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  late Future<List<AssessmentResult>> _futureResults;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
      ),
      body: FutureBuilder<List<AssessmentResult>>(
        future: _futureResults,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error loading results"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No results found"));
          }

          final results = snapshot.data!;
          return ListView.builder(
            itemCount: results.length,
            itemBuilder: (context, index) {
              final singleResult = results[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text("${index + 1}"),
                ),
                title: Text(singleResult.studentName ?? "Unknown"),
                trailing:
                    Text((singleResult.scoredMark ?? 0).toStringAsFixed(2)),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _futureResults = _fetchResults();
  }

  Future<List<AssessmentResult>> _fetchResults() async {
    AssessmentController controller = Get.find<AssessmentController>();

    return controller.fetchAssessmentResult(
      widget.assessmentId,
      utmSource: widget.utmSource,
      campaign: widget.campaign,
    );
  }
}
