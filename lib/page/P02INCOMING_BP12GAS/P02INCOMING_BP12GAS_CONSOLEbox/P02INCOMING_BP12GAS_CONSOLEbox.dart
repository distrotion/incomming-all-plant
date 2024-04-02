import 'dart:convert';
import 'dart:typed_data';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/Cubit/Rebuild.dart';
import '../../../data/Base64Img.dart';
import '../../../model/model.dart';
import '../../../styles/TextStyle.dart';

import '../../../widget/box/00-nocon.dart';
import '../../../widget/box/01-normal.dart';
import '../../../widget/box/02-nogood.dart';
import '../../../widget/box/03-waiting.dart';
import '../P02INCOMINGvar_BP12GAS.dart';
import '00-P02INCOMING_BP12GAS_CONSOLEbox-nocon.dart';
import '01-P02INCOMING_BP12GAS_CONSOLEbox-normal.dart';
import '02-P02INCOMING_BP12GAS_CONSOLEbox-nogood.dart';
import '03-P02INCOMING_BP12GAS-waiting.dart';

void P02INCOMING_BP12GAS_ConsoleBoxBODY(dataset data, BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        // color: Colors.blue,
        child: Dialog(
            child: ConsoleBloc(
          data: data,
        )),
      );
    },
  );
}

class ConsoleBloc extends StatelessWidget {
  ConsoleBloc({
    Key? key,
    required this.data,
    this.dataBLOC,
  }) : super(key: key);
  dataset data;

  List<INCOMINGmaster>? dataBLOC;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConsoleWidget(
        data: data,
        dataBLOC: dataBLOC,
      ),
    );
  }
}

class ConsoleWidget extends StatefulWidget {
  ConsoleWidget({
    Key? key,
    required this.data,
    this.dataBLOC,
  }) : super(key: key);
  dataset data;

  List<INCOMINGmaster>? dataBLOC;
  @override
  State<ConsoleWidget> createState() => _ConsoleWidgetState();
}

class _ConsoleWidgetState extends State<ConsoleWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<INCOMINGmaster> _dataBLOC =
        widget.dataBLOC ?? [INCOMINGmaster(ITEMs: '')];
    int limmit = _dataBLOC.length;
    List<Widget> CONCOLE = [];
    Widget con = NOCON();

    con = NOGOODconfirm();
    // con = WattingItem();
    // con = NormalCheck();

    // P02INCOMINGvar_BP12GAS.ItemName =
    //     _dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].ITEMs;
    // if (limmit > 0) {
    //   if (_dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].ITEMs == '-' ||
    //       _dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].ITEMs == '') {
    //     con = const P02INCOMINGvar_BP12GAS_NOCON();
    //   } else {
    //     if (P02INCOMINGvar_BP12GAS.modeNOGOOD) {
    //       con = P02INCOMINGvar_BP12GAS_NOGOODconfirm(
    //         blockFINISH: INCOMINGDATAoutput.UserNO != '',
    //       );
    //     } else if (_dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].STATE == 'WAIT') {
    //       con = P02INCOMINGvar_BP12GAS_WattingItem(
    //         blockGood: INCOMINGDATAoutput.UserNO != '',
    //         blockReject: INCOMINGDATAoutput.UserNO != '',
    //       );
    //     } else {
    //       con = P02INCOMINGvar_BP12GAS_NormalCheck(
    //         blockGOOD: INCOMINGDATAoutput.UserNO != '',
    //         blockNOGOOD: INCOMINGDATAoutput.UserNO != '',
    //         botonCOLOR: _dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].STATE ==
    //                 'GOOD'
    //             ? false
    //             : _dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].STATE == 'reject'
    //                 ? false
    //                 : true,
    //         PCS: _dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].PCS,
    //         // Fre: _dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].FREQUENCY,
    //         status: _dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow].STATE,
    //       );
    //     }
    //   }
    // } else {
    //   con = const P02INCOMINGvar_BP12GAS_NOCON();
    // }

    print('--->${P02INCOMINGvar_BP12GAS.ItemNow}');

    INCOMINGDATAoutput.MATNRnow = widget.data.f01;
    INCOMINGDATAoutput.CHARGnow = widget.data.f05;
    //-------------------------------------------------------------------  INFORMATION
    INCOMINGDATAoutput.MBLNRnow = widget.data.f11;
    INCOMINGDATAoutput.BWARTnow = widget.data.f12;
    INCOMINGDATAoutput.MENGEnow = widget.data.f13;
    INCOMINGDATAoutput.MEINSnow = widget.data.f14;
    INCOMINGDATAoutput.MAT_FGnow = widget.data.f15;
    INCOMINGDATAoutput.KUNNRnow = widget.data.f16;
    INCOMINGDATAoutput.SORTLnow = widget.data.f17;
    INCOMINGDATAoutput.NAME1now = widget.data.f18;
    INCOMINGDATAoutput.CUST_LOTnow = widget.data.f19;
    INCOMINGDATAoutput.PART_NMnow = widget.data.f20;
    INCOMINGDATAoutput.PART_NOnow = widget.data.f21;
    INCOMINGDATAoutput.PROCESSnow = widget.data.f22;
    INCOMINGDATAoutput.OLDMAT_CPnow = widget.data.f23;
    INCOMINGDATAoutput.STATUSnow = widget.data.f24;
    //-------------------------------------------------------------------
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
          height: 500,
          width: 700,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "MATCP",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f01,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const SizedBox(
                          width: 100,
                          child: SizedBox(
                            child: Text("NAME1",
                                // style: TxtStylePOP(fontSize: 20),
                                overflow: TextOverflow.fade),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f02,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "PART_NM",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f03,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Text(
                            "PART_NO",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f04,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 100,
                          child: const Text(
                            "CHARG",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f05,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Container(
                          width: 100,
                          child: const Text(
                            "CUST_LOT",
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f06,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        const SizedBox(
                          width: 100,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "STATUS",
                              // style: TxtStylePOP(fontSize: 20)
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            ': ' + widget.data.f07,
                            // style: TxtStylePOP(fontSize: 20)
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                        height: 40,
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 15, top: 2, bottom: 2),
                                  child: Container(
                                    // color: Colors.amberAccent,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2.0, color: Colors.black),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Colors.black),
                                    child: Center(
                                      child: Text(
                                        "USER : ${INCOMINGDATAoutput.UserNO}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        )),
                    SizedBox(
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 15, top: 2, bottom: 2),
                          child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2.0, color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: PicShowFront(base64: logo),
                              )),
                        )),
                    SizedBox(
                        height: 52,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            if (_dataBLOC[P02INCOMINGvar_BP12GAS.ItemNow]
                                    .STATE ==
                                'WAIT')
                              ReportButton(),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                width: 400,
                // color: Colors.blue,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(start: 40, end: 40),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 7,
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.0, color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  color: Colors.white,
                                ),
                                // color: Colors.red,
                                child: Center(
                                    child: Text(_dataBLOC[
                                            P02INCOMINGvar_BP12GAS.ItemNow]
                                        .ITEMs)),
                              )),
                          const Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: 40,
                              )),
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  if (P02INCOMINGvar_BP12GAS.ItemNow != 0) {
                                    P02INCOMINGvar_BP12GAS.ItemNow--;
                                    BlocProvider.of<BlocPageRebuild>(context)
                                        .rebuildPage();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2.0, color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  // color: Colors.blue,
                                  child: const Center(child: Text("<")),
                                ),
                              )),
                          Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  if (P02INCOMINGvar_BP12GAS.ItemNow <
                                      limmit - 1) {
                                    P02INCOMINGvar_BP12GAS.ItemNow++;
                                    BlocProvider.of<BlocPageRebuild>(context)
                                        .rebuildPage();
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2.0, color: Colors.black),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    color: Colors.white,
                                  ),
                                  height: 40,
                                  // color: Colors.blue,
                                  child: const Center(child: Text(">")),
                                ),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(width: 350, height: 350, child: con)
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

//------------------------------------

class PicShowFront extends StatefulWidget {
  PicShowFront({Key? key, required this.base64}) : super(key: key);
  String base64;
  @override
  State createState() => new PicShowFrontState();
}

class PicShowFrontState extends State<PicShowFront> {
  // String _base64 = base64pic01;

  @override
  Widget build(BuildContext context) {
    if (widget.base64 == null) return new Container();
    Uint8List bytes = base64.decode(widget.base64);
    return Container(
      height: 50,
      child: new Image.memory(bytes),
    );
  }
}

void RedataPage() {
  // nogood = false;
  // yesno = 0;
  // attper = 0;
  // NoGoodPage = 1;
  // PiecesDropdownSelected = '1';
}

class ReportButton extends StatelessWidget {
  const ReportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        child: const Text('Report'),
        onPressed: () {
          // contexttable.read<Report_Bloc>().add(CreateReport());
          js.context.callMethod('open', [
            'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${INCOMINGDATAoutput.MATNRnow}-${INCOMINGDATAoutput.CHARGnow}'
          ]);
          // print(
          //     'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${MATNRnow}-${CHARGnow}');
        },
      ),
    );
  }
}
