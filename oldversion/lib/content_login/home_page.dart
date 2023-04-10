import 'package:portalservidorapp/content_login/login_page_new.dart';
import 'package:portalservidorapp/content_login/main_select_alias_page.dart';

import 'package:portalservidorapp/content_login/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
PageController pc = PageController(initialPage: 0);
class _HomePageState extends State<HomePage> {
  
  

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        
        allowImplicitScrolling: false,
        physics: NeverScrollableScrollPhysics(),
        controller: pc,
        children: const [
          MainPage(),
          LoginPageNew()
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: paginaAtual,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.list), label: "Todas"),
      //     BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoritas")
      //   ],
      // ),
    );
  }
}
