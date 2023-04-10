import 'package:portalservidorapp/models/Matricula/matricula_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MatriculaGetData {

  String? Dataleidata ;
  String? Datasoldata ;
  String? cpfData ;
  String? matriculadata ;
  
  

  MatriculaGetData(
      {this.Dataleidata,
      this.Datasoldata,
      this.cpfData,
      this.matriculadata,
     });

  factory MatriculaGetData.fromjson(Map<String, dynamic> json) {
    return MatriculaGetData(
      Dataleidata: json['AindaNaoSei'] ?? '',
      Datasoldata: json['AindaNaoSei'] ?? '',
      cpfData: json['AindaNaoSei'] ?? '',
      matriculadata: json['AindaNaoSei'] ?? '',
    
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AindaNaoSei'] = this.Dataleidata;
    data['AindaNaoSei'] = this.Datasoldata;
    data['AindaNaoSei'] = this.cpfData;
    data['AindaNaoSei'] = this.matriculadata;
   
    return data;
  }
}

class MatriculaDraw extends StatefulWidget {
  MatriculaDraw({Key? key}) : super(key: key);

  @override
  State<MatriculaDraw> createState() => _MatriculaDrawState();
}

class _MatriculaDrawState extends State<MatriculaDraw> {
  @override
  Widget build(BuildContext context) {
   final _size = MediaQuery.of(context).size;
    

      late List<MatriculaGetData> _matriculadataexample = [];

      void _getdatamatricula() async {
        _matriculadataexample = (await ApiMatriculaDataServices().getMatriculaData())!;
        Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

      }

      void initState (){
        super.initState();
        _getdatamatricula();
      }
  //----------------------------------------------------------------------------------------------------------------------------------------------------------------------
        var matricula = MatriculaItem(
            categoria: 'Matricula', dado: 'MatriculaData.cpf.tostring()');
        var cpf = MatriculaItem(categoria: 'CPF', dado: 'MatriculaData.cpf.tostring()');
        var datasol =
            MatriculaItem(categoria: 'Data de Solicitação', dado: 'MatriculaData.datasol.tostring()');
        var datalei =
            MatriculaItem(categoria: 'Data de Leitura', dado: 'MatriculaData.datalei.tostring()');
        var situacao = MatriculaItem(categoria: 'Situação', dado: 'MatriculaData.situacao');

        List<MatriculaItem> MatriculaCategoryData = [
          matricula,
          cpf,
          datasol,
          datalei,
          situacao,
        ];
        //----------------------------------------------------------------------------------------------------------------------------------------------------------------------

        return _matriculadataexample == null || _matriculadataexample.isEmpty ? const Center(
              child: RefreshProgressIndicator(),
            ) : SizedBox(
            height: _size.height * 0.15,
            child: Column(
                children: MatriculaCategoryData.map((e) => SizedBox( height: _size.height * 0.09,
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * 0.08,
                    child: Padding(
                      padding: EdgeInsets.only(left: _size.width * 0.045),
                      child: Row(
                        children: [
                          SizedBox(
                            width: _size.width * 0.25,
                            child: Text(
                              e.categoria,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                            width: _size.width * 0.02,
                            endIndent: 8,
                            indent: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: _size.width * 0.023),
                            child: SizedBox(
                              width: _size.width * 0.50,
                              child: Text(
                                e.dado,
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: _size.height * 0.01,
                    endIndent: 8,
                    indent: 8,
                  )
                ],
              ),)).toList()));
  }
}
     
  




















//PREPARADO PARA O API ACIMA
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//ULTRAPASSADO ABAIXO
class MatriculaItem {
  final String categoria;
  final String dado;

  MatriculaItem({required this.categoria, required this.dado});
}

class Mtitems {
  static var matricula = MatriculaItem(categoria: 'Matricula', dado: 'exemplo');
  static var cpf = MatriculaItem(categoria: 'CPF', dado: '000.000.000-00');
  static var datasol =
      MatriculaItem(categoria: 'Data de Solicitação', dado: '00/00/0000');
  static var datalei =
      MatriculaItem(categoria: 'Data de Leitura', dado: '00/00/0000');
  static var situacao = MatriculaItem(categoria: 'Situação', dado: 'exemplo');

  static final List<MatriculaItem> all = [
    matricula,
    cpf,
    datasol,
    datalei,
    situacao,
  ];
}

Widget DrawMatricula(BuildContext context) {
  final _size = MediaQuery.of(context).size;
  return SizedBox(
    height: _size.height * 0.15,
    child: Column(
      children: Mtitems.all
          .map(
            (item) => SizedBox(
              height: _size.height * 0.09,
              child: Column(
                children: [
                  SizedBox(
                    height: _size.height * 0.08,
                    child: Padding(
                      padding: EdgeInsets.only(left: _size.width * 0.045),
                      child: Row(
                        children: [
                          SizedBox(
                            width: _size.width * 0.25,
                            child: Text(
                              item.categoria,
                              style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            color: Colors.black,
                            width: _size.width * 0.02,
                            endIndent: 8,
                            indent: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: _size.width * 0.023),
                            child: SizedBox(
                              width: _size.width * 0.50,
                              child: Text(
                                item.dado,
                                style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                    height: _size.height * 0.01,
                    endIndent: 8,
                    indent: 8,
                  )
                ],
              ),
            ),
          )
          .toList(),
    ),
  );
}
