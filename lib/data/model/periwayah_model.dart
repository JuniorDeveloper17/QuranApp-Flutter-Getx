class PeriwayahModel {
  String? name;
  String? id;
  int? available;

  PeriwayahModel({this.name, this.id, this.available});

  PeriwayahModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['available'] = this.available;
    return data;
  }
}
