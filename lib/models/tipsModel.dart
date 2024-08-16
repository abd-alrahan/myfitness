class TipsModel {
  final String description;
  final int categoryId;
  final int? id;

  TipsModel({required this.description, required this.categoryId, this.id});

  factory TipsModel.fromJson(Map<String, dynamic> jsondata) {
    return TipsModel(
      description: jsondata['description'],
      categoryId: jsondata['category_id'],
      id: jsondata['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'category_id': categoryId, 'id': id};
  }
}