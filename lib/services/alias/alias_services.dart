import 'package:agportalservidorapp/content_login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';


class Alias {
  String? Aliasname;
  String? Aliasvalor;

  Alias({
    this.Aliasname,
    this.Aliasvalor,
  });

  Alias.fromJson(Map<String, dynamic> json) {
    Aliasname = json['Aliasname'];
    Aliasvalor = json['Aliasvalor'];
  }
}
