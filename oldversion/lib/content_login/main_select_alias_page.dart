// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:ui';

import 'package:portalservidorapp/content_login/home_page.dart';
import 'package:portalservidorapp/content_login/main_select_vinculo.dart';
import 'package:portalservidorapp/models/pagemodels.dart/pageviewnavigation.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'login_page_new.dart';

class MainAliasPage extends StatefulWidget {
  const MainAliasPage({Key? key}) : super(key: key);

  @override
  State<MainAliasPage> createState() => _MainAliasPageState();
}

List<Map> _jsonAlias = [
  {"id": '.agape', "name": "Agape"},
  {"id": '087896', "name": "gbarbosa"}
];

class _MainAliasPageState extends State<MainAliasPage> {
  var _primaryColor = Color.fromRGBO(71, 66, 131, 0.2);
  var _errorColor = Colors.red;
  String? _selectedAlias;

  //------------

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: Container(
        width: _size.width,
        height: _size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              scale: 1, fit: BoxFit.cover, image: AssetImage("assets/bg4.jpg")),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: _size.height * 0.3,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Selecione o ",
                    style: TextStyle(color: Colors.white, fontSize: 27),
                  ),
                  Text(
                    "Municipio",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Theme(
                data: Theme.of(context).copyWith(canvasColor: _primaryColor),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _primaryColor),
                    child: DropdownButtonFormField(
                      style: TextStyle(color: Colors.white),
                      alignment: Alignment.center,
                      dropdownColor: _primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Selecionar',
                        labelStyle: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                        counterStyle: TextStyle(color: Colors.white),
                        focusColor: Color.fromARGB(99, 233, 233, 233),
                        fillColor: Color.fromARGB(99, 233, 233, 233),
                      ),
                      value: _selectedAlias,
                      items: _jsonAlias.map((Map map) {
                        return DropdownMenuItem<String>(
                          value: map["id"].toString(),
                          child: Text(
                            map["name"],
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _selectedAlias = value;
                        });
                      },
                      validator: (cliente) {
                        if (cliente == null || cliente == "") {
                          return "Favor, selecione um Município";
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 50),
                child: Container(
                  height: _size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(0.1, 0.1),
                      colors: <Color>[
                        Color.fromARGB(255, 8, 67, 157),
                        Color.fromARGB(255, 69, 143, 255),
                      ],
                    ),
                  ),
                  child: TextButton(
                    child: Text("Prosseguir",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      if (_selectedAlias != null && _selectedAlias != '') {
                        bool Ok = await dologin();
                        if (Ok == true) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      SelecionarVinculoPage())));
                        } else {
                          final snack = SnackBar(
                            content: Text('Login ou Cliente Invalidos'),
                            duration: Duration(milliseconds: 3000),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snack);
                        }
                      } else {
                        final snack = SnackBar(
                          content:
                              Text('Erro no Cliente, Favor Selecionar Valido'),
                          duration: Duration(milliseconds: 3000),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snack);
                      }
                    },
                  ),
                ),
              ),
              // LoginPageNew.atualAlias = _selectedAlias;
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, top: 10),
                child: Container(
                  height: _size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(0.1, 0.1),
                      colors: <Color>[
                        Color.fromARGB(255, 8, 67, 157),
                        Color.fromARGB(255, 69, 143, 255),
                      ],
                    ),
                  ),
                  child: TextButton(
                      child:
                          Text("Voltar", style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => LoginPageNew())));
                        ;
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> dologin() async {
    tempsavecpf = LoginPageNew.cpfcontroller.text;
    tempsavepwd = LoginPageNew.senhacontroller.text.toUpperCase();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obj = LoginPageNew.cpfcontroller.text;
    obj =
        obj.replaceAll('-', '').replaceAll('.', '') + _selectedAlias.toString();

    var body = jsonEncode({
      "usu_login": obj,
      "usu_pwd": md5
          .convert(utf8.encode(LoginPageNew.senhacontroller.text))
          .toString()
          .toUpperCase()
    });
    var url =
        Uri.parse('https://agportal.agapesistemas.com.br/AgPortalApi/login');
    var resposta = await http.post(
      url,
      headers: {'Accept': 'text/plain', 'content-type': 'application/json'},
      body: body,
    );
    if (resposta.statusCode == 200) {
      await sharedPreferences.setString('token', resposta.body);
      return true;
    } else {
      return false;
    }
  }
}
