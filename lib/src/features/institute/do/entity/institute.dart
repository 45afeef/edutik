class Institute {
  final String? id;
  final String name;
  final String address;
  final List<String> phoneNumbers;
  final String profileUrl;

  // field populated from other entities.
  // foreign keys or references
  final List<String>? publicAssessmentRefs;
  final List<String> editors;

  Institute({
    this.id,
    required this.name,
    required this.address,
    required this.phoneNumbers,
    required this.profileUrl,
    this.publicAssessmentRefs,
    required this.editors,
  });

  factory Institute.empty() => Institute(
        id: '',
        name: '',
        address: '',
        phoneNumbers: [],
        profileUrl: '',
        publicAssessmentRefs: [],
        editors: [],
      );
}
