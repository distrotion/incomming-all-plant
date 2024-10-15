import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/10-01-P08INCOMING_PH12PVDget.dart';
import '../model/model.dart';

import 'P10INCOMING_BP12PVD/P10INCOMING_BP12PVDmain.dart';

class Page10 extends StatelessWidget {
  const Page10({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page10BlocBody();
  }
}

class Page10BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page10BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P10INCOMING_BP12PVDget(),
        child: BlocBuilder<P10INCOMING_BP12PVDget, List<dataset>>(
          builder: (context, data) {
            return Page10Body(
              data: data,
            );
          },
        ));
  }
}

class Page10Body extends StatelessWidget {
  Page10Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P10INCOMING_BP12PVDmain(
        data: data,
      ),
    );
  }
}
