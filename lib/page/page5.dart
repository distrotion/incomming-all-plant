import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/05-01-P05INCOMING_HESGASget.dart';
import '../model/model.dart';

import 'P05INCOMING_HESGAS/P05INCOMING_HESGASmain.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocBody();
  }
}

class Page5BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page5BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P05INCOMING_HESGASget(),
        child: BlocBuilder<P05INCOMING_HESGASget, List<dataset>>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P05INCOMING_HESGASmain(
        data: data,
      ),
    );
  }
}
