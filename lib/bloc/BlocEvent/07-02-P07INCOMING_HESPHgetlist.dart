import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P07INCOMING_HESPH/P07INCOMINGvar_HESPH.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P07INCOMING_HESPHgetlistEvent {}

/// Notifies bloc to increment state.
class GetDataPressed extends P07INCOMING_HESPHgetlistEvent {}

class FlushITDataPressed extends P07INCOMING_HESPHgetlistEvent {}

class CounterValue extends P07INCOMING_HESPHgetlist {
  final int value;
  CounterValue(this.value);
}

class P07INCOMING_HESPHgetlist
    extends Bloc<P07INCOMING_HESPHgetlistEvent, List<listdataincomming>> {
  /// {@macro counter_bloc}
  P07INCOMING_HESPHgetlist() : super(<listdataincomming>[]) {
    on<GetDataPressed>((event, emit) {
      return _getdata([], emit);
    });
  }
  Future<void> _getdata(List<listdataincomming> toAdd,
      Emitter<List<listdataincomming>> emit) async {
    // FreeLoading(P07INCOMING_HESPHmaincontext);

    // print(zreoover(now.day.toString()));
    final response = await Dio().post(
      server + "07HESPH/getmaster",
      data: {
        "MATNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MATNRnow,
      },
    );

    List<listdataincomming> stateoutput = [];
    if (response.statusCode == 200) {
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
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
          P07INCOMINGvar_HESPH.ListITEM = listitemss;
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
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
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
