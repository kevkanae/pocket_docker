import 'package:flutter/material.dart';
import 'js.dart';
import 'package:http/http.dart' as http;

class Page1 extends StatefulWidget {
  final ipAddress;
  Page1({this.ipAddress});
  @override
  _Page1 createState() => _Page1();
}

class _Page1 extends State<Page1> {
  Future<List<Jsondata>> a = fetchPhotos(http.Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Jsondata>>(
      future: fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? PhotosList(photos: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    ));
  }
}

class PhotosList extends StatelessWidget {
  final List<Jsondata> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffe8ffff),
      appBar: AppBar(
        title: Text('V I E W'),
        centerTitle: true,
        backgroundColor: Color(0xff41aea9),
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(14.0),
            child: ListTile(
              leading: Text(photos[index].image),
              title: Text(photos[index].name[0]),
              trailing: Text(
                photos[index].state,
                style: TextStyle(
                    color: photos[index].state == 'exited'
                        ? Colors.red[300]
                        : Colors.green[300]),
              ),
              subtitle: Text(
                  'IP: ${photos[index].networksettings['Networks']['bridge']['IPAddress']}'),
              onLongPress: () {},
            ),
          );
        },
      ),
    );
  }
}
