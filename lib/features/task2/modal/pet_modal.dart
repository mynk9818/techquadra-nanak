class PetModal {
  final String? name;
  final String? type;
  final String? breed;
  final String? dob;
  final String? gender;
  final String? weight;
  final String? description;
  final String? image;
  PetModal({
    this.name,
    this.type,
    this.breed,
    this.dob,
    this.gender,
    this.weight,
    this.description,
    this.image,
  });

  @override
  String toString() {
    return 'PetModal(name: $name, type: $type, breed: $breed, dob: $dob, gender: $gender, weight: $weight, description: $description, image: $image)';
  }
}
