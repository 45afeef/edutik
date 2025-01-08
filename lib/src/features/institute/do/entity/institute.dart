class Institute {
  final String? id;
  final String name;
  final String address;
  final String profileUrl;

  Institute({
    this.id,
    required this.name,
    required this.address,
    required this.profileUrl,
  });

  factory Institute.empty() => Institute(
        id: '',
        name: '',
        address: '',
        profileUrl: '',
      );
}
