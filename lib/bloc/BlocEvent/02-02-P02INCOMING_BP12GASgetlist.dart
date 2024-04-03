import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P02INCOMING_BP12GAS/P02INCOMING_BP12GASmain.dart';
import '../../page/P02INCOMING_BP12GAS/P02INCOMINGvar_BP12GAS.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P02INCOMING_BP12GASgetlistEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends P02INCOMING_BP12GASgetlistEvent {}

class FlushITDataPressed extends P02INCOMING_BP12GASgetlistEvent {}

class CounterValue extends P02INCOMING_BP12GASgetlist {
  final int value;
  CounterValue(this.value);
}

class P02INCOMING_BP12GASgetlist
    extends Bloc<P02INCOMING_BP12GASgetlistEvent, List<listdataincomming>> {
  /// {@macro counter_bloc}
  P02INCOMING_BP12GASgetlist() : super(<listdataincomming>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(List<listdataincomming> toAdd,
      Emitter<List<listdataincomming>> emit) async {
    // FreeLoading(P02INCOMING_BP12GASmaincontext);

    // print(zreoover(now.day.toString()));
    final response = await Dio().post(
      server + "01BP12GAS/getmaster",
      data: {
        "MATNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MATNRnow,
      },
    );

    List<listdataincomming> stateoutput = [];
    if (response.statusCode == 200) {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      // print(databuff);
      if (databuff['PATTERN'] != null) {
        if (databuff['PATTERN'].length > 0) {
          // print(databuff['ITEMS']);
          // print(databuff['PATTERN'][0]['INCOMMING'].length);
          var ITEMnamelist = databuff['ITEMS'];
          var INCOMMINGlist = databuff['PATTERN'][0]['INCOMMING'];
          if (INCOMMINGlist.length > 0) {
            stateoutput
                .add(listdataincomming(ITEMname: "Ready", ITEMcode: "-"));
          } else {
            stateoutput
                .add(listdataincomming(ITEMname: "NO PATTERN", ITEMcode: "-"));
          }
          List<String> listitemss = [];
          for (var i = 0; i < INCOMMINGlist.length; i++) {
            listitemss.add(INCOMMINGlist[i]['ITEMs']);
          }
          P02INCOMINGvar_BP12GAS.ListITEM = listitemss;
          for (var i = 0; i < INCOMMINGlist.length; i++) {
            for (var j = 0; j < ITEMnamelist.length; j++) {
              if (ITEMnamelist[j]['masterID'].toString() ==
                  INCOMMINGlist[i]['ITEMs']) {
                // print(ITEMnamelist[j]['ITEMs']);
                // print(ITEMnamelist[j]['masterID']);
                // print(INCOMMINGlist[i]['PCS']);
                // print(INCOMMINGlist[i]['FREQUENCY']);
                stateoutput.add(listdataincomming(
                  ITEMname: ITEMnamelist[j]['ITEMs'],
                  ITEMcode: ITEMnamelist[j]['masterID'],
                  pcs: INCOMMINGlist[i]['PCS'],
                  fre: INCOMMINGlist[i]['FREQUENCY'],
                ));
              }
            }
          }
        }
      }

      //stateoutput = data_test

      emit(stateoutput);
    } else {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = [];
      emit(stateoutput);
    }
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

class listdataincomming {
  listdataincomming({
    this.ITEMname = '',
    this.ITEMcode = '',
    this.pcs = '',
    this.fre = '',
    this.PIC = '',
  });
  String ITEMname;
  String ITEMcode;
  String pcs;
  String fre;
  String PIC;
}
