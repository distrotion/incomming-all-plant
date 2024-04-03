import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/06-01-P06INCOMING_HESISNget.dart';
import '../model/model.dart';

import 'P06INCOMING_HESISN/P06INCOMING_HESISNmain.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page6BlocBody();
  }
}

class Page6BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page6BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P06INCOMING_HESISNget(),
        child: BlocBuilder<P06INCOMING_HESISNget, List<dataset>>(
          builder: (context, data) {
            return Page6Body(
              data: data,
            );
          },
        ));
  }
}

class Page6Body extends StatelessWidget {
  Page6Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P06INCOMING_HESISNmain(
        data: data,
      ),
    );
  }
}
