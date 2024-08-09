import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P05INCOMING_HESGAS/P05INCOMING_HESGASmain.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;
// String server = "http://172.23.10.40:16714/";
// String server = "http://127.0.0.1:16714/";
//172.23.10.39

// DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class DataSetEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends DataSetEvent {}

class FlushITDataPressed extends DataSetEvent {}

class CounterValue extends P05INCOMING_HESGASget {
  final int value;
  CounterValue(this.value);
}

class P05INCOMING_HESGASget extends Bloc<DataSetEvent, List<dataset>> {
  /// {@macro counter_bloc}
  P05INCOMING_HESGASget() : super(<dataset>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    FreeLoading(P05INCOMING_HESGASmaincontext);
    DateTime now = DateTime.now().subtract(const Duration(days: 10));
    // print(zreoover(now.day.toString()));
    final response = await Dio().post(
      server + "getsap/getincomming_2",
      data: {
        "IMP_PRCTR": "54000",
        "IMP_WERKS": "2300",
        "LAST_DATE":
            "${zreoover(now.day.toString())}-${zreoover(now.month.toString())}-${now.year}",
        "LAST_TIME":
            "${zreoover(now.hour.toString())}:${zreoover(now.minute.toString())}:00",
        // "LAST_DATE": "01-04-2024",
        // "LAST_TIME": "19:00:08"
      },
    );
    Navigator.pop(P05INCOMING_HESGASmaincontext);

    var data_input = [];
    List<dataset> stateoutput = [];
    if (response.statusCode == 200) {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      data_input = databuff;
      // print(data_input);

      for (var i = 0; i < data_input.length; i++) {
        stateoutput.add(dataset(
          id: i + 1,
          f01: data_input[i]['MATNR'].toString().substring(10),
          f02: data_input[i]['NAME1'].toString(),
          f03: data_input[i]['PART_NM'].toString(),
          f04: data_input[i]['PART_NO'].toString(),
          f05: data_input[i]['CHARG'].toString(),
          f06: data_input[i]['CUST_LOT'].toString(),
          f07: data_input[i]['STATUS'].toString(),
          f08: "",
          f09: data_input[i]['MATNR'].toString(),
          f10: data_input[i]['CHARG'].toString(),
          f11: data_input[i]['MBLNR'].toString(),
          f12: data_input[i]['BWART'].toString(),
          f13: data_input[i]['MENGE'].toString(),
          f14: data_input[i]['MEINS'].toString(),
          f15: data_input[i]['MAT_FG'].toString(),
          f16: data_input[i]['KUNNR'].toString(),
          f17: data_input[i]['SORTL'].toString(),
          f18: data_input[i]['NAME1'].toString(),
          f19: data_input[i]['CUST_LOT'].toString(),
          f20: data_input[i]['PART_NM'].toString(),
          f21: data_input[i]['PART_NO'].toString(),
          f22: data_input[i]['PROCESS'].toString(),
          f23: data_input[i]['OLDMAT_CP'].toString(),
          f24: data_input[i]['STATUS'].toString(),
          f25: data_input[i]['Appearance for rust_status'].toString(),
          f26: data_input[i]['Appearance for scratch_status'].toString(),
        ));
      }
      //stateoutput = data_test
    } else {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = [];
    }
    //------------------------
    final responseNEW = await Dio().post(
      server + "getsap/getincomming_2",
      data: {
        "IMP_PRCTR": "54500",
        "IMP_WERKS": "2300",
        "LAST_DATE":
            "${zreoover(now.day.toString())}-${zreoover(now.month.toString())}-${now.year}",
        "LAST_TIME": "${now.hour}:${now.minute}:${now.second}",
        // "LAST_DATE": "01-04-2024",
        // "LAST_TIME": "19:00:08"
      },
    );
    // Navigator.pop(P05INCOMING_HESGASmaincontext);

    if (responseNEW.statusCode == 200) {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = responseNEW.data;
      data_input = databuff;
      // print(data_input);

      for (var i = 0; i < data_input.length; i++) {
        stateoutput.add(dataset(
          id: i + 1,
          f01: data_input[i]['MATNR'].toString().substring(10),
          f02: data_input[i]['NAME1'].toString(),
          f03: data_input[i]['PART_NM'].toString(),
          f04: data_input[i]['PART_NO'].toString(),
          f05: data_input[i]['CHARG'].toString(),
          f06: data_input[i]['CUST_LOT'].toString(),
          f07: data_input[i]['STATUS'].toString(),
          f08: "",
          f09: data_input[i]['MATNR'].toString(),
          f10: data_input[i]['CHARG'].toString(),
          f11: data_input[i]['MBLNR'].toString(),
          f12: data_input[i]['BWART'].toString(),
          f13: data_input[i]['MENGE'].toString(),
          f14: data_input[i]['MEINS'].toString(),
          f15: data_input[i]['MAT_FG'].toString(),
          f16: data_input[i]['KUNNR'].toString(),
          f17: data_input[i]['SORTL'].toString(),
          f18: data_input[i]['NAME1'].toString(),
          f19: data_input[i]['CUST_LOT'].toString(),
          f20: data_input[i]['PART_NM'].toString(),
          f21: data_input[i]['PART_NO'].toString(),
          f22: data_input[i]['PROCESS'].toString(),
          f23: data_input[i]['OLDMAT_CP'].toString(),
          f24: data_input[i]['STATUS'].toString(),
          f25: data_input[i]['Appearance for rust_status'].toString(),
          f26: data_input[i]['Appearance for scratch_status'].toString(),
        ));
      }
      //stateoutput = data_test
    } else {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = [];
    }
    emit(stateoutput);
  }

  Future<void> _PostData01(int toAdd, Emitter<int> emit) async {}
}

String zreoover(String input) {
  String output = input;

  if (input.length == 1) {
    output = "0${input}";
  }
  return output;
}
