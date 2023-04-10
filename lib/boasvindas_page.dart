import 'dart:io';

import 'package:agportalservidorapp/content_login/home_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class boasvindas extends StatefulWidget {
  const boasvindas({super.key});

  @override
  State<boasvindas> createState() => _boasvindasState();
}

class _boasvindasState extends State<boasvindas> {
  @override
  void initState() {
    super.initState();
    getDownloadPath();
    verificarToken().then(
      (value) async {
        if (false) {
        } else {
          sleep(Duration(seconds: 2));
          await Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 5, 53, 125),
      ),
    );
  }

  Future<bool> verificarToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      return true;
    } else {
      return false;
    }
  }
}

Future<String?> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');

      if (!await directory.exists())
        directory = await getExternalStorageDirectory();
    }
  } catch (err, stack) {
    print("Cannot get download folder path");
  }
  return directory?.path;
}
