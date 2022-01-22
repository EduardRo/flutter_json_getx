import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbum() async {
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
  int counter = 0;
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

                return Container(
                  color: Colors.black45,
                  child: ListView.builder(
                      itemCount: resData != null ? resData.length : 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (index == counter)
                                Card(
                                  //borderOnForeground: false,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  elevation: 15.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Image.network(
                                      resData?[index].enuntUrl ?? "",
                                      height: 150,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              if (index == counter)
                                // primul button
                                Card(
                                  color: Colors.blue,
                                  shadowColor: Colors.black,
                                  elevation: 15.0,
                                  child: Column(
                                    children: [
                                      if (index == counter)
                                        Text('$index - $counter')
                                      else
                                        Text(
                                            'asta-i nu este bun - $index - $counter'),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              counter = counter + 1;
                                            });
                                            print(resData?[index].var1);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              resData?[index].v1Url ?? "",
                                              height: 100,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (index == counter)
                                Card(
                                  color: Colors.blue,
                                  shadowColor: Colors.black,
                                  elevation: 10.0,
                                  child: Column(
                                    children: [
                                      Text(index.toString()),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            print(resData?[index].var2);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              resData?[index].v2Url ?? "",
                                              height: 100,
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (index == counter)
                                Card(
                                  color: Colors.blue,
                                  shadowColor: Colors.black,
                                  elevation: 10.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        print(resData?[index].raspuns);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          resData?[index].raspunsUrl ?? "",
                                          height: 100,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }),
                );
              } else if (snapshot.hasError) {
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
