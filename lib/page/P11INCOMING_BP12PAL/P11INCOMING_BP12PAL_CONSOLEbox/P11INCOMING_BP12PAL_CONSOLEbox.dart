import 'dart:convert';
import 'dart:typed_data';
import 'dart:js' as js;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/11-02-P08INCOMING_PH12PALgetlist.dart';
import '../../../bloc/BlocEvent/11-03-P08INCOMING_PH12PALgetStatus.dart';
import '../../../bloc/BlocEvent/11-04-P08INCOMING_PH12PALSET.dart';
import '../../../bloc/Cubit/Rebuild.dart';
import '../../../data/Base64Img.dart';
import '../../../model/model.dart';
import '../../../styles/TextStyle.dart';

import '../../../widget/box/00-nocon.dart';
import '../../../widget/box/01-normal.dart';
import '../../../widget/box/02-nogood.dart';
import '../../../widget/box/03-waiting.dart';
import '../P11INCOMINGvar_BP12PAL.dart';

late BuildContext P11INCOMING_BP12PALmaincontextbox;

void P11INCOMING_BP12PAL_ConsoleBoxBODY(dataset data, BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        // color: Colors.blue,
        child: Dialog(
            child: P11BlocBodySET(
          data: data,
        )),
      );
    },
  );
}

class P11BlocBodySET extends StatelessWidget {
  /// {@macro counter_page}
  P11BlocBodySET({
    Key? key,
    required this.data,
  }) : super(key: key);
  dataset data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P11INCOMING_BP12PALSET(),
        child: BlocBuilder<P11INCOMING_BP12PALSET, String>(
          builder: (context, list) {
            return P11BlocBody(
              data: data,
            );
          },
        ));
  }
}

class P11BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  P11BlocBody({
    Key? key,
    required this.data,
  }) : super(key: key);
  dataset data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P11INCOMING_BP12PALgetlist(),
        child: BlocBuilder<P11INCOMING_BP12PALgetlist, List<listdataincomming>>(
          builder: (context, list) {
            return P11BlocBodyget(
              data: data,
              list: list,
            );
          },
        ));
  }
}

class P11BlocBodyget extends StatelessWidget {
  /// {@macro counter_page}
  P11BlocBodyget({
    Key? key,
    required this.data,
    this.list,
  }) : super(key: key);
  dataset data;
  List<listdataincomming>? list;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P11INCOMING_BP12PALgetstatus(),
        child: BlocBuilder<P11INCOMING_BP12PALgetstatus, statusinc>(
          builder: (context, status) {
            return ConsoleBloc(
              data: data,
              list: list,
              status: status,
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
    this.status,
  }) : super(key: key);
  dataset data;
  List<listdataincomming>? list;
  statusinc? status;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConsoleWidget(
        data: data,
        list: list,
        status: status,
      ),
    );
  }
}

class ConsoleWidget extends StatefulWidget {
  ConsoleWidget({
    Key? key,
    required this.data,
    this.list,
    this.status,
  }) : super(key: key);
  dataset data;
  List<listdataincomming>? list;
  statusinc? status;

  @override
  State<ConsoleWidget> createState() => _ConsoleWidgetState();
}

class _ConsoleWidgetState extends State<ConsoleWidget> {
  @override
  void initState() {
    super.initState();
    P11INCOMINGvar_BP12PAL.ItemNow = 0;
    context.read<P11INCOMING_BP12PALgetlist>().add(GetDataPressed());
  }

  @override
  Widget build(BuildContext context) {
    P11INCOMING_BP12PALmaincontextbox = context;
    List<listdataincomming> _list = widget.list ?? [];
    statusinc _status = widget.status ?? statusinc();
    List<Widget> CONCOLE = [];
    Widget con = NOCON(
      load: _list.length > 0,
    );

    if (_list.length > 0) {
      if (_list[P11INCOMINGvar_BP12PAL.ItemNow].ITEMcode != '' &&
          _list[P11INCOMINGvar_BP12PAL.ItemNow].ITEMcode != '-') {
        //
        if (P11INCOMINGvar_BP12PAL.modeNOGOOD == false) {
          if (_status.status == 'GOOD' ||
              _status.status == 'reject' ||
              _status.status == '' ||
              _status.status == '-') {
            con = NormalCheck(
              PCS: _list[P11INCOMINGvar_BP12PAL.ItemNow].pcs,
              Fre: _list[P11INCOMINGvar_BP12PAL.ItemNow].fre,
              status: _status.status, //GOOD //reject
              botonCOLOR: _status.status == '',
              modeNOGOODRT: (s) {
                // print(s); //Good=true,NoGood=false
                if (s) {
                  context.read<P11INCOMING_BP12PALSET>().add(SETDataPressedST(
                        ITEMcode:
                            _list[P11INCOMINGvar_BP12PAL.ItemNow].ITEMcode,
                      ));
                } else {
                  setState(() {
                    P11INCOMINGvar_BP12PAL.modeNOGOOD = true;
                  });
                }
              },
            );
          } else {
            con = WattingItem(
              PCS: _list[P11INCOMINGvar_BP12PAL.ItemNow].pcs,
              Fre: _list[P11INCOMINGvar_BP12PAL.ItemNow].fre,
              Confirm: (b) {
                context.read<P11INCOMING_BP12PALSET>().add(SETDataPressedST(
                      ITEMcode: _list[P11INCOMINGvar_BP12PAL.ItemNow].ITEMcode,
                    ));
              },
              NOConfirm: (b) {
                context.read<P11INCOMING_BP12PALSET>().add(SETDataPressedRJ(
                      ITEMcode: _list[P11INCOMINGvar_BP12PAL.ItemNow].ITEMcode,
                    ));
              },
            );
          }
        } else {
          con = NOGOODconfirm(
            NoGoodPage: P11INCOMINGvar_BP12PAL_NOGOODcon.NoGoodPage,
            yesno: P11INCOMINGvar_BP12PAL_NOGOODcon.yesno,
            yesnoRT: (n) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.yesno = n;
              });
            },
            SpacialAccText: P11INCOMINGvar_BP12PAL_NOGOODcon.SpacialAccText,
            SpacialAccTextrt: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.SpacialAccText = s;
              });
            },
            attper: P11INCOMINGvar_BP12PAL_NOGOODcon.attper,
            attperrt: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.attper = s;
              });
            },
            PiecesDropdownSelected:
                P11INCOMINGvar_BP12PAL_NOGOODcon.PiecesDropdownSelected,
            PiecesDropdownSelectedRT: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.PiecesDropdownSelected = s;
              });
            },
            NextorBack: (s) {
              if (P11INCOMINGvar_BP12PAL_NOGOODcon.yesno == 1) {
                // print("NEXT");
                setState(() {
                  P11INCOMINGvar_BP12PAL_NOGOODcon.NoGoodPage = 2;
                });
              } else {
                // print("BACK");
                setState(() {
                  P11INCOMINGvar_BP12PAL.modeNOGOOD = false;
                });
              }
            },
            base64pic01: P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic01,
            base64pic01RT: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic01 = s;
              });
            },
            base64pic02: P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic02,
            base64pic02RT: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic02 = s;
              });
            },
            base64pic03: P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic03,
            base64pic03RT: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic03 = s;
              });
            },
            base64pic04: P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic04,
            base64pic04RT: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic04 = s;
              });
            },
            base64pic05: P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic05,
            base64pic05RT: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic05 = s;
              });
            },
            NoGoodPageRT: (s) {
              setState(() {
                P11INCOMINGvar_BP12PAL_NOGOODcon.NoGoodPage = 1;
              });
            },
            modeNOGOODRT: (s) {
              //Finish
              // print(s);
              context.read<P11INCOMING_BP12PALSET>().add(SETDataPressedW8(
                    ITEMcode: _list[P11INCOMINGvar_BP12PAL.ItemNow].ITEMcode,
                  ));
              setState(() {
                P11INCOMINGvar_BP12PAL.modeNOGOOD = false;
              });
            },
          );
        }
      }
    }

    // con = NormalCheck(
    //   PCS: "5",
    //   Fre: "g/s",
    //   status: "Good", //GOOD //reject
    //   botonCOLOR: false,
    //   modeNOGOODRT: (s) {
    //     print(s); //Good=true,NoGood=false
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

    print('--->${P11INCOMINGvar_BP12PAL.ItemNow}');

    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MATNRnow = widget.data.f01;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CHARGnow = widget.data.f05;
    //-------------------------------------------------------------------  INFORMATION
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MBLNRnow = widget.data.f11;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.BWARTnow = widget.data.f12;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MENGEnow = widget.data.f13;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MEINSnow = widget.data.f14;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MAT_FGnow = widget.data.f15;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.KUNNRnow = widget.data.f16;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.SORTLnow = widget.data.f17;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.NAME1now = widget.data.f18;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CUST_LOTnow = widget.data.f19;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NMnow = widget.data.f20;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NOnow = widget.data.f21;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PROCESSnow = widget.data.f22;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.OLDMAT_CPnow = widget.data.f23;
    P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.STATUSnow = widget.data.f24;
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
                            ': ' + widget.data.f07,
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
                                        "USER : ${P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.UserNO}",
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
                                      : _list[P11INCOMINGvar_BP12PAL.ItemNow]
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
                                  if (P11INCOMINGvar_BP12PAL.ItemNow > 0) {
                                    setState(() {
                                      P11INCOMINGvar_BP12PAL.ItemNow--;
                                    });
                                    context
                                        .read<P11INCOMING_BP12PALgetstatus>()
                                        .add(GetDataPressedST(
                                          ITEMcode: _list[P11INCOMINGvar_BP12PAL
                                                  .ItemNow]
                                              .ITEMcode,
                                        ));
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
                                  if (P11INCOMINGvar_BP12PAL.ItemNow <
                                      _list.length - 1) {
                                    setState(() {
                                      P11INCOMINGvar_BP12PAL.ItemNow++;
                                    });
                                    context
                                        .read<P11INCOMING_BP12PALgetstatus>()
                                        .add(GetDataPressedST(
                                          ITEMcode: _list[P11INCOMINGvar_BP12PAL
                                                  .ItemNow]
                                              .ITEMcode,
                                        ));
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
          //   'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MATNRnow}-${P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CHARGnow}'
          // ]);
          // print(
          //     'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${MATNRnow}-${CHARGnow}');
        },
      ),
    );
  }
}
