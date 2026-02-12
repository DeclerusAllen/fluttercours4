import "package:flutter/material.dart";
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final String imageUrl = "https://www.bigfootdigital.co.uk/wp-content/uploads/2020/07/image-optimisation-scaled.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Taxi"),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset(
              "assets/images/kamyonet.png",
              width: 320.0,
              height: 240.0,
            ),
            Divider(),
            Image.network(
              imageUrl,
              loadingBuilder: (context, child, progress){
                return progress == null ? child : CircularProgressIndicator();
              },
              width: 320.0,
              height: 240.0,
            )
          ],
        )
      )
    );
  }
}



class MyStorage{
  final _secureStorage = FlutterSecureStorage();

  AndroidOptions _getAndroidOptions(){
    return AndroidOptions();
  }
  Future<void> saveEmail(String email) async {
    _secureStorage.write(
      key: 'email',
      value: email,
      aOptions: _getAndroidOptions(),
    );
  }
}