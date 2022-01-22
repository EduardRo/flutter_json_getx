import 'dart:convert';
import 'package:get/get.dart';

List<Album> productFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

String productToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  final String idtest;
  final String codclasa;
  final String codmaterie;
  final String codserie;
  final String denumireserie;
  final String enunt;
  final String var1;
  final String var2;
  final String raspuns;
  final String path;
  final String enuntUrl;
  final String v1Url;
  final String v2Url;
  final String raspunsUrl;

  Album({
    required this.idtest,
    required this.codclasa,
    required this.codmaterie,
    required this.codserie,
    required this.denumireserie,
    required this.enunt,
    required this.var1,
    required this.var2,
    required this.raspuns,
    required this.path,
    required this.enuntUrl,
    required this.v1Url,
    required this.v2Url,
    required this.raspunsUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        idtest: json['idtest'],
        codclasa: json['codclasa'],
        codmaterie: json['codmaterie'],
        codserie: json['codserie'],
        denumireserie: json['denumireserie'],
        enunt: json['enunt'],
        var1: json['var1'],
        var2: json['var2'],
        raspuns: json['raspuns'],
        path: json['path'],
        enuntUrl: json['enuntUrl'],
        v1Url: json['v1Url'],
        v2Url: json['v2Url'],
        raspunsUrl: json['raspunsUrl']);
  }

  Map<String, dynamic> toJson() => {
        "idtest": idtest,
        "codclasa": codclasa,
        "codmaterie": codmaterie,
        "codserie": codserie,
        "denumireserie": denumireserie,
        "enunt": enunt,
        "var1": var1,
        "var2": var2,
        "raspuns": raspuns,
        "path": path,
        "enuntUrl": enuntUrl,
        "v1Url": v1Url,
        "v2Url": v2Url,
        "raspunsUrl": raspunsUrl,
      };
}
