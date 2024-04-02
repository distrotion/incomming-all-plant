import 'package:flutter/material.dart';

class NOCON extends StatelessWidget {
  const NOCON({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 15, end: 15, top: 10, bottom: 10),
      child: Container(
        // color: Colors.black,
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
        ),
        child: const Center(child: Text("--")),
      ),
    );
  }
}
