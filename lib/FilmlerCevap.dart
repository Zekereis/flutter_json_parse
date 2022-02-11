import 'package:flutter_json_parse/Filmler.dart';

class FilmlerCevap{
  int succes;
  List<Filmler> filmlerListesi;

  FilmlerCevap(this.succes, this.filmlerListesi);

  factory FilmlerCevap.fromJson(Map<String,dynamic> json){

    var jsonArray = json["Filmler"] as List;
    List<Filmler> filmlerListesi = jsonArray.map((jsonArrayNesnesi) => Filmler.fromJson(jsonArrayNesnesi)).toList();

    return FilmlerCevap(json["succes"]as int, filmlerListesi);
  }
}