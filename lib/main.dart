import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_parse/Filmler.dart';
import 'package:flutter_json_parse/FilmlerCevap.dart';
import 'package:flutter_json_parse/Kisiler.dart';
import 'package:flutter_json_parse/KisilerCevap.dart';
import 'package:flutter_json_parse/Mesajlar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void mesajPars(){
    String strVeri = '{"nesajlar" : {"mesaj_kod" : 1,"mesaj_icerik" : "başarılı" }}';

    var jsonVeri = json.decode(strVeri);

    var jsonNesne = jsonVeri["mesajlar"];

    var mesaj = Mesajlar.fromJson(jsonNesne);

    print("Mesaj kod : ${mesaj.mesaj_kod}");
    print("Mesaj içerik : ${mesaj.mesaj_icerik}");
  }

  void kisilerParse(){
    String strVeri = '{"kisiler": [{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"}'
        ',{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912912921"}]}';

    var jsonVeri = json.decode(strVeri);

    var jsonArray = jsonVeri["kisiler"] as List;

    List<Kisiler> kisilerListesi = jsonArray.map((jsonArrayNesnesi) => Kisiler.fromJson(jsonArrayNesnesi)).toList();

    for(var k in kisilerListesi){
      print("***************");
      print("kişi id : ${k.kisi_id}");
      print("kişi ad : ${k.kisi_ad}");
      print("kişi tel : ${k.kisi_tel}");
    }
  }

  void kisilerCevapParse(){
    String strVeri = '{"succes":1,"kisiler": [{"kisi_id":"1","kisi_ad":"Ahmet","kisi_tel":"12312312"}'
        ',{"kisi_id":"2","kisi_ad":"Mehmet","kisi_tel":"912912921"}]}';

    var jsonVeri = json.decode(strVeri);

    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);

    print("Succes :  ${kisilerCevap.succes}");

    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;

    for(var k in kisilerListesi){
      print("***************");
      print("kişi id : ${k.kisi_id}");
      print("kişi ad : ${k.kisi_ad}");
      print("kişi tel : ${k.kisi_tel}");
    }
  }

  void filmlerCevapParse(){
    String strVeri = '{"success":1,"filmler":[{"film_id":"1","film_ad":"Interstellar"'
        ',"film_yil":"2015","film_resim":"interstellar.png",'
        '"kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},'
        '" yonetmen": {"yonetmen id":"1","yonetmen ad":"Christopher Nolan"}},'
        '{"film_id":"3","film_ad":"The Pianist", "film_yil":"2002","film_resim":"thepianist.png",'
        ' "kategori":{"kategori_id":"3","kategori_ad":"Drama"},'
        '"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}}]}';

    var jsonVeri = json.decode(strVeri);

    var filmlerCevap = FilmlerCevap.fromJson(jsonVeri);

    int succes = filmlerCevap.succes;

    List<Filmler> filmlerListesi = filmlerCevap.filmlerListesi;

    print("Succes : $succes");

    for(var f in filmlerListesi){
      print("***************");
      print("film id : ${f.film_id}");
      print("film ad : ${f.film_ad}");
      print("film yıl : ${f.film_yil}");
      print("film resim : ${f.film_resim}");
      print("film kategori : ${f.kategori.kategori_ad}");
      print("film yönetmen : ${f.yonetmen.yonetmen_ad}");
    }



  }

  @override
  void initState() {
    super.initState();
    //mesajPars();
    //kisilerParse();
    //kisilerCevapParse();
    filmlerCevapParse();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),

    );
  }
}
