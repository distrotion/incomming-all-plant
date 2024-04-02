import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/02-01-P02INCOMING_BP12GASget.dart';
import '../model/model.dart';
import 'P02INCOMING_BP12GAS/P02INCOMING_BP12GASmain.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2BlocBody();
  }
}

class Page2BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page2BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P02INCOMING_BP12GASget(),
        child: BlocBuilder<P02INCOMING_BP12GASget, List<dataset>>(
          builder: (context, data) {
            return Page2Body(
              data: data,
            );
          },
        ));
  }
}

class Page2Body extends StatelessWidget {
  Page2Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P02INCOMING_BP12GASmain(
        data: data,
      ),
    );
  }
}
