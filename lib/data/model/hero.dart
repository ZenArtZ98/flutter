class HeroModel {
  final int id;
  final String name;
  final String image;
  final int health;
  final int armor;
  final List<dynamic> childIds;
  final Map<String, dynamic> battlegrounds;

  HeroModel({
    required this.id,
    required this.name,
    required this.image,
    required this.health,
    required this.armor,
    required this.childIds,
    required this.battlegrounds,
  });

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      health: json['health'],
      armor: json['armor'],
      childIds: json['childIds'] ?? [],
      battlegrounds: json['battlegrounds'] ?? {},
    );
  }

}
