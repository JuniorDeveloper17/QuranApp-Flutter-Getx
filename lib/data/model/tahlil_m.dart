class TahlilModel {
  int? id;
  String? title;
  String? arabic;
  String? translation;

  TahlilModel({this.id, this.title, this.arabic, this.translation});

  TahlilModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    arabic = json['arabic'];
    translation = json['translation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['arabic'] = this.arabic;
    data['translation'] = this.translation;
    return data;
  }
}