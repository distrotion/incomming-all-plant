// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../bloc/Cubit/Rebuild.dart';

// class P02INCOMINGvar_BP12GAS_WattingItem extends StatelessWidget {
//   P02INCOMINGvar_BP12GAS_WattingItem(
//       {Key? key, this.blockGood, this.blockReject})
//       : super(key: key);
//   bool? blockGood;
//   bool? blockReject;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//             flex: 1,
//             child: Padding(
//               padding:
//                   const EdgeInsetsDirectional.only(start: 15, end: 15, top: 10),
//               child: Container(
//                 // color: Colors.blue,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 2.0, color: Colors.black),
//                             borderRadius: BorderRadius.all(Radius.circular(8)),
//                             color: Colors.white,
//                           ),
//                           child: Center(child: Text("Check")),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                         flex: 1,
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border:
//                                   Border.all(width: 2.0, color: Colors.black),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                               color: Colors.white,
//                             ),
//                             child: Center(child: Text("10")),
//                           ),
//                         )),
//                     Expanded(
//                         flex: 1,
//                         child: Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border:
//                                   Border.all(width: 2.0, color: Colors.black),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(8)),
//                               color: Colors.white,
//                             ),
//                             child: Center(child: Text("pcs/lot")),
//                           ),
//                         )),
//                     Expanded(
//                       flex: 1,
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 2.0, color: Colors.black),
//                             borderRadius: BorderRadius.all(Radius.circular(8)),
//                             color: Colors.yellow,
//                           ),
//                           child: const Center(child: Text("WAIT")),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )),
//         Expanded(
//           flex: 1,
//           child: Padding(
//             padding:
//                 EdgeInsetsDirectional.only(start: 8, end: 8, top: 4, bottom: 0),
//             child: Container(
//                 // color: Colors.red,
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 2.0, color: Colors.black),
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   color: Colors.white,
//                 ),
//                 child: const Center(
//                   child: Text("Has custommer confirmed ?"),
//                 )),
//           ),
//         ),
//         Expanded(
//           flex: 2,
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       if (blockGood ?? true) {}
//                     },
//                     child: Container(
//                         // color: Colors.red,
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2.0, color: Colors.black),
//                           borderRadius: BorderRadius.all(Radius.circular(8)),
//                           color: Colors.green,
//                         ),
//                         child: const Center(
//                           child: Text("CONFIRM"),
//                         )),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       if (blockReject ?? true) {}
//                     },
//                     child: Container(
//                         // color: Colors.red,
//                         decoration: BoxDecoration(
//                           border: Border.all(width: 2.0, color: Colors.black),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(8)),
//                           color: Colors.red,
//                         ),
//                         child: const Center(
//                           child: Text("NO"),
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
