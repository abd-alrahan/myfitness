class DeitsModel {
  final String time;
  final int dayId;
  final String description;
  final dynamic image;
  final int? id;

  DeitsModel(
      {required this.time,
      required this.dayId,
      required this.description,
      required this.image,
      this.id});

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'day_id': dayId,
      'description': description,
      'image': image,
      'id': id
    };
  }

  factory DeitsModel.fromJson(Map<String, dynamic> json) {
    return DeitsModel(
        time: json['time'],
        dayId: json['day_id'],
        description: json['description'],
        image: "http://192.168.8.220:8000/${json['image']}",
        id: json['id']);
  }
}
