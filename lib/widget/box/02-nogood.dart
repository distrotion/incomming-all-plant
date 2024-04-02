import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import 'package:image/image.dart' as IMG;

import '../../../bloc/Cubit/Rebuild.dart';
import '../../../styles/TextStyle.dart';
import '../../../widget/common/ComInputText.dart';
import '../../data/Base64Img.dart';

class NOGOODconfirm extends StatelessWidget {
  NOGOODconfirm({
    Key? key,
    this.blockFINISH,
    this.NoGoodPage,
    this.yesno,
    this.yesnoRT,
    this.undercontrol,
    this.base64pic01,
    this.base64pic01RT,
    this.base64pic02,
    this.base64pic02RT,
    this.base64pic03,
    this.base64pic03RT,
    this.base64pic04,
    this.base64pic04RT,
    this.base64pic05,
    this.base64pic05RT,
    this.NoGoodPageRT,
    this.modeNOGOODRT,
    this.SpacialAccText,
    this.SpacialAccTextrt,
    this.attper,
    this.attperrt,
    this.PiecesDropdownSelected,
    this.PiecesDropdownSelectedRT,
    this.NextorBack,
  }) : super(key: key);
  bool? blockFINISH;
  int? NoGoodPage;
  int? yesno;
  Function(int)? yesnoRT;
  String? base64pic01;
  Function(String)? base64pic01RT;
  String? base64pic02;
  Function(String)? base64pic02RT;
  String? base64pic03;
  Function(String)? base64pic03RT;
  String? base64pic04;
  Function(String)? base64pic04RT;
  String? base64pic05;
  Function(String)? base64pic05RT;
  Function(String)? NoGoodPageRT;
  Function(String)? modeNOGOODRT;
  bool? undercontrol;
  String? SpacialAccText;
  Function(String)? SpacialAccTextrt;
  int? attper;
  Function(int)? attperrt;

  String? PiecesDropdownSelected;
  Function(String)? PiecesDropdownSelectedRT;
  Function(String)? NextorBack;

  @override
  Widget build(BuildContext context) {
    Widget outpage = WaittingP1();
    if (NoGoodPage == 1) {
      outpage = WaittingP1(
        yesno: yesno,
        yesnoRT: yesnoRT,
        undercontrol: undercontrol,
        SpacialAccText: SpacialAccText,
        SpacialAccTextrt: SpacialAccTextrt,
        attper: attper,
        attperrt: attperrt,
        PiecesDropdownSelected: PiecesDropdownSelected,
        PiecesDropdownSelectedRT: PiecesDropdownSelectedRT,
        NextorBack: NextorBack,
      );
    } else if (NoGoodPage == 2) {
      outpage = WaittingP2(
        blockfinish: blockFINISH ?? true,
        base64pic01: base64pic01,
        base64pic01RT: (s) {
          if (base64pic01RT != null) {
            base64pic01RT!(s);
          }
        },
        base64pic02: base64pic02,
        base64pic02RT: (s) {
          if (base64pic02RT != null) {
            base64pic02RT!(s);
          }
        },
        base64pic03: base64pic03,
        base64pic03RT: (s) {
          if (base64pic03RT != null) {
            base64pic03RT!(s);
          }
        },
        base64pic04: base64pic04,
        base64pic04RT: (s) {
          if (base64pic04RT != null) {
            base64pic04RT!(s);
          }
        },
        base64pic05: base64pic05,
        base64pic05RT: (s) {
          if (base64pic05RT != null) {
            base64pic05RT!(s);
          }
        },
        NoGoodPage: (s) {
          if (NoGoodPageRT != null) {
            NoGoodPageRT!(s);
          }
        },
        modeNOGOOD: (s) {
          if (modeNOGOODRT != null) {
            modeNOGOODRT!(s);
          }
        },
      );
    }
    return outpage;
  }
}

class WaittingP1 extends StatefulWidget {
  WaittingP1({
    Key? key,
    this.yesno,
    this.yesnoRT,
    this.undercontrol,
    this.SpacialAccText,
    this.SpacialAccTextrt,
    this.attper,
    this.attperrt,
    this.NextorBack,
    this.PiecesDropdownSelected,
    this.PiecesDropdownSelectedRT,
  }) : super(key: key);
  int? yesno;
  Function(int)? yesnoRT;
  bool? undercontrol;
  String? SpacialAccText;
  Function(String)? SpacialAccTextrt;
  int? attper;
  Function(int)? attperrt;
  Function(String)? NextorBack;
  String? PiecesDropdownSelected;
  Function(String)? PiecesDropdownSelectedRT;

  @override
  State<WaittingP1> createState() => _WaittingP1State();
}

class _WaittingP1State extends State<WaittingP1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
              // color: Colors.red,
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
              ),
              child: Center(
                child: Text("Sending for special accept confirm ?"),
              )),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (widget.yesnoRT != null) {
                          widget.yesnoRT!(1);
                        }
                      },
                      child: Container(
                        // color: Colors.amberAccent,

                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          // color: Colors.white,
                          color:
                              widget.yesno == 1 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("YES",
                              style: widget.yesno == 1
                                  ? TxtStyleBlackBG()
                                  : TxtStyleWhiteBG()),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (widget.yesnoRT != null) {
                          widget.yesnoRT!(2);
                        }
                      },
                      child: Container(
                        // color: Colors.amberAccent,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color:
                              widget.yesno == 2 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("NO",
                              style: widget.yesno == 2
                                  ? TxtStyleBlackBG()
                                  : TxtStyleWhiteBG()),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // color: Colors.green,
            child: Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        // color: Colors.amber,
                        child: ComInputText(
                          nLimitedChar: 300,
                          height: 40,
                          width: 350,
                          isContr: widget.undercontrol,
                          fnContr: (input) {
                            setState(() {
                              widget.undercontrol = input;
                            });
                          },
                          sValue: widget.SpacialAccText ?? '',
                          returnfunc: (String s) {
                            if (widget.SpacialAccTextrt != null) {
                              widget.SpacialAccTextrt!(s);
                            }
                          },
                        ),
                      ),
                    )),
                // Expanded(flex: 1, child: Container(
                //   height: 40,
                //   color: Colors.amberAccent,))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (widget.attperrt != null) {
                          widget.attperrt!(1);
                        }
                      },
                      child: Container(
                        // color: Colors.amberAccent,

                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          // color: Colors.white,
                          color:
                              widget.attper == 1 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("QA/QC Engineer",
                              style: widget.attper == 1
                                  ? const TxtStyleBlackBG()
                                  : const TxtStyleWhiteBG()),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (widget.attperrt != null) {
                          widget.attperrt!(2);
                        }
                      },
                      child: Container(
                        // color: Colors.amberAccent,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color:
                              widget.attper == 2 ? Colors.black : Colors.white,
                        ),
                        child: Center(
                          child: Text("Purchase",
                              style: widget.attper == 2
                                  ? const TxtStyleBlackBG()
                                  : const TxtStyleWhiteBG()),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Amount", style: const TxtStyleWhiteBG()),
                PiecesDropdown(
                  PiecesDropdownSelected: widget.PiecesDropdownSelected,
                  PiecesDropdownSelectedRT: widget.PiecesDropdownSelectedRT,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 0, end: 0, top: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                if (widget.NextorBack != null) {
                  widget.NextorBack!("NextorBack");
                }
              },
              child: Container(
                // height: 20,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.greenAccent,
                ),
                child: Center(
                  child: widget.yesno == 1
                      ? const Text("NEXT")
                      : const Text("Back"),
                ),
                // color: Colors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WaittingP2 extends StatefulWidget {
  WaittingP2({
    Key? key,
    this.blockfinish,
    this.base64pic01,
    this.base64pic01RT,
    this.base64pic02,
    this.base64pic02RT,
    this.base64pic03,
    this.base64pic03RT,
    this.base64pic04,
    this.base64pic04RT,
    this.base64pic05,
    this.base64pic05RT,
    this.NoGoodPage,
    this.modeNOGOOD,
  }) : super(key: key);
  bool? blockfinish;
  String? base64pic01;
  Function(String)? base64pic01RT;
  String? base64pic02;
  Function(String)? base64pic02RT;
  String? base64pic03;
  Function(String)? base64pic03RT;
  String? base64pic04;
  Function(String)? base64pic04RT;
  String? base64pic05;
  Function(String)? base64pic05RT;

  Function(String)? NoGoodPage;
  Function(String)? modeNOGOOD;

  @override
  State<WaittingP2> createState() => _WaittingP2State();
}

class _WaittingP2State extends State<WaittingP2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton01(
                base64picRT: (s) {
                  if (widget.base64pic01RT != null) {
                    widget.base64pic01RT!(s);
                  }
                },
              ),
              PicShow(base64: widget.base64pic01 ?? logo),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton01(
                base64picRT: (s) {
                  if (widget.base64pic02RT != null) {
                    widget.base64pic02RT!(s);
                  }
                },
              ),
              PicShow(base64: widget.base64pic02 ?? logo),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton01(
                base64picRT: (s) {
                  if (widget.base64pic03RT != null) {
                    widget.base64pic03RT!(s);
                  }
                },
              ),
              PicShow(base64: widget.base64pic03 ?? logo),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton01(
                base64picRT: (s) {
                  if (widget.base64pic04RT != null) {
                    widget.base64pic04RT!(s);
                  }
                },
              ),
              PicShow(base64: widget.base64pic04 ?? logo),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FileUploadButton01(
                base64picRT: (s) {
                  if (widget.base64pic05RT != null) {
                    widget.base64pic05RT!(s);
                  }
                },
              ),
              PicShow(base64: widget.base64pic05 ?? logo),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 0, end: 0, top: 10, bottom: 10),
                  child: InkWell(
                    onTap: () {
                      if (widget.NoGoodPage != null) {
                        widget.NoGoodPage!("1");
                      }
                    },
                    child: Container(
                      // height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.blueGrey,
                      ),
                      child: const Center(
                        child: Text("Back"),
                      ),
                      // color: Colors.orange,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: finishfunction(
                  modeNOGOOD: (s) {
                    if (widget.modeNOGOOD != null) {
                      widget.modeNOGOOD!("modeNOGOOD");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FileUploadButton01 extends StatefulWidget {
  FileUploadButton01({
    Key? key,
    this.base64picRT,
  }) : super(key: key);
  Function(String)? base64picRT;

  @override
  State<FileUploadButton01> createState() => _FileUploadButton01State();
}

class _FileUploadButton01State extends State<FileUploadButton01> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles(type: FileType.image);
        Uint8List? imageByte;
        Uint8List? resizedData;

        if (picked != null) {
          imageByte = picked.files.first.bytes;
          IMG.Image? img = IMG.decodeImage(imageByte!);
          IMG.Image? img2 = IMG.copyResize(img!, width: 1280, height: 720);
          resizedData = IMG.encodeJpg(img2) as Uint8List?;
          setState(() {
            if (widget.base64picRT != null) {
              widget.base64picRT!(base64.encode(resizedData!));
            }
          });
        }
      },
    );
  }
}

class PicShow extends StatefulWidget {
  PicShow({
    Key? key,
    required this.base64,
  }) : super(key: key);
  String? base64;
  @override
  State createState() => new PicShowState();
}

class PicShowState extends State<PicShow> {
  // String _base64 = base64pic01;

  @override
  Widget build(BuildContext context) {
    if (widget.base64 == null) return new Container();
    Uint8List bytes = base64.decode(widget.base64 ?? '');
    return Container(
      height: 50,
      child: new Image.memory(bytes),
    );
  }
}

class finishfunction extends StatelessWidget {
  finishfunction({
    Key? key,
    this.modeNOGOOD,
  }) : super(key: key);

  Function(String)? modeNOGOOD;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 0, end: 0, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          //
          if (modeNOGOOD != null) {
            modeNOGOOD!("modeNOGOOD");
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.greenAccent,
          ),
          child: const Center(
            child: Text("FINISH"),
          ),
          // color: Colors.orange,
        ),
      ),
    );
  }
}

class PiecesDropdown extends StatefulWidget {
  PiecesDropdown({
    Key? key,
    this.PiecesDropdownSelected,
    this.PiecesDropdownSelectedRT,
  }) : super(key: key);
  String? PiecesDropdownSelected;
  Function(String)? PiecesDropdownSelectedRT;

  @override
  State<PiecesDropdown> createState() => _PiecesDropdownState();
}

class _PiecesDropdownState extends State<PiecesDropdown> {
  @override
  Widget build(BuildContext context) {
    final items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),

      // dropdown below..
      child: DropdownButton<String>(
        value: widget.PiecesDropdownSelected,
        onChanged: (String? newValue) {
          if (widget.PiecesDropdownSelectedRT != null) {
            widget.PiecesDropdownSelectedRT!(newValue ?? '1');
          }
        },
        items: items
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),

        // add extra sugar..
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 42,
        underline: SizedBox(),
      ),
    );
  }
}
