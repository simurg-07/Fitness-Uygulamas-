class Veri{
  String? id;
  String? kilo;
  String? tarih;
  String? fotolink;


  Veri(this.id,this.kilo, this.tarih, this.fotolink);

  factory Veri.fromJson(String key, Map<dynamic,dynamic>json){
    return Veri(key,json["kilo"] as String, json["tarih"] as String, json["fotolink"] as String);

  }

}