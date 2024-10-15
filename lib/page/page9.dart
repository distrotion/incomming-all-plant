import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/09-01-P09INCOMING_PH12KNGget.dart';
import '../model/model.dart';

import 'P09INCOMING_BP12KNG/P09INCOMING_BP12KNGmain.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page9BlocBody();
  }
}

class Page9BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page9BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P09INCOMING_BP12KNGget(),
        child: BlocBuilder<P09INCOMING_BP12KNGget, List<dataset>>(
          builder: (context, data) {
            return Page9Body(
              data: data,
            );
          },
        ));
  }
}

class Page9Body extends StatelessWidget {
  Page9Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P09INCOMING_BP12KNGmain(
        data: data,
      ),
    );
  }
}
