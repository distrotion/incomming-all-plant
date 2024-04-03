import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P05INCOMING_HESGAS/P05INCOMINGvar_HESGAS.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P05INCOMING_HESGASgetlistEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends P05INCOMING_HESGASgetlistEvent {}

class FlushITDataPressed extends P05INCOMING_HESGASgetlistEvent {}

class CounterValue extends P05INCOMING_HESGASgetlist {
  final int value;
  CounterValue(this.value);
}

class P05INCOMING_HESGASgetlist
    extends Bloc<P05INCOMING_HESGASgetlistEvent, List<listdataincomming>> {
  /// {@macro counter_bloc}
  P05INCOMING_HESGASgetlist() : super(<listdataincomming>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(List<listdataincomming> toAdd,
      Emitter<List<listdataincomming>> emit) async {
    // FreeLoading(P05INCOMING_HESGASmaincontext);

    // print(zreoover(now.day.toString()));
    final response = await Dio().post(
      server + "07HESGAS/getmaster",
      data: {
        "MATNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MATNRnow,
      },
    );

    List<listdataincomming> stateoutput = [];
    if (response.statusCode == 200) {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
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
          P05INCOMINGvar_HESGAS.ListITEM = listitemss;
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
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
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
