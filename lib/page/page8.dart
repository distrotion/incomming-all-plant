import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/08-01-P08INCOMING_HESPALget.dart';
import '../model/model.dart';

import 'P08INCOMING_HESPAL/P08INCOMING_HESPALmain.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page8BlocBody();
  }
}

class Page8BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page8BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P08INCOMING_HESPALget(),
        child: BlocBuilder<P08INCOMING_HESPALget, List<dataset>>(
          builder: (context, data) {
            return Page8Body(
              data: data,
            );
          },
        ));
  }
}

class Page8Body extends StatelessWidget {
  Page8Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P08INCOMING_HESPALmain(
        data: data,
      ),
    );
  }
}
