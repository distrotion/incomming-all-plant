// import 'dart:typed_data';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:convert';
// import 'package:image/image.dart' as IMG;

// import '../../../bloc/Cubit/Rebuild.dart';
// import '../../../styles/TextStyle.dart';
// import '../../../widget/common/ComInputText.dart';
// import '../P02INCOMINGvar_BP12GAS.dart';

// class P02INCOMINGvar_BP12GAS_NOGOODconfirm extends StatelessWidget {
//   P02INCOMINGvar_BP12GAS_NOGOODconfirm({Key? key, this.blockFINISH})
//       : super(key: key);
//   bool? blockFINISH;

//   @override
//   Widget build(BuildContext context) {
//     Widget outpage = WaittingP1();
//     if (P02INCOMINGvar_BP12GAS_NOGOODcon.NoGoodPage == 1) {
//       outpage = WaittingP1();
//     } else if (P02INCOMINGvar_BP12GAS_NOGOODcon.NoGoodPage == 2) {
//       outpage = WaittingP2(blockfinish: blockFINISH ?? true);
//     }
//     return outpage;
//   }
// }

// class WaittingP1 extends StatelessWidget {
//   const WaittingP1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 1,
//           child: Container(
//               // color: Colors.red,
//               decoration: BoxDecoration(
//                 border: Border.all(width: 2.0, color: Colors.black),
//                 borderRadius: BorderRadius.all(Radius.circular(8)),
//                 color: Colors.white,
//               ),
//               child: Center(
//                 child: Text("Sending for special accept confirm ?"),
//               )),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {
//                         P02INCOMINGvar_BP12GAS_NOGOODcon.yesno = 1;
//                         BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//                       },
//                       child: Container(
//                         // color: Colors.amberAccent,

//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2.0, color: Colors.black),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           // color: Colors.white,
//                           color: P02INCOMINGvar_BP12GAS_NOGOODcon.yesno == 1
//                               ? Colors.black
//                               : Colors.white,
//                         ),
//                         child: Center(
//                           child: Text("YES",
//                               style: P02INCOMINGvar_BP12GAS_NOGOODcon.yesno == 1
//                                   ? TxtStyleBlackBG()
//                                   : TxtStyleWhiteBG()),
//                         ),
//                       ),
//                     ),
//                   )),
//               Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {
//                         P02INCOMINGvar_BP12GAS_NOGOODcon.yesno = 2;
//                         BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//                       },
//                       child: Container(
//                         // color: Colors.amberAccent,
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2.0, color: Colors.black),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           color: P02INCOMINGvar_BP12GAS_NOGOODcon.yesno == 2
//                               ? Colors.black
//                               : Colors.white,
//                         ),
//                         child: Center(
//                           child: Text("NO",
//                               style: P02INCOMINGvar_BP12GAS_NOGOODcon.yesno == 2
//                                   ? TxtStyleBlackBG()
//                                   : TxtStyleWhiteBG()),
//                         ),
//                       ),
//                     ),
//                   ))
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             // color: Colors.green,
//             child: Row(
//               children: [
//                 Expanded(
//                     flex: 4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 60,
//                         // color: Colors.amber,
//                         child: ComInputText(
//                           nLimitedChar: 300,
//                           height: 40,
//                           width: 350,
//                           isContr:
//                               P02INCOMINGvar_BP12GAS_NOGOODcon.undercontrol,
//                           fnContr: (input) {
//                             P02INCOMINGvar_BP12GAS_NOGOODcon.undercontrol =
//                                 input;
//                           },
//                           sValue:
//                               P02INCOMINGvar_BP12GAS_NOGOODcon.SpacialAccText,
//                           returnfunc: (String s) {
//                             P02INCOMINGvar_BP12GAS_NOGOODcon.SpacialAccText = s;
//                           },
//                         ),
//                       ),
//                     )),
//                 // Expanded(flex: 1, child: Container(
//                 //   height: 40,
//                 //   color: Colors.amberAccent,))
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {
//                         P02INCOMINGvar_BP12GAS_NOGOODcon.attper = 1;
//                         BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//                       },
//                       child: Container(
//                         // color: Colors.amberAccent,

//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2.0, color: Colors.black),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(8)),
//                           // color: Colors.white,
//                           color: P02INCOMINGvar_BP12GAS_NOGOODcon.attper == 1
//                               ? Colors.black
//                               : Colors.white,
//                         ),
//                         child: Center(
//                           child: Text("QA/QC Engineer",
//                               style:
//                                   P02INCOMINGvar_BP12GAS_NOGOODcon.attper == 1
//                                       ? const TxtStyleBlackBG()
//                                       : const TxtStyleWhiteBG()),
//                         ),
//                       ),
//                     ),
//                   )),
//               Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {
//                         P02INCOMINGvar_BP12GAS_NOGOODcon.attper = 2;
//                         BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//                       },
//                       child: Container(
//                         // color: Colors.amberAccent,
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2.0, color: Colors.black),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(8)),
//                           color: P02INCOMINGvar_BP12GAS_NOGOODcon.attper == 2
//                               ? Colors.black
//                               : Colors.white,
//                         ),
//                         child: Center(
//                           child: Text("Purchase",
//                               style:
//                                   P02INCOMINGvar_BP12GAS_NOGOODcon.attper == 2
//                                       ? const TxtStyleBlackBG()
//                                       : const TxtStyleWhiteBG()),
//                         ),
//                       ),
//                     ),
//                   ))
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(width: 2.0, color: Colors.black),
//               borderRadius: const BorderRadius.all(Radius.circular(8)),
//               color: Colors.white,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text("Amount", style: const TxtStyleWhiteBG()),
//                 PiecesDropdown(),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Padding(
//             padding: EdgeInsetsDirectional.only(
//                 start: 0, end: 0, top: 10, bottom: 10),
//             child: InkWell(
//               onTap: () {
//                 if ((P02INCOMINGvar_BP12GAS_NOGOODcon.yesno == 1)) {
//                   if ((P02INCOMINGvar_BP12GAS_NOGOODcon.attper != 0)) {
//                     P02INCOMINGvar_BP12GAS_NOGOODcon.NoGoodPage = 2;
//                     BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//                   }
//                 } else {
//                   P02INCOMINGvar_BP12GAS.modeNOGOOD = false;
//                   BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//                 }
//               },
//               child: Container(
//                 // height: 20,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 2.0, color: Colors.black),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   color: Colors.greenAccent,
//                 ),
//                 child: Center(
//                   child: P02INCOMINGvar_BP12GAS_NOGOODcon.yesno == 1
//                       ? const Text("NEXT")
//                       : const Text("Back"),
//                 ),
//                 // color: Colors.orange,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class WaittingP2 extends StatelessWidget {
//   WaittingP2({Key? key, this.blockfinish}) : super(key: key);
//   bool? blockfinish;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FileUploadButton01(),
//               PicShow01(base64: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic01),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FileUploadButton02(),
//               PicShow01(base64: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic02),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FileUploadButton03(),
//               PicShow01(base64: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic03),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FileUploadButton04(),
//               PicShow01(base64: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic04),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               FileUploadButton05(),
//               PicShow01(base64: P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic05),
//             ],
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsetsDirectional.only(
//                       start: 0, end: 0, top: 10, bottom: 10),
//                   child: InkWell(
//                     onTap: () {
//                       P02INCOMINGvar_BP12GAS_NOGOODcon.NoGoodPage = 1;
//                       BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//                     },
//                     child: Container(
//                       // height: 20,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 2.0, color: Colors.black),
//                         borderRadius: BorderRadius.all(Radius.circular(8)),
//                         color: Colors.blueGrey,
//                       ),
//                       child: const Center(
//                         child: Text("Back"),
//                       ),
//                       // color: Colors.orange,
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: finishfunction(
//                   blockfinish: blockfinish ?? true,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FileUploadButton01 extends StatelessWidget {
//   const FileUploadButton01({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text('UPLOAD FILE'),
//       onPressed: () async {
//         var picked = await FilePicker.platform.pickFiles();
//         Uint8List? imageByte;
//         Uint8List? resizedData;

//         if (picked != null) {
//           imageByte = picked.files.first.bytes;
//           IMG.Image? img = IMG.decodeImage(imageByte!);
//           IMG.Image? img2 = IMG.copyResize(img!, width: 1280, height: 720);
//           resizedData = IMG.encodeJpg(img2) as Uint8List?;
//           P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic01 =
//               base64.encode(resizedData!);
//           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//         }
//       },
//     );
//   }
// }

// class FileUploadButton02 extends StatelessWidget {
//   const FileUploadButton02({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text('UPLOAD FILE'),
//       onPressed: () async {
//         var picked = await FilePicker.platform.pickFiles();
//         Uint8List? imageByte;
//         Uint8List? resizedData;

//         if (picked != null) {
//           imageByte = picked.files.first.bytes;
//           IMG.Image? img = IMG.decodeImage(imageByte!);
//           IMG.Image? img2 = IMG.copyResize(img!, width: 1280, height: 720);
//           resizedData = IMG.encodeJpg(img2) as Uint8List?;
//           P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic02 =
//               base64.encode(resizedData!);
//           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//         }
//       },
//     );
//   }
// }

// class FileUploadButton03 extends StatelessWidget {
//   const FileUploadButton03({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text('UPLOAD FILE'),
//       onPressed: () async {
//         var picked = await FilePicker.platform.pickFiles();
//         Uint8List? imageByte;
//         Uint8List? resizedData;

//         if (picked != null) {
//           imageByte = picked.files.first.bytes;
//           IMG.Image? img = IMG.decodeImage(imageByte!);
//           IMG.Image? img2 = IMG.copyResize(img!, width: 1280, height: 720);
//           resizedData = IMG.encodeJpg(img2) as Uint8List?;
//           P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic03 =
//               base64.encode(resizedData!);
//           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//         }
//       },
//     );
//   }
// }

// class FileUploadButton04 extends StatelessWidget {
//   const FileUploadButton04({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text('UPLOAD FILE'),
//       onPressed: () async {
//         var picked = await FilePicker.platform.pickFiles();
//         Uint8List? imageByte;
//         Uint8List? resizedData;

//         if (picked != null) {
//           imageByte = picked.files.first.bytes;
//           IMG.Image? img = IMG.decodeImage(imageByte!);
//           IMG.Image? img2 = IMG.copyResize(img!, width: 1280, height: 720);
//           resizedData = IMG.encodeJpg(img2) as Uint8List?;
//           P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic04 =
//               base64.encode(resizedData!);
//           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//         }
//       },
//     );
//   }
// }

// class FileUploadButton05 extends StatelessWidget {
//   const FileUploadButton05({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text('UPLOAD FILE'),
//       onPressed: () async {
//         var picked = await FilePicker.platform.pickFiles();
//         Uint8List? imageByte;
//         Uint8List? resizedData;

//         if (picked != null) {
//           imageByte = picked.files.first.bytes;
//           IMG.Image? img = IMG.decodeImage(imageByte!);
//           IMG.Image? img2 = IMG.copyResize(img!, width: 1280, height: 720);
//           resizedData = IMG.encodeJpg(img2) as Uint8List?;
//           P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic05 =
//               base64.encode(resizedData!);
//           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//         }
//       },
//     );
//   }
// }

// class PicShow01 extends StatefulWidget {
//   PicShow01({Key? key, required this.base64}) : super(key: key);
//   String base64 = P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic01;
//   @override
//   State createState() => new PicShow01State();
// }

// class PicShow01State extends State<PicShow01> {
//   // String _base64 = base64pic01;

//   @override
//   Widget build(BuildContext context) {
//     if (widget.base64 == null) return new Container();
//     Uint8List bytes = base64.decode(widget.base64);
//     return Container(
//       height: 50,
//       child: new Image.memory(bytes),
//     );
//   }
// }

// class finishfunction extends StatelessWidget {
//   finishfunction({Key? key, this.blockfinish}) : super(key: key);
//   bool? blockfinish;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsetsDirectional.only(
//           start: 0, end: 0, top: 10, bottom: 10),
//       child: InkWell(
//         onTap: () {
//           //
//           if ((blockfinish ?? true)) {
//             P02INCOMINGvar_BP12GAS.modeNOGOOD = false;
//           }
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 2.0, color: Colors.black),
//             borderRadius: BorderRadius.all(Radius.circular(8)),
//             color: Colors.greenAccent,
//           ),
//           child: const Center(
//             child: Text("FINISH"),
//           ),
//           // color: Colors.orange,
//         ),
//       ),
//     );
//   }
// }

// class PiecesDropdown extends StatefulWidget {
//   const PiecesDropdown({Key? key}) : super(key: key);

//   @override
//   State<PiecesDropdown> createState() => _PiecesDropdownState();
// }

// class _PiecesDropdownState extends State<PiecesDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     final items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(10)),

//       // dropdown below..
//       child: DropdownButton<String>(
//         value: P02INCOMINGvar_BP12GAS_NOGOODcon.PiecesDropdownSelected,
//         onChanged: (String? newValue) {
//           P02INCOMINGvar_BP12GAS_NOGOODcon.PiecesDropdownSelected =
//               newValue ?? '1';
//           BlocProvider.of<BlocPageRebuild>(context).rebuildPage();
//         },
//         items: items
//             .map<DropdownMenuItem<String>>(
//                 (String value) => DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     ))
//             .toList(),

//         // add extra sugar..
//         icon: Icon(Icons.arrow_drop_down),
//         iconSize: 42,
//         underline: SizedBox(),
//       ),
//     );
//   }
// }
