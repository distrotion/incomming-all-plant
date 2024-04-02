import 'dart:convert';
import 'dart:typed_data';
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-02-P02INCOMING_BP12GASgetlist.dart';
import '../../../bloc/Cubit/Rebuild.dart';
import '../../../data/Base64Img.dart';
import '../../../model/model.dart';
import '../../../styles/TextStyle.dart';

import '../../../widget/box/00-nocon.dart';
import '../../../widget/box/01-normal.dart';
import '../../../widget/box/02-nogood.dart';
import '../../../widget/box/03-waiting.dart';
import '../P02INCOMINGvar_BP12GAS.dart';

void P02INCOMING_BP12GAS_ConsoleBoxBODY(dataset data, BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        // color: Colors.blue,
        child: Dialog(
            child: P02BlocBody(
          data: data,
        )),
      );
    },
  );
}

class P02BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  P02BlocBody({
    Key? key,
    required this.data,
  }) : super(key: key);
  dataset data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P02INCOMING_BP12GASgetlist(),
        child: BlocBuilder<P02INCOMING_BP12GASgetlist, List<listdataincomming>>(
          builder: (context, list) {
            return ConsoleBloc(
              data: data,
              list: list,
            );
          },
        ));
  }
}

class ConsoleBloc extends StatelessWidget {
  ConsoleBloc({
    Key? key,
    required this.data,
    this.list,
  }) : super(key: key);
  dataset data;
  List<listdataincomming>? list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConsoleWidget(
        data: data,
        list: list,
      ),
    );
  }
}

class ConsoleWidget extends StatefulWidget {
  ConsoleWidget({
    Key? key,
    required this.data,
    this.list,
  }) : super(key: key);
  dataset data;
  List<listdataincomming>? list;

  @override
  State<ConsoleWidget> createState() => _ConsoleWidgetState();
}

class _ConsoleWidgetState extends State<ConsoleWidget> {
  @override
  void initState() {
    super.initState();
    P02INCOMINGvar_BP12GAS.ItemNow = 0;
    context.read<P02INCOMING_BP12GASgetlist>().add(GetDataPressed());
  }

  @override
  Widget build(BuildContext context) {
    List<listdataincomming> _list = widget.list ?? [];
    List<Widget> CONCOLE = [];
    Widget con = NOCON();

    // con = NormalCheck(
    //   PCS: "5",
    //   Fre: "g/s",
    //   status: "Good", //GOOD //reject
    //   botonCOLOR: false,
    //   modeNOGOODRT: (s) {
    //     print(s); //Good=true,NoGood=false
    //   },
    // );

    // con = NOGOODconfirm(
    //   NoGoodPage: P02INCOMINGvar_BP12GAS_NOGOODcon.NoGoodPage,
    //   yesno: P02INCOMINGvar_BP12GAS_NOGOODcon.yesno,
    //   yesnoRT: (n) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.yesno = n;
    //     });
    //   },
    //   SpacialAccText: P02INCOMINGvar_BP12GAS_NOGOODcon.SpacialAccText,
    //   SpacialAccTextrt: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.SpacialAccText = s;
    //     });
    //   },
    //   attper: P02INCOMINGvar_BP12GAS_NOGOODcon.attper,
    //   attperrt: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.attper = s;
    //     });
    //   },
    //   PiecesDropdownSelected:
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.PiecesDropdownSelected,
    //   PiecesDropdownSelectedRT: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.PiecesDropdownSelected = s;
    //     });
    //   },
    //   NextorBack: (s) {
    //     if (P02INCOMINGvar_BP12GAS_NOGOODcon.yesno == 1) {
    //       // print("NEXT");
    //       setState(() {
    //         P02INCOMINGvar_BP12GAS_NOGOODcon.NoGoodPage = 2;
    //       });
    //     } else {
    //       // print("BACK");
    //     }
    //   },
    //   base64pic01: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic01,
    //   base64pic01RT: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic01 = s;
    //     });
    //   },
    //   base64pic02: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic02,
    //   base64pic02RT: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic02 = s;
    //     });
    //   },
    //   base64pic03: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic03,
    //   base64pic03RT: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic03 = s;
    //     });
    //   },
    //   base64pic04: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic04,
    //   base64pic04RT: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic04 = s;
    //     });
    //   },
    //   base64pic05: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic05,
    //   base64pic05RT: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic05 = s;
    //     });
    //   },
    //   NoGoodPageRT: (s) {
    //     setState(() {
    //       P02INCOMINGvar_BP12GAS_NOGOODcon.NoGoodPage = 1;
    //     });
    //   },
    //   modeNOGOODRT: (s) {
    //     //Finish
    //     print(s);
    //   },
    // );

    // con = WattingItem(
    //   PCS: "5",
    //   Fre: "g/s",
    //   Confirm: (b) {
    //     print(b);
    //   },
    //   NOConfirm: (b) {
    //     print(b);
    //   },
    // );

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
                            if (false) ReportButton(),
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
                                    child: Text(
                                  _list.length == 0
                                      ? 'Loading...'
                                      : _list[P02INCOMINGvar_BP12GAS.ItemNow]
                                          .ITEMname,
                                )),
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
                                  if (P02INCOMINGvar_BP12GAS.ItemNow > 0) {
                                    setState(() {
                                      P02INCOMINGvar_BP12GAS.ItemNow--;
                                    });
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
                                      _list.length - 1) {
                                    setState(() {
                                      P02INCOMINGvar_BP12GAS.ItemNow++;
                                    });
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
          // js.context.callMethod('open', [
          //   'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${INCOMINGDATAoutput.MATNRnow}-${INCOMINGDATAoutput.CHARGnow}'
          // ]);
          // print(
          //     'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${MATNRnow}-${CHARGnow}');
        },
      ),
    );
  }
}
