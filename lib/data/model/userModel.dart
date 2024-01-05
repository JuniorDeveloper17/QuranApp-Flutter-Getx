class UserModel {
  String? userName;
  String? locationName;
  String? idLocation;
  String? date;
  Historis? historis;

  UserModel(
      {this.userName,
      this.locationName,
      this.idLocation,
      this.date,
      this.historis});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    locationName = json['locationName'];
    idLocation = json['idLocation'];
    date = json['date'];
    historis = json['historis'] != null
        ? new Historis.fromJson(json['historis'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['locationName'] = this.locationName;
    data['idLocation'] = this.idLocation;
    data['date'] = this.date;
    if (this.historis != null) {
      data['historis'] = this.historis!.toJson();
    }
    return data;
  }
}

class Historis {
  String? lastRead;
  String? ayah;
  String? arti;

  Historis({this.lastRead, this.ayah, this.arti});

  Historis.fromJson(Map<String, dynamic> json) {
    lastRead = json['lastRead'];
    ayah = json['ayah'];
    arti = json['arti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastRead'] = this.lastRead;
    data['ayah'] = this.ayah;
    data['arti'] = this.arti;
    return data;
  }
}