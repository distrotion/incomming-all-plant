import 'package:flutter/material.dart';
import '../model/model.dart';
import 'P01CENTERSELECT/P01CENTERSELECTmain.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1Body();
  }
}

class Page1Body extends StatelessWidget {
  Page1Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P01CENTERSELECTmain(),
    );
  }
}
