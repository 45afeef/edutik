class Institute {
  final String? id;
  final String name;
  final String address;
  final String profileUrl;

  // field populated from other entities.
  final List<String>? publicAssessmentRefs;

  Institute({
    this.id,
    required this.name,
    required this.address,
    required this.profileUrl,
    this.publicAssessmentRefs,
  });

  factory Institute.empty() => Institute(
        id: '',
        name: '',
        address: '',
        profileUrl: '',
        publicAssessmentRefs: [],
      );
}
