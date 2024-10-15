import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P10INCOMING_BP12PVD/P10INCOMINGvar_BP12PVD.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P10INCOMING_BP12PVDgetlistEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends P10INCOMING_BP12PVDgetlistEvent {}

class FlushITDataPressed extends P10INCOMING_BP12PVDgetlistEvent {}

class CounterValue extends P10INCOMING_BP12PVDgetlist {
  final int value;
  CounterValue(this.value);
}

class P10INCOMING_BP12PVDgetlist
    extends Bloc<P10INCOMING_BP12PVDgetlistEvent, List<listdataincomming>> {
  /// {@macro counter_bloc}
  P10INCOMING_BP12PVDgetlist() : super(<listdataincomming>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(List<listdataincomming> toAdd,
      Emitter<List<listdataincomming>> emit) async {
    // FreeLoading(P10INCOMING_BP12PVDmaincontext);

    // print(zreoover(now.day.toString()));
    final response = await Dio().post(
      server + "06BP12PVD/getmaster",
      data: {
        "MATNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MATNRnow,
      },
    );

    List<listdataincomming> stateoutput = [];
    if (response.statusCode == 200) {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
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
          P10INCOMINGvar_BP12PVD.ListITEM = listitemss;
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
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
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
