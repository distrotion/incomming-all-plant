import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../page2.dart';

class P01CENTERSELECTmain extends StatefulWidget {
  const P01CENTERSELECTmain({Key? key}) : super(key: key);

  @override
  State<P01CENTERSELECTmain> createState() => _P01CENTERSELECTmainState();
}

class _P01CENTERSELECTmainState extends State<P01CENTERSELECTmain> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < USERDATA.LOCATIONList.length; i++) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onDoubleTap: () {
                  print(USERDATA.LOCATIONList[i]);
                  // if (USERDATA.LOCATIONList[i] == "BP12-GAS") {
                  //   CuPage = Page2();
                  //   MainBodyContext.read<ChangePage_Bloc>()
                  //       .add(ChangePage_nodrower());
                  // }
                  CuPage = Page2();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text(USERDATA.LOCATIONList[i]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
