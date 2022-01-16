import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://makeup-api.herokuapp.com/api/v1/products.json?product_tags=Gluten+Free&product_type=bronzer'));

  if (response.statusCode == 200) {
    List<Album> albums = [];
    List<dynamic> albumsJson = jsonDecode(response.body);

    for (var oneAlbum in albumsJson) {
      Album album = Album.fromJson(oneAlbum);
      albums.add(album);
    }

    return albums;
  } else {
    throw Exception('Failed to load album!');
  }
}

class Album {
  final int id;
  final String name;
  final String price;
  final String imageLink;

  Album(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageLink});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        imageLink: json['image_link']);
  }
}

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Album',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Album>? resData = snapshot.data;

                return ListView.builder(
                    itemCount: resData != null ? resData.length : 0,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(resData?[index].name ?? ""),
                          subtitle: Text(resData?[index].price ?? ""),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(resData?[index].imageLink ?? ""),
                            child: GestureDetector(onTap: () {}),
                          ),
                        ),
                      );
                    });
              }

              // if (snapshot.hasData) {
              //   return Text(snapshot.data!.title);
              else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
