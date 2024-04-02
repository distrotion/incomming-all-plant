import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/03-01-P02INCOMING_GWGASget.dart';
import '../model/model.dart';
import 'P03INCOMING_GWGAS/P03INCOMING_GWGASmain.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocBody();
  }
}

class Page3BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page3BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P03INCOMING_GWGASget(),
        child: BlocBuilder<P03INCOMING_GWGASget, List<dataset>>(
          builder: (context, data) {
            return Page3Body(
              data: data,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P03INCOMING_GWGASmain(
        data: data,
      ),
    );
  }
}
