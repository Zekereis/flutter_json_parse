import 'package:flutter_json_parse/Kisiler.dart';

class KisilerCevap{
  int succes;
  List<Kisiler> kisilerListesi;

  KisilerCevap(this.succes, this.kisilerListesi);

  factory KisilerCevap.fromJson(Map<String, dynamic> json){

    var jsonArray = json["kisiler"] as List;
    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();

    return KisilerCevap(json["succes"] as int, kisilerListesi);
  }
}