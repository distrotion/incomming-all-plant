import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/ChangePageEvent.dart';
import '../data/datapattern.dart';
import '../data/global.dart';
import '../mainBody.dart';
import '../widget/QCWIDGET/W1SINGLESHOT/SINGLESHOTwidget.dart';
import '../widget/QCWIDGET/W1SINGLESHOTIMG/SINGLESHOTIMGwidget.dart';
import '../widget/QCWIDGET/W2MULTISHOT/MULTISHOTwidget.dart';
import '../widget/QCWIDGET/consolelayout.dart';
import '../widget/common/Checkbox.dart';
import '../widget/common/Radiobutton.dart';
import '../widget/common/imgset.dart';

import 'TEST.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1();
    // return Page31();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onTap: () {
    //     CuPage = Page2();
    //     CuPageLV = 1;
    //     MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
    //   },
    //   child: Center(
    //     child: Container(
    //       height: 100,
    //       width: 200,
    //       color: Colors.orange,
    //       child:
    //           const Center(child: Text("initial Page \nor do something wrong")),
    //     ),

    //   ),
    // );
    // return Center(child: Page1());
    return SINGLESHOTIMGmain(
      //------ Left
      LABEL: "TEST",
      PO: '',
      CP: '',
      QTY: '',
      PROCESS: '',
      CUSLOT: '',
      TPKLOT: '',
      FG: '',
      CUSTOMER: '',
      PART: '',
      PARTNAME: '',
      MATERIAL: '',
      //------- Top
      ItemPickres: (v) {},
      ItemPick: [''],
      PCS: '',
      PCSleft: '',
      POINTs: '',
      UNIT: '',
      INTERSEC: '',
      RESULTFORMAT: '',
      Ghtype: '',
      //------- Bottom
      ACCEPT: (v) {},
      FINISH: (v) {},
      preview: [],
      confirmdata: [],
      wchild: Column(
        children: [
          // FileUploadButton01(),
          // FileUploadButton01(),
          // FileUploadButton01(),
          // FileUploadButton01(),
        ],
      ),
      //------- Right
      CLEAR: (v) {},
      BACKPAGE: (v) {},
      RESETVALUE: (v) {},
      ITEMleftUNIT: [],
      ITEMleftVALUE: [],
    );
  }
}
