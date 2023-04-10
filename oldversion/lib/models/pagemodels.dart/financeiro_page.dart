import 'package:portalservidorapp/buttonmodels/buttonmodels.dart';
import 'package:portalservidorapp/buttonmodels/formulariosmodels.dart';

import 'package:portalservidorapp/models/pagemodels.dart/pageviewnavigation.dart';
import 'package:portalservidorapp/services/PdfMatgenerator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portalservidorapp/models/pagemodels.dart/solicitacao_page.dart';

class FinanceiroPage extends StatefulWidget {
  FinanceiroPage({Key? key}) : super(key: key);

  @override
  State<FinanceiroPage> createState() => _FinanceiroPageState();
}

PageController finanpageviewcontroller = PageController(initialPage: 2);

class _FinanceiroPageState extends State<FinanceiroPage>
    with TickerProviderStateMixin {
  List items = [];

  @override
  void initState() {
    pdfUint8Lis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabbarcontroller = TabController(length: 3, vsync: this);
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 246, 246),
      appBar: null,
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _size.width * 0.08, vertical: _size.height * 0.06),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // Cabeçalho completo
                  width: _size.width * 0.80,
                  height: _size.height * 0.097,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: _size.height * 0.10,
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(right: _size.width * 0.02),
                              width: _size.width * 0.45,
                              height: _size.height * 0.03,
                              child: Text(
                                "$username",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.inter(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff000000)),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(right: _size.width * 0.02),
                              width: _size.width * 0.40,
                              height: _size.height * 0.03,
                              child: Text(
                                "$company",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.inter(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(150, 0, 0, 0)),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(right: _size.width * 0.02),
                              width: _size.width * 0.40,
                              height: _size.height * 0.03,
                              child: Text(
                                "$matricula",
                                textAlign: TextAlign.right,
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(150, 0, 0, 0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: _size.height * 0.01),
                        child: Container(
                          height: _size.height * 0.09,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(
                                offset: Offset(-3, 3),
                                blurRadius: 5,
                                color: Color(0xffCBCBCB))
                          ], borderRadius: BorderRadius.circular(10)),

                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/exampleprofile.png")),
                          //Imagem de perfil do usuario
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _size.height * 0.01),
                  child: ContraChequeButton(),
                ),
                CompRendButton(),
                FichaFinanceiraButton(),
                SizedBox(
                  height: _size.height * 0.015,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, -1),
                            blurRadius: 5,
                            color: Color.fromARGB(81, 0, 0, 0)),
                        BoxShadow(
                            offset: Offset(-2, 2.5),
                            blurRadius: 1,
                            color: Color.fromARGB(133, 72, 141, 245)),
                      ]),
                  height: _size.height * 0.235,
                  width: _size.width * 0.90,
                  child: PageView(
                    controller: finanpageviewcontroller,
                    allowImplicitScrolling: false,
                    onPageChanged: ((index) {}),
                    children: [
                      contracheque(),
                      CompRendimentos(),
                      FichaFinanceira()
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(_size.width * 0, _size.height * 0.05, 0, 0),
            child: menudraw(),
          )
        ]),
      ),
    );
  }
}

class CompRendimentos extends StatefulWidget {
  CompRendimentos({Key? key}) : super(key: key);

  @override
  State<CompRendimentos> createState() => _CompRendimentosState();
}

class _CompRendimentosState extends State<CompRendimentos> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.234,
      width: _size.width * 0.80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                offset: Offset(-5, 4),
                color: Color.fromARGB(111, 91, 153, 212),
                blurRadius: 3),
            BoxShadow(
                offset: Offset(1, -1),
                color: Color.fromARGB(111, 91, 153, 212),
                blurRadius: 2)
          ]),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Center(
                  child: Text(
                    'Comprovante de Rendimentos',
                    style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000)),
                  ),
                ),
                height: _size.height * 0.045,
                width: _size.width * 0.67,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 2),
                          color: Color.fromARGB(138, 29, 75, 117),
                          blurRadius: 2),
                      BoxShadow(
                          offset: Offset(1, 0),
                          color: Color.fromARGB(138, 29, 75, 117),
                          blurRadius: 1)
                    ]),
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.height * 0.04, horizontal: _size.width * 0.02),
            child: SizedBox(
              height: _size.height * 0.055,
              child: Row(
                children: [
                  SizedBox(
                    width: _size.width * 0.29,
                    child: Center(
                      child: Text(
                        'Ano:',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: _size.width * 0.013,
                    ),
                    child: Container(
                      width: _size.width * 0.34,
                      child: Center(
                        child: Text('0000',
                            style: GoogleFonts.inter(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000))),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffC4E0EE),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-2, 2),
                                blurRadius: 1,
                                color: Color.fromARGB(100, 27, 120, 166))
                          ]),
                    ),
                  ),
                  Container(
                    width: _size.width * 0.112,
                    height: _size.height * 0.08,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-2, 2.5),
                              color: Color.fromARGB(127, 72, 141, 245))
                        ],
                        color: Color(0xff5185B7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      child: Transform.rotate(
                        alignment: Alignment.center,
                        angle: 0,
                        child: Image.asset(
                          'assets/arrow.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _size.height * 0.010),
            child: Container(
              width: double.infinity,
              height: _size.height * 0.045,
              decoration: BoxDecoration(
                  color: Color(0xff5185B7),
                  borderRadius: BorderRadius.circular(11)),
              child: InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0xff6392C0),
                        context: context,
                        builder: ((context) => PDFView()));
                  },
                  child: Center(
                    child: Text(
                      'Imprimir',
                      style: GoogleFonts.inter(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

//------------------------------------------------------------------------------------------------------

class contracheque extends StatefulWidget {
  contracheque({Key? key}) : super(key: key);

  @override
  State<contracheque> createState() => _contrachequeState();
}

class _contrachequeState extends State<contracheque> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      //contra cheque card------------------------------------------------------------
      height: _size.height * 0.235,
      width: _size.width * 0.80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                offset: Offset(-5, 4),
                color: Color.fromARGB(111, 91, 153, 212),
                blurRadius: 3),
            BoxShadow(
                offset: Offset(1, -1),
                color: Color.fromARGB(111, 91, 153, 212),
                blurRadius: 2)
          ]),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Center(
                  child: Text(
                    'Contra Cheque',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000)),
                  ),
                ),
                height: _size.height * 0.045,
                width: _size.width * 0.35,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 2),
                          color: Color.fromARGB(138, 29, 75, 117),
                          blurRadius: 2),
                      BoxShadow(
                          offset: Offset(1, 0),
                          color: Color.fromARGB(138, 29, 75, 117),
                          blurRadius: 1)
                    ]),
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.height * 0.013, horizontal: _size.width * 0.02),
            child: SizedBox(
              height: _size.height * 0.055,
              child: Row(
                children: [
                  Text(
                    'Competência:',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: _size.width * 0.013,
                    ),
                    child: Container(
                      width: _size.width * 0.34,
                      child: Center(
                        child: Text('mes/ano',
                            style: GoogleFonts.inter(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000))),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffC4E0EE),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-2, 2),
                                blurRadius: 1,
                                color: Color.fromARGB(100, 27, 120, 166))
                          ]),
                    ),
                  ),
                  Container(
                    width: _size.width * 0.112,
                    height: _size.height * 0.08,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-2, 2.5),
                              color: Color.fromARGB(127, 72, 141, 245))
                        ],
                        color: Color(0xff5185B7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      child: Transform.rotate(
                        alignment: Alignment.center,
                        angle: 0,
                        child: Image.asset(
                          'assets/arrow.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: _size.width * 0.023),
            child: SizedBox(
              height: _size.height * 0.055,
              child: Row(
                children: [
                  SizedBox(
                    width: _size.width * 0.29,
                    child: Center(
                      child: Text(
                        'Tipo:',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: _size.width * 0.013,
                    ),
                    child: Container(
                      width: _size.width * 0.34,
                      child: Center(
                        child: Text('exemplo',
                            style: GoogleFonts.inter(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000))),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffC4E0EE),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-2, 2),
                                blurRadius: 1,
                                color: Color.fromARGB(100, 27, 120, 166))
                          ]),
                    ),
                  ),
                  Container(
                    width: _size.width * 0.112,
                    height: _size.height * 0.08,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-2, 2.5),
                              color: Color.fromARGB(127, 72, 141, 245))
                        ],
                        color: Color(0xff5185B7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      child: Transform.rotate(
                        alignment: Alignment.center,
                        angle: 0,
                        child: Image.asset(
                          'assets/arrow.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _size.height * 0.009),
            child: Container(
              width: double.infinity,
              height: _size.height * 0.045,
              decoration: BoxDecoration(
                  color: Color(0xff5185B7),
                  borderRadius: BorderRadius.circular(11)),
              child: InkWell(
                  onTap: () async {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0xff6392C0),
                        context: context,
                        builder: ((context) => PDFView()));
                  },
                  child: Center(
                    child: Text(
                      'Imprimir',
                      style: GoogleFonts.inter(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------------------------------------------

class FichaFinanceira extends StatefulWidget {
  FichaFinanceira({Key? key}) : super(key: key);

  @override
  State<FichaFinanceira> createState() => _FichaFinanceiraState();
}

class _FichaFinanceiraState extends State<FichaFinanceira> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.234,
      width: _size.width * 0.80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                offset: Offset(-5, 4),
                color: Color.fromARGB(111, 91, 153, 212),
                blurRadius: 3),
            BoxShadow(
                offset: Offset(1, -1),
                color: Color.fromARGB(111, 91, 153, 212),
                blurRadius: 2)
          ]),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: Center(
                  child: Text(
                    'Ficha Financeira',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff000000)),
                  ),
                ),
                height: _size.height * 0.045,
                width: _size.width * 0.40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 2),
                          color: Color.fromARGB(138, 29, 75, 117),
                          blurRadius: 2),
                      BoxShadow(
                          offset: Offset(1, 0),
                          color: Color.fromARGB(138, 29, 75, 117),
                          blurRadius: 1)
                    ]),
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: _size.height * 0.04, horizontal: _size.width * 0.02),
            child: SizedBox(
              height: _size.height * 0.055,
              child: Row(
                children: [
                  SizedBox(
                    width: _size.width * 0.29,
                    child: Center(
                      child: Text(
                        'Ano:',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: _size.width * 0.013,
                    ),
                    child: Container(
                      width: _size.width * 0.34,
                      child: Center(
                        child: Text('0000',
                            style: GoogleFonts.inter(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000))),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffC4E0EE),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(-2, 2),
                                blurRadius: 1,
                                color: Color.fromARGB(100, 27, 120, 166))
                          ]),
                    ),
                  ),
                  Container(
                    width: _size.width * 0.112,
                    height: _size.height * 0.08,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-2, 2.5),
                              color: Color.fromARGB(127, 72, 141, 245))
                        ],
                        color: Color(0xff5185B7),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      child: Transform.rotate(
                        alignment: Alignment.center,
                        angle: 0,
                        child: Image.asset(
                          'assets/arrow.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _size.height * 0.01),
            child: Container(
              width: double.infinity,
              height: _size.height * 0.045,
              decoration: BoxDecoration(
                  color: Color(0xff5185B7),
                  borderRadius: BorderRadius.circular(11)),
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Color(0xff6392C0),
                        context: context,
                        builder: ((context) => PDFView()));
                  },
                  child: Center(
                    child: Text(
                      'Imprimir',
                      style: GoogleFonts.inter(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
