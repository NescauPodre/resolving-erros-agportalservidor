import 'dart:io';
import 'package:portalservidorapp/buttonmodels/buttonmodels.dart';
import 'package:portalservidorapp/services/PdfMatgenerator.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_quill/flutter_quill.dart' hide Text;

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Requisicao extends StatefulWidget {
  Requisicao({Key? key}) : super(key: key);

  @override
  State<Requisicao> createState() => _RequisicaoState();
}

class _RequisicaoState extends State<Requisicao> {
  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}

class bottomsheetrequisicao extends StatefulWidget {
  bottomsheetrequisicao({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<bottomsheetrequisicao> createState() => _bottomsheetrequisicaoState();
}

QuillController controladorquill = QuillController.basic();

class _bottomsheetrequisicaoState extends State<bottomsheetrequisicao> {
  File? arquivo;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
        initialChildSize: 0.95,
        maxChildSize: 0.95,
        minChildSize: 0.95,
        builder: ((context, scrollController) => SingleChildScrollView(
              controller: scrollController,
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Container(
                  height: size.height * 0.95,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.079),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EditableTextformField(
                                valorinicial: 'valorinicial',
                                readonly: true,
                                controller: null,
                                validator: null,
                                texthint: 'texthint',
                                textlabel: 'De (Email):'),
                            Padding(
                              padding: EdgeInsets.fromLTRB(size.width * 0.04,
                                  size.height * 0.02, 0, size.height * 0.02),
                              child: Text(
                                'Para:',
                                style: GoogleFonts.inter(fontSize: 17),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(size.width * 0.04,
                                  size.height * 0, 0, size.height * 0.05),
                              child: Text(
                                'Company@email.com',
                                style: GoogleFonts.inter(
                                    fontSize: 17, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.06),
                              child: GestureDetector(
                                onTap: () async {
                                  /*final resultado =
                                      await FilePicker.platform.pickFiles();
                                  if (resultado != null) {
                                    final path = resultado.files.single.path!;
                                    setState(() {
                                      arquivo = File(path);
                                    });
                                  }*/
                                },
                                child: Container(
                                  width: size.height * 0.85,
                                  height: size.height * 0.08,
                                  child: Center(
                                    child: Text(
                                      'Anexar Arquivo',
                                      style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment(0.1, 0.1),
                                      colors: <Color>[
                                        Color.fromARGB(255, 39, 112, 222),
                                        Color.fromARGB(255, 69, 143, 255),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.all(7.0),
                                child: QuillToolbar.basic(
                                  controller: controladorquill,
                                )),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(2, 2),
                                        color: Colors.grey),
                                    BoxShadow(
                                        offset: Offset(-2, -2),
                                        color: Colors.grey)
                                  ]),
                              child: QuillEditor.basic(
                                  controller: controladorquill,
                                  readOnly: false),
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        //close icon
                        padding: EdgeInsets.fromLTRB(
                            size.width * 0.87, size.height * 0.001, 0, 0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey[800],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

//--------------------------------------------------------------------------------------

class novasolicitacao extends StatefulWidget {
  novasolicitacao({Key? key}) : super(key: key);

  @override
  State<novasolicitacao> createState() => _novasolicitacaoState();
}

class _novasolicitacaoState extends State<novasolicitacao>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabbarcontroller = TabController(length: 4, vsync: this);
    final size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
        initialChildSize: 0.95,
        maxChildSize: 0.95,
        minChildSize: 0.95,
        builder: ((context, scrollController) => SingleChildScrollView(
              controller: scrollController,
              child: Container(
                height: size.height * 0.9,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.013),
                          height: size.height * 0.14,
                          width: double.infinity,
                          color: Color.fromARGB(210, 55, 97, 160),
                          child: Align(
                            alignment: Alignment.center,
                            child: TabBar(
                                labelPadding:
                                    EdgeInsets.all(size.height * 0.016),
                                labelStyle: GoogleFonts.inter(fontSize: 16),
                                indicatorColor: Colors.white,
                                isScrollable: true,
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.grey[400],
                                controller: _tabbarcontroller,
                                tabs: const [
                                  Tab(
                                    text: 'Dados Pessoais',
                                  ),
                                  Tab(
                                    text: 'Beneficiário RPPS',
                                  ),
                                  Tab(
                                    text: 'Deficiência',
                                  ),
                                  Tab(
                                    text: 'Endereço',
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.6,
                          child: TabBarView(
                              controller: _tabbarcontroller,
                              children: [
                                DadosPessoaisPage(),
                                BeneficiarioPage(),
                                Deficiencia(),
                                EnderecoPage()
                              ]),
                        )
                      ],
                    ),
                    Padding(
                      //close icon
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.87, size.height * 0.001, 0, 0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.grey[800],
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }
}

//Paginas TabbarView NovaSolicitção--------------------------------------------------------------------

class EnderecoPage extends StatefulWidget {
  EnderecoPage({Key? key}) : super(key: key);

  @override
  State<EnderecoPage> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 1'),
        ),
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 2'),
        ),
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 3'),
        ),
      ],
    );
  }
}

class Deficiencia extends StatefulWidget {
  Deficiencia({Key? key}) : super(key: key);

  @override
  State<Deficiencia> createState() => _DeficienciaState();
}

class _DeficienciaState extends State<Deficiencia> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 1'),
        ),
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 2'),
        ),
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 3'),
        ),
      ],
    );
  }
}

class BeneficiarioPage extends StatefulWidget {
  BeneficiarioPage({Key? key}) : super(key: key);

  @override
  State<BeneficiarioPage> createState() => _BeneficiarioPageState();
}

class _BeneficiarioPageState extends State<BeneficiarioPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 1'),
        ),
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 2'),
        ),
        SizedBox(
          height: size.height * 0.09,
          child: Text('item 3'),
        ),
      ],
    );
  }
}

class DadosPessoaisPage extends StatefulWidget {
  DadosPessoaisPage({Key? key}) : super(key: key);

  @override
  State<DadosPessoaisPage> createState() => _DadosPessoaisPageState();
}

class _DadosPessoaisPageState extends State<DadosPessoaisPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              SizedBox(
                height: size.height * 0.6,
                child: EditableTextformField(
                  readonly: true,
                  controller: null,
                  validator: null,
                  texthint: '',
                  textlabel: 'Matrícula',
                  valorinicial: '123456',
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
                child: EditableTextformField(
                    controller: null,
                    readonly: false,
                    texthint: 'escreva',
                    textlabel: 'teste',
                    validator: null,
                    valorinicial: '1234'),
              ),
              SizedBox(
                height: size.height * 0.09,
                child: Text('item 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

class PDFView extends StatefulWidget {
  PDFView({Key? key}) : super(key: key);

  static bool isloading = true;

  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DraggableScrollableSheet(
        initialChildSize: 1,
        maxChildSize: 1,
        minChildSize: 1,
        builder: ((context, scrollController) => SingleChildScrollView(
              controller: scrollController,
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.115,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff6392C0),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(-3, 3),
                                blurRadius: 1,
                                color: Color.fromARGB(110, 72, 141, 245)),
                          ]),
                    ),
                    Center(
                      child:
                       SizedBox(
                              height: size.height * 0.84,
                              width: size.width,
                              child: SfPdfViewer.memory(pdfbytesTemporario!),
                            ),
                    )
                  ],
                ),
              ),
            )));
  }
}
