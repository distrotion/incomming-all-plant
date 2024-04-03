import 'dart:convert';
import 'dart:typed_data';
import 'dart:js' as js;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/06-02-P06INCOMING_HESISNgetlist.dart';
import '../../../bloc/BlocEvent/06-03-P06INCOMING_HESISNgetStatus.dart';
import '../../../bloc/BlocEvent/06-04-P06INCOMING_HESISNSET.dart';
import '../../../bloc/Cubit/Rebuild.dart';
import '../../../data/Base64Img.dart';
import '../../../model/model.dart';
import '../../../styles/TextStyle.dart';

import '../../../widget/box/00-nocon.dart';
import '../../../widget/box/01-normal.dart';
import '../../../widget/box/02-nogood.dart';
import '../../../widget/box/03-waiting.dart';
import '../P06INCOMINGvar_HESISN.dart';

late BuildContext P06INCOMING_HESISNmaincontextbox;

void P06INCOMING_HESISN_ConsoleBoxBODY(dataset data, BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        // color: Colors.blue,
        child: Dialog(
            child: P06BlocBodySET(
          data: data,
        )),
      );
    },
  );
}

class P06BlocBodySET extends StatelessWidget {
  /// {@macro counter_page}
  P06BlocBodySET({
    Key? key,
    required this.data,
  }) : super(key: key);
  dataset data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P06INCOMING_HESISNSET(),
        child: BlocBuilder<P06INCOMING_HESISNSET, String>(
          builder: (context, list) {
            return P06BlocBody(
              data: data,
            );
          },
        ));
  }
}

class P06BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  P06BlocBody({
    Key? key,
    required this.data,
  }) : super(key: key);
  dataset data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P06INCOMING_HESISNgetlist(),
        child: BlocBuilder<P06INCOMING_HESISNgetlist, List<listdataincomming>>(
          builder: (context, list) {
            return P06BlocBodyget(
              data: data,
              list: list,
            );
          },
        ));
  }
}

class P06BlocBodyget extends StatelessWidget {
  /// {@macro counter_page}
  P06BlocBodyget({
    Key? key,
    required this.data,
    this.list,
  }) : super(key: key);
  dataset data;
  List<listdataincomming>? list;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P06INCOMING_HESISNgetstatus(),
        child: BlocBuilder<P06INCOMING_HESISNgetstatus, statusinc>(
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
    P06INCOMINGvar_HESISN.ItemNow = 0;
    context.read<P06INCOMING_HESISNgetlist>().add(GetDataPressed());
  }

  @override
  Widget build(BuildContext context) {
    P06INCOMING_HESISNmaincontextbox = context;
    List<listdataincomming> _list = widget.list ?? [];
    statusinc _status = widget.status ?? statusinc();
    List<Widget> CONCOLE = [];
    Widget con = NOCON(
      load: _list.length > 0,
    );

    if (_list.length > 0) {
      if (_list[P06INCOMINGvar_HESISN.ItemNow].ITEMcode != '' &&
          _list[P06INCOMINGvar_HESISN.ItemNow].ITEMcode != '-') {
        //
        if (P06INCOMINGvar_HESISN.modeNOGOOD == false) {
          if (_status.status == 'GOOD' ||
              _status.status == 'reject' ||
              _status.status == '' ||
              _status.status == '-') {
            con = NormalCheck(
              PCS: _list[P06INCOMINGvar_HESISN.ItemNow].pcs,
              Fre: _list[P06INCOMINGvar_HESISN.ItemNow].fre,
              status: _status.status, //GOOD //reject
              botonCOLOR: _status.status == '',
              modeNOGOODRT: (s) {
                // print(s); //Good=true,NoGood=false
                if (s) {
                  context.read<P06INCOMING_HESISNSET>().add(SETDataPressedST(
                        ITEMcode: _list[P06INCOMINGvar_HESISN.ItemNow].ITEMcode,
                      ));
                } else {
                  setState(() {
                    P06INCOMINGvar_HESISN.modeNOGOOD = true;
                  });
                }
              },
            );
          } else {
            con = WattingItem(
              PCS: _list[P06INCOMINGvar_HESISN.ItemNow].pcs,
              Fre: _list[P06INCOMINGvar_HESISN.ItemNow].fre,
              Confirm: (b) {
                context.read<P06INCOMING_HESISNSET>().add(SETDataPressedST(
                      ITEMcode: _list[P06INCOMINGvar_HESISN.ItemNow].ITEMcode,
                    ));
              },
              NOConfirm: (b) {
                context.read<P06INCOMING_HESISNSET>().add(SETDataPressedRJ(
                      ITEMcode: _list[P06INCOMINGvar_HESISN.ItemNow].ITEMcode,
                    ));
              },
            );
          }
        } else {
          con = NOGOODconfirm(
            NoGoodPage: P06INCOMINGvar_HESISN_NOGOODcon.NoGoodPage,
            yesno: P06INCOMINGvar_HESISN_NOGOODcon.yesno,
            yesnoRT: (n) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.yesno = n;
              });
            },
            SpacialAccText: P06INCOMINGvar_HESISN_NOGOODcon.SpacialAccText,
            SpacialAccTextrt: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.SpacialAccText = s;
              });
            },
            attper: P06INCOMINGvar_HESISN_NOGOODcon.attper,
            attperrt: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.attper = s;
              });
            },
            PiecesDropdownSelected:
                P06INCOMINGvar_HESISN_NOGOODcon.PiecesDropdownSelected,
            PiecesDropdownSelectedRT: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.PiecesDropdownSelected = s;
              });
            },
            NextorBack: (s) {
              if (P06INCOMINGvar_HESISN_NOGOODcon.yesno == 1) {
                // print("NEXT");
                setState(() {
                  P06INCOMINGvar_HESISN_NOGOODcon.NoGoodPage = 2;
                });
              } else {
                // print("BACK");
                setState(() {
                  P06INCOMINGvar_HESISN.modeNOGOOD = false;
                });
              }
            },
            base64pic01: P06INCOMINGvar_HESISN_NOGOODcon.base64pic01,
            base64pic01RT: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.base64pic01 = s;
              });
            },
            base64pic02: P06INCOMINGvar_HESISN_NOGOODcon.base64pic02,
            base64pic02RT: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.base64pic02 = s;
              });
            },
            base64pic03: P06INCOMINGvar_HESISN_NOGOODcon.base64pic03,
            base64pic03RT: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.base64pic03 = s;
              });
            },
            base64pic04: P06INCOMINGvar_HESISN_NOGOODcon.base64pic04,
            base64pic04RT: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.base64pic04 = s;
              });
            },
            base64pic05: P06INCOMINGvar_HESISN_NOGOODcon.base64pic05,
            base64pic05RT: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.base64pic05 = s;
              });
            },
            NoGoodPageRT: (s) {
              setState(() {
                P06INCOMINGvar_HESISN_NOGOODcon.NoGoodPage = 1;
              });
            },
            modeNOGOODRT: (s) {
              //Finish
              // print(s);
              context.read<P06INCOMING_HESISNSET>().add(SETDataPressedW8(
                    ITEMcode: _list[P06INCOMINGvar_HESISN.ItemNow].ITEMcode,
                  ));
              setState(() {
                P06INCOMINGvar_HESISN.modeNOGOOD = false;
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

    print('--->${P06INCOMINGvar_HESISN.ItemNow}');

    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MATNRnow = widget.data.f01;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CHARGnow = widget.data.f05;
    //-------------------------------------------------------------------  INFORMATION
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MBLNRnow = widget.data.f11;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.BWARTnow = widget.data.f12;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MENGEnow = widget.data.f13;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MEINSnow = widget.data.f14;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MAT_FGnow = widget.data.f15;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.KUNNRnow = widget.data.f16;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.SORTLnow = widget.data.f17;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.NAME1now = widget.data.f18;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CUST_LOTnow = widget.data.f19;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NMnow = widget.data.f20;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NOnow = widget.data.f21;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PROCESSnow = widget.data.f22;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.OLDMAT_CPnow = widget.data.f23;
    P06INCOMINGvar_HESISN_INCOMINGDATAoutput.STATUSnow = widget.data.f24;
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
                                        "USER : ${P06INCOMINGvar_HESISN_INCOMINGDATAoutput.UserNO}",
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
                                      : _list[P06INCOMINGvar_HESISN.ItemNow]
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
                                  if (P06INCOMINGvar_HESISN.ItemNow > 0) {
                                    setState(() {
                                      P06INCOMINGvar_HESISN.ItemNow--;
                                    });
                                    context
                                        .read<P06INCOMING_HESISNgetstatus>()
                                        .add(GetDataPressedST(
                                          ITEMcode: _list[
                                                  P06INCOMINGvar_HESISN.ItemNow]
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
                                  if (P06INCOMINGvar_HESISN.ItemNow <
                                      _list.length - 1) {
                                    setState(() {
                                      P06INCOMINGvar_HESISN.ItemNow++;
                                    });
                                    context
                                        .read<P06INCOMING_HESISNgetstatus>()
                                        .add(GetDataPressedST(
                                          ITEMcode: _list[
                                                  P06INCOMINGvar_HESISN.ItemNow]
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
          //   'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MATNRnow}-${P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CHARGnow}'
          // ]);
          // print(
          //     'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${MATNRnow}-${CHARGnow}');
        },
      ),
    );
  }
}
