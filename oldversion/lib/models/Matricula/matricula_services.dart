import 'dart:convert';
import 'package:portalservidorapp/models/Matricula/drawmatricula.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';


class ApiMatriculaDataServices {
  String endpoint = '';
  
  Future<List<MatriculaGetData>?> getMatriculaData() async {
    Response responsta = await get(Uri.parse(endpoint));
    if (responsta.statusCode == 200) {
      final List<MatriculaGetData> resultadolista = jsonDecode(responsta.body)['data'];
      return resultadolista;
    } else {
      
      throw Exception(responsta.reasonPhrase);
       
    }
  }
}





