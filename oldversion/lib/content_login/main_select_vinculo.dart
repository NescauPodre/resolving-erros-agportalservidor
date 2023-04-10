// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:portalservidorapp/models/pagemodels.dart/pageviewnavigation.dart';
import 'package:flutter/material.dart';


List<Map> _meuJson = [
  {"id": 0234321, "name": "Matricula 234321"},
  {"id": 087896, "name": "Matricula 087896"}
];

class SelecionarVinculoPage extends StatefulWidget {
  SelecionarVinculoPage({Key? key}) : super(key: key);

  @override
  State<SelecionarVinculoPage> createState() => _SelecionarVinculoPageState();
}

String? tempsavecpf;
String? tempsavepwd;
String? selectedVinculo;


class UserVinculo {
  String? vinculo;

  UserVinculo.fromjson(Map<String, dynamic> json) {
    vinculo = json['usuvinculo'];
  }
}

class _SelecionarVinculoPageState extends State<SelecionarVinculoPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage('assets/bg4.jpg'))),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6.7, sigmaY: 6.7),
                child: Padding(
                  padding: EdgeInsets.all(_size.width * 0.1),
                  child: Stack(children: [
                    Column(
                      children: [
                        SizedBox(
                          height: _size.height * 0.30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: _size.height * 0.030),
                          child: Text(
                            'Selecione Sua Matricula',
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: _size.height * 0.02,
                                horizontal: _size.width * 0.1),
                            child: DropdownButtonFormField(
                             
                              style: TextStyle(color: Color.fromARGB(255, 15, 15, 15)),
                              alignment: Alignment.center,
                              
                              dropdownColor: Color.fromARGB(99, 233, 233, 233),
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
                              items: _meuJson.map((Map map) {
                                return  DropdownMenuItem<String>(
                                  value: map["id"].toString(),
                                  child:  Text(
                                    map["name"],
                                    style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                );
                              }).toList(),
                              value: selectedVinculo,
                              onChanged: ((String? value) {
                                setState(() {
                                  selectedVinculo = value;
                                });
                              }),
                            )),
                        Container(
                          width: _size.width * 0.6,
                          height: _size.height * 0.08,
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
                              child: Text("Entrar",
                                  style:  GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),),
                              onPressed: () {
                                if (selectedVinculo != null &&
                                    selectedVinculo != '') {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              customnavigation())));
                                } else {
                                  const snack = SnackBar(
                                    content: Text('Vinculo Obrigatório'),
                                    duration: Duration(milliseconds: 3000),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snack);
                                }
                              }),
                        ),
                      ],
                    ),
                  ]),
                ),
              ))),
    );
  }
}
