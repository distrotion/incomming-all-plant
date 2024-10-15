import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';

import '../../data/global.dart';
import '../../mainBody.dart';
import '../page10.dart';
import '../page11.dart';
import '../page2.dart';
import '../page3.dart';
import '../page4.dart';
import '../page5.dart';
import '../page6.dart';
import '../page7.dart';
import '../page8.dart';
import '../page9.dart';

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
            if (USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'BP12-GAS' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'BP12-PH' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'BP12-KNG' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'BP12-PVD' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'BP12-PAL' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'HES-GAS' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'HES-ISN' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'GW-GAS' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'HES-PAL' ||
                USERDATA.LOCATIONList[i].replaceAll(" ", "") == 'HES-PH') ...[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onDoubleTap: () {
                    print(USERDATA.LOCATIONList[i]);
                    if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "BP12-GAS") {
                      CuPage = Page2();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "GW-GAS") {
                      CuPage = Page3();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "BP12-PH") {
                      CuPage = Page4();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "BP12-PVD") {
                      CuPage = Page4();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "BP12-KNG") {
                      CuPage = Page9();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "BP12-PVD") {
                      CuPage = Page10();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "BP12-PAL") {
                      CuPage = Page11();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "HES-GAS") {
                      CuPage = Page5();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "HES-ISN") {
                      CuPage = Page6();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "HES-PH") {
                      CuPage = Page7();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    } else if (USERDATA.LOCATIONList[i].replaceAll(" ", "") ==
                        "HES-PAL") {
                      CuPage = Page8();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    }
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
              ),
            ],
          ],
        ],
      ),
    );
  }
}
