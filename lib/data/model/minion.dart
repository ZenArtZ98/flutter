class MinionModel {
  final int id;
  final String name;
  final String image;
  final int attack;
  final int health;
  final String text;

  MinionModel({
    required this.id,
    required this.name,
    required this.image,
    required this.attack,
    required this.health,
    required this.text,
  });

  factory MinionModel.fromJson(Map<String, dynamic> json) {
    return MinionModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      attack: json['attack'],
      health: json['health'],
      text: json['text'],
    );
  }
}