import 'dart:async';
import 'dart:convert';
import 'package:getx_app/getx_http_json_mate_mato/models/model.dart';

import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Album>?> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'http://127.0.0.1/mate-mato/api/teste-cls-idtest.php?codserie=M09AL05'));
    //print(response.body);

    if (response.statusCode == 200) {
      List<Album> albums = [];
      List<dynamic> albumsJson = jsonDecode(response.body);

      for (var oneAlbum in albumsJson) {
        Album album = Album.fromJson(oneAlbum);
        albums.add(album);
      }
      //print(albums.map((e) => e.idtest));

      return albums;
    } else {
      throw Exception('Failed to load album!');
    }
  }
}
