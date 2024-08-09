import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/07-01-P07INCOMING_HESPHget.dart';
import '../model/model.dart';

import 'P07INCOMING_HESPH/P07INCOMING_HESPHmain.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocBody();
  }
}

class Page7BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page7BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P07INCOMING_HESPHget(),
        child: BlocBuilder<P07INCOMING_HESPHget, List<dataset>>(
          builder: (context, data) {
            return Page7Body(
              data: data,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P07INCOMING_HESPHmain(
        data: data,
      ),
    );
  }
}
