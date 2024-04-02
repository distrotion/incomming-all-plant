import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/04-01-P04INCOMING_BP12PHget.dart';
import '../model/model.dart';

import 'P04INCOMING_PB12PH/P04INCOMING_BP12PHmain.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4BlocBody();
  }
}

class Page4BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page4BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P04INCOMING_BP12PHget(),
        child: BlocBuilder<P04INCOMING_BP12PHget, List<dataset>>(
          builder: (context, data) {
            return Page4Body(
              data: data,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P04INCOMING_BP12PHmain(
        data: data,
      ),
    );
  }
}
