import 'dart:convert';
import 'dart:typed_data';
import 'dart:js' as js;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/08-02-P08INCOMING_HESPALgetlist.dart';
import '../../../bloc/BlocEvent/08-03-P08INCOMING_HESPALgetStatus.dart';
import '../../../bloc/BlocEvent/08-04-P08INCOMING_HESPALSET.dart';
import '../../../bloc/Cubit/Rebuild.dart';
import '../../../data/Base64Img.dart';
import '../../../model/model.dart';
import '../../../styles/TextStyle.dart';

import '../../../widget/box/00-nocon.dart';
import '../../../widget/box/01-normal.dart';
import '../../../widget/box/02-nogood.dart';
import '../../../widget/box/03-waiting.dart';
import '../P08INCOMINGvar_HESPAL.dart';

late BuildContext P08INCOMING_HESPALmaincontextbox;

void P08INCOMING_HESPAL_ConsoleBoxBODY(dataset data, BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        // color: Colors.blue,
        child: Dialog(
            child: P08BlocBodySET(
          data: data,
        )),
      );
    },
  );
}

class P08BlocBodySET extends StatelessWidget {
  /// {@macro counter_page}
  P08BlocBodySET({
    Key? key,
    required this.data,
  }) : super(key: key);
  dataset data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P08INCOMING_HESPALSET(),
        child: BlocBuilder<P08INCOMING_HESPALSET, String>(
          builder: (context, list) {
            return P08BlocBody(
              data: data,
            );
          },
        ));
  }
}

class P08BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  P08BlocBody({
    Key? key,
    required this.data,
  }) : super(key: key);
  dataset data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P08INCOMING_HESPALgetlist(),
        child: BlocBuilder<P08INCOMING_HESPALgetlist, List<listdataincomming>>(
          builder: (context, list) {
            return P08BlocBodyget(
              data: data,
              list: list,
            );
          },
        ));
  }
}

class P08BlocBodyget extends StatelessWidget {
  /// {@macro counter_page}
  P08BlocBodyget({
    Key? key,
    required this.data,
    this.list,
  }) : super(key: key);
  dataset data;
  List<listdataincomming>? list;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P08INCOMING_HESPALgetstatus(),
        child: BlocBuilder<P08INCOMING_HESPALgetstatus, statusinc>(
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
    P08INCOMINGvar_HESPAL.ItemNow = 0;
    context.read<P08INCOMING_HESPALgetlist>().add(GetDataPressed());
  }

  @override
  Widget build(BuildContext context) {
    P08INCOMING_HESPALmaincontextbox = context;
    List<listdataincomming> _list = widget.list ?? [];
    statusinc _status = widget.status ?? statusinc();
    List<Widget> CONCOLE = [];
    Widget con = NOCON(
      load: _list.length > 0,
    );

    if (_list.length > 0) {
      if (_list[P08INCOMINGvar_HESPAL.ItemNow].ITEMcode != '' &&
          _list[P08INCOMINGvar_HESPAL.ItemNow].ITEMcode != '-') {
        //
        if (P08INCOMINGvar_HESPAL.modeNOGOOD == false) {
          if (_status.status == 'GOOD' ||
              _status.status == 'reject' ||
              _status.status == '' ||
              _status.status == '-') {
            con = NormalCheck(
              PCS: _list[P08INCOMINGvar_HESPAL.ItemNow].pcs,
              Fre: _list[P08INCOMINGvar_HESPAL.ItemNow].fre,
              status: _status.status, //GOOD //reject
              botonCOLOR: _status.status == '',
              modeNOGOODRT: (s) {
                // print(s); //Good=true,NoGood=false
                if (s) {
                  context.read<P08INCOMING_HESPALSET>().add(SETDataPressedST(
                        ITEMcode: _list[P08INCOMINGvar_HESPAL.ItemNow].ITEMcode,
                      ));
                } else {
                  setState(() {
                    P08INCOMINGvar_HESPAL.modeNOGOOD = true;
                  });
                }
              },
            );
          } else {
            con = WattingItem(
              PCS: _list[P08INCOMINGvar_HESPAL.ItemNow].pcs,
              Fre: _list[P08INCOMINGvar_HESPAL.ItemNow].fre,
              Confirm: (b) {
                context.read<P08INCOMING_HESPALSET>().add(SETDataPressedST(
                      ITEMcode: _list[P08INCOMINGvar_HESPAL.ItemNow].ITEMcode,
                    ));
              },
              NOConfirm: (b) {
                context.read<P08INCOMING_HESPALSET>().add(SETDataPressedRJ(
                      ITEMcode: _list[P08INCOMINGvar_HESPAL.ItemNow].ITEMcode,
                    ));
              },
            );
          }
        } else {
          con = NOGOODconfirm(
            NoGoodPage: P08INCOMINGvar_HESPAL_NOGOODcon.NoGoodPage,
            yesno: P08INCOMINGvar_HESPAL_NOGOODcon.yesno,
            yesnoRT: (n) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.yesno = n;
              });
            },
            SpacialAccText: P08INCOMINGvar_HESPAL_NOGOODcon.SpacialAccText,
            SpacialAccTextrt: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.SpacialAccText = s;
              });
            },
            attper: P08INCOMINGvar_HESPAL_NOGOODcon.attper,
            attperrt: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.attper = s;
              });
            },
            PiecesDropdownSelected:
                P08INCOMINGvar_HESPAL_NOGOODcon.PiecesDropdownSelected,
            PiecesDropdownSelectedRT: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.PiecesDropdownSelected = s;
              });
            },
            NextorBack: (s) {
              if (P08INCOMINGvar_HESPAL_NOGOODcon.yesno == 1) {
                // print("NEXT");
                setState(() {
                  P08INCOMINGvar_HESPAL_NOGOODcon.NoGoodPage = 2;
                });
              } else {
                // print("BACK");
                setState(() {
                  P08INCOMINGvar_HESPAL.modeNOGOOD = false;
                });
              }
            },
            base64pic01: P08INCOMINGvar_HESPAL_NOGOODcon.base64pic01,
            base64pic01RT: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.base64pic01 = s;
              });
            },
            base64pic02: P08INCOMINGvar_HESPAL_NOGOODcon.base64pic02,
            base64pic02RT: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.base64pic02 = s;
              });
            },
            base64pic03: P08INCOMINGvar_HESPAL_NOGOODcon.base64pic03,
            base64pic03RT: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.base64pic03 = s;
              });
            },
            base64pic04: P08INCOMINGvar_HESPAL_NOGOODcon.base64pic04,
            base64pic04RT: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.base64pic04 = s;
              });
            },
            base64pic05: P08INCOMINGvar_HESPAL_NOGOODcon.base64pic05,
            base64pic05RT: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.base64pic05 = s;
              });
            },
            NoGoodPageRT: (s) {
              setState(() {
                P08INCOMINGvar_HESPAL_NOGOODcon.NoGoodPage = 1;
              });
            },
            modeNOGOODRT: (s) {
              //Finish
              // print(s);
              context.read<P08INCOMING_HESPALSET>().add(SETDataPressedW8(
                    ITEMcode: _list[P08INCOMINGvar_HESPAL.ItemNow].ITEMcode,
                  ));
              setState(() {
                P08INCOMINGvar_HESPAL.modeNOGOOD = false;
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

    print('--->${P08INCOMINGvar_HESPAL.ItemNow}');

    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MATNRnow = widget.data.f01;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CHARGnow = widget.data.f05;
    //-------------------------------------------------------------------  INFORMATION
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MBLNRnow = widget.data.f11;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.BWARTnow = widget.data.f12;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MENGEnow = widget.data.f13;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MEINSnow = widget.data.f14;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MAT_FGnow = widget.data.f15;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.KUNNRnow = widget.data.f16;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.SORTLnow = widget.data.f17;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.NAME1now = widget.data.f18;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CUST_LOTnow = widget.data.f19;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NMnow = widget.data.f20;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NOnow = widget.data.f21;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PROCESSnow = widget.data.f22;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.OLDMAT_CPnow = widget.data.f23;
    P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.STATUSnow = widget.data.f24;
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
                                        "USER : ${P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.UserNO}",
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
                                      : _list[P08INCOMINGvar_HESPAL.ItemNow]
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
                                  if (P08INCOMINGvar_HESPAL.ItemNow > 0) {
                                    setState(() {
                                      P08INCOMINGvar_HESPAL.ItemNow--;
                                    });
                                    context
                                        .read<P08INCOMING_HESPALgetstatus>()
                                        .add(GetDataPressedST(
                                          ITEMcode: _list[
                                                  P08INCOMINGvar_HESPAL.ItemNow]
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
                                  if (P08INCOMINGvar_HESPAL.ItemNow <
                                      _list.length - 1) {
                                    setState(() {
                                      P08INCOMINGvar_HESPAL.ItemNow++;
                                    });
                                    context
                                        .read<P08INCOMING_HESPALgetstatus>()
                                        .add(GetDataPressedST(
                                          ITEMcode: _list[
                                                  P08INCOMINGvar_HESPAL.ItemNow]
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
          //   'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MATNRnow}-${P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CHARGnow}'
          // ]);
          // print(
          //     'http://172.20.30.46/ReportServer?%2fReport+Project4%2fincomming-v1&rs:Format=PDF&rs:Command=Render&T1=${MATNRnow}-${CHARGnow}');
        },
      ),
    );
  }
}
