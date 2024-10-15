import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/10-01-P08INCOMING_PH12PVDget.dart';
import '../bloc/BlocEvent/11-01-P08INCOMING_PH12PAL.dart';
import '../model/model.dart';
import 'P11INCOMING_BP12PAL/P11INCOMING_BP12PALmain.dart';

class Page11 extends StatelessWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page11BlocBody();
  }
}

class Page11BlocBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page11BlocBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P11INCOMING_BP12PALget(),
        child: BlocBuilder<P11INCOMING_BP12PALget, List<dataset>>(
          builder: (context, data) {
            return Page11Body(
              data: data,
            );
          },
        ));
  }
}

class Page11Body extends StatelessWidget {
  Page11Body({Key? key, this.data}) : super(key: key);

  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P11INCOMING_BP12PALmain(
        data: data,
      ),
    );
  }
}
