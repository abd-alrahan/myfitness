class ExerciseModel {
  final String name;
  final int time;
  final String description;
  final dynamic json;
  final int dayId;

  ExerciseModel(
      {required this.time,
      required this.name,
      required this.description,
      required this.json,
      required this.dayId});

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'name': name,
      'description': description,
      'json': json,
      'id_day': dayId
    };
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
        time: json['time'],
        name: json['name'],
        description: json['description'],
        json: json['json'],
        dayId: json['id_day']);
  }
}
