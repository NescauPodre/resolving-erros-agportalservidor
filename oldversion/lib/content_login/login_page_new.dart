import 'dart:convert';
import 'dart:ui';

import 'package:portalservidorapp/buttonmodels/formulariosmodels.dart';
import 'package:portalservidorapp/content_login/login_register_page.dart';
import 'package:portalservidorapp/content_login/main_page.dart';
import 'package:portalservidorapp/services/PdfMatgenerator.dart';
import 'main_select_alias_page.dart';
import 'package:portalservidorapp/models/pagemodels.dart/pageviewnavigation.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({Key? key}) : super(key: key);
  static String? atualAlias;
  static TextEditingController cpfcontroller = TextEditingController();
  static TextEditingController senhacontroller = TextEditingController();
  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  final _formKey = GlobalKey<FormState>;

  bool isitvisible = true;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('assets/bg5.jpg'))),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.7, sigmaY: 6.7),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: _size.height * 0.27),
                  Padding(
                    padding: EdgeInsets.only(top: _size.height * 0.041),
                    child: Text(
                      'Identificação',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _size.height * 0.041),
                    child: Container(
                      height: _size.height * 0.076,
                      width: _size.width * 0.81,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-1, -1),
                                color: Color.fromARGB(190, 12, 78, 176))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff0E5CD0)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'CPF Obrigatório';
                            } else if (value.length < 14) {
                              return 'Digite um CPF Valido';
                            }
                            return null;
                          }),
                          keyboardType: TextInputType.number,
                          controller: LoginPageNew.cpfcontroller,
                          maxLength: 14,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter()
                          ],
                          onChanged: (value) {
                            setState(() {});
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.white)),
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              suffixIcon: LoginPageNew
                                      .cpfcontroller.text.isEmpty
                                  ? const Text('')
                                  : GestureDetector(
                                      onTap: (() => setState(() {
                                            LoginPageNew.cpfcontroller.clear();
                                          })),
                                      child: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ),
                              hintText: '000.000.000-00',
                              hintStyle: const TextStyle(
                                  color: Color.fromARGB(255, 161, 161, 161)),
                              labelText: 'CPF',
                              labelStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.white,
                              contentPadding:
                                  EdgeInsets.all(_size.width * 0.012),
                              alignLabelWithHint: false,
                              counterText: '',
                              counterStyle:
                                  TextStyle(height: double.minPositive)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _size.height * 0.018),
                    child: Container(
                      height: _size.height * 0.076,
                      width: _size.width * 0.81,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff0E5CD0)),
                      child: Align(
                        child: TextFormField(
                          controller: LoginPageNew.senhacontroller,
                          obscureText: isitvisible,
                          validator: (senha) {
                            if (senha == null || senha.isEmpty) {
                              return 'Senha Obrigatoria';
                            }
                            return null;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                color: Color.fromARGB(255, 161, 161, 161)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.white)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isitvisible = !isitvisible;
                                });
                              },
                              child: Icon(
                                isitvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Digite sua Senha',
                            labelText: 'Senha',
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            focusColor: Colors.white,
                            contentPadding: EdgeInsets.all(_size.width * 0.012),
                            alignLabelWithHint: false,
                            counterText: '',
                            counterStyle: TextStyle(height: double.minPositive),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _size.height * 0.008,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: _size.width * 0.10),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a Senha?',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: _size.width * 0.18),
                        child: TextButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0xff6392C0),
                                  context: context,
                                  builder: ((context) => LoginRegisterPage()));
                            },
                            child: const Text(
                              'Cadastre-se',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: _size.height * 0.055),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => MainAliasPage())));
                        ;
                      },
                      child: Container(
                        height: _size.height * 0.127,
                        width: _size.width * 0.65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment(0.1, 0.1),
                            colors: <Color>[
                              Color.fromARGB(255, 6, 55, 128),
                              Color.fromARGB(255, 69, 143, 255),
                            ],
                          ),
                        ),
                        child: Center(
                          child: const Text(
                            'Prosseguir',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






/* asudhadsad ox*/