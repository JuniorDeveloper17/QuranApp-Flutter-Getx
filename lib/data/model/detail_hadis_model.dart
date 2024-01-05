class DetailHadisModel {
  String? name;
  String? id;
  int? available;
  int? requested;
  List<Hadiths>? hadiths;

  DetailHadisModel(
      {this.name, this.id, this.available, this.requested, this.hadiths});

  DetailHadisModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    available = json['available'];
    requested = json['requested'];
    if (json['hadiths'] != null) {
      hadiths = <Hadiths>[];
      json['hadiths'].forEach((v) {
        hadiths!.add(new Hadiths.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['available'] = this.available;
    data['requested'] = this.requested;
    if (this.hadiths != null) {
      data['hadiths'] = this.hadiths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hadiths {
  int? number;
  String? arab;
  String? id;

  Hadiths({this.number, this.arab, this.id});

  Hadiths.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    arab = json['arab'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['arab'] = this.arab;
    data['id'] = this.id;
    return data;
  }
}