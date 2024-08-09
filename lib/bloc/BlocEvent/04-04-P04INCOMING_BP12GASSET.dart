import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P04INCOMING_PB12PH/P04INCOMING_BP12PH_CONSOLEbox/P04INCOMING_BP12PH_CONSOLEbox.dart';
import '../../page/P04INCOMING_PB12PH/P04INCOMING_BP12PHmain.dart';
import '../../page/P04INCOMING_PB12PH/P04INCOMINGvar_BP12PH.dart';
import '../../widget/common/Loading.dart';
import '04-03-P04INCOMING_BP12PHgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P04INCOMING_BP12PHSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P04INCOMING_BP12PHSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedSTWDATA extends P04INCOMING_BP12PHSETEvent {
  SETDataPressedSTWDATA({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P04INCOMING_BP12PHSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P04INCOMING_BP12PHSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P04INCOMING_BP12PHSETEvent {}

class CounterValue extends P04INCOMING_BP12PHSET {
  final int value;
  CounterValue(this.value);
}

class P04INCOMING_BP12PHSET extends Bloc<P04INCOMING_BP12PHSETEvent, String> {
  /// {@macro counter_bloc}
  P04INCOMING_BP12PHSET() : super('') {
    on<SETDataPressedST>((event, emit) {
      return _SETDataPressedST(event.ITEMcode, emit);
    });
    on<SETDataPressedSTWDATA>((event, emit) {
      return _SETDataPressedSTWDATA(event.ITEMcode, emit);
    });
    on<SETDataPressedRJ>((event, emit) {
      return _SETDataPressedRJ(event.ITEMcode, emit);
    });

    on<SETDataPressedW8>((event, emit) {
      return _SETDataPressedW8(event.ITEMcode, emit);
    });
  }
  Future<void> _SETDataPressedST(String toAdd, Emitter<String> emit) async {
    FreeLoading(P04INCOMING_BP12PHmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "03BP12PH/SETgood",
      data: {
        "MATNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P04INCOMINGvar_BP12PH.ItemName,
        "ListITEM": P04INCOMINGvar_BP12PH.ListITEM,
        "DATAINPUT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.DATAINPUT,
        "ITEMstatus": "GOOD",
        "ITEMspecialAccStatus": '',
        "ITEMspecialAccCOMMENT": '',
        "ITEMspecialAccPic": '',
        "ITEMspecialAccPic01": '',
        "ITEMspecialAccPic02": '',
        "ITEMspecialAccPic03": '',
        "ITEMspecialAccPic04": '',
        "ITEMspecialAccPic05": '',
        "ITEMsPiecesSelected": '',
      },
    );
    Navigator.pop(P04INCOMING_BP12PHmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P04INCOMING_BP12PHmaincontextbox.read<P04INCOMING_BP12PHgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedSTWDATA(
      String toAdd, Emitter<String> emit) async {
    FreeLoading(P04INCOMING_BP12PHmaincontext);

    // print(zreoover(now.day.toString()));
    // print(P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.setofdatainlist);
    List<List<String>> DATAOUT = [];

    for (var i = 0;
        i < P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.setofdatainlist.length;
        i++) {
      DATAOUT.add([]);
      for (var j = 0;
          j <
              P04INCOMINGvar_BP12PH_INCOMINGDATAoutput
                  .setofdatainlist[i].length;
          j++) {
        DATAOUT[i].add(P04INCOMINGvar_BP12PH_INCOMINGDATAoutput
            .setofdatainlist[i][j].VALUE);
      }
    }

    // print(DATAOUT);

    final response = await Dio().post(
      server + "03BP12PH/SETgoodandDATA",
      data: {
        "MATNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P04INCOMINGvar_BP12PH.ItemName,
        "ListITEM": P04INCOMINGvar_BP12PH.ListITEM,
        "DATAINPUT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.DATAINPUT,
        "ITEMstatus": "GOOD",
        "ITEMspecialAccStatus": '',
        "ITEMspecialAccCOMMENT": '',
        "ITEMspecialAccPic": '',
        "ITEMspecialAccPic01": '',
        "ITEMspecialAccPic02": '',
        "ITEMspecialAccPic03": '',
        "ITEMspecialAccPic04": '',
        "ITEMspecialAccPic05": '',
        "ITEMsPiecesSelected": '',
        "DATASET": DATAOUT
      },
    );
    Navigator.pop(P04INCOMING_BP12PHmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P04INCOMING_BP12PHmaincontextbox.read<P04INCOMING_BP12PHgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P04INCOMING_BP12PHmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "03BP12PH/SETgood",
      data: {
        "MATNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P04INCOMINGvar_BP12PH.ItemName,
        "ListITEM": P04INCOMINGvar_BP12PH.ListITEM,
        "DATAINPUT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.DATAINPUT,
        "ITEMstatus": "reject",
        "ITEMspecialAccStatus": '',
        "ITEMspecialAccCOMMENT": '',
        "ITEMspecialAccPic": '',
        "ITEMspecialAccPic01": '',
        "ITEMspecialAccPic02": '',
        "ITEMspecialAccPic03": '',
        "ITEMspecialAccPic04": '',
        "ITEMspecialAccPic05": '',
        "ITEMsPiecesSelected": '',
      },
    );
    Navigator.pop(P04INCOMING_BP12PHmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P04INCOMING_BP12PHmaincontextbox.read<P04INCOMING_BP12PHgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P04INCOMING_BP12PHmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "03BP12PH/SETgood",
      data: {
        "MATNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P04INCOMINGvar_BP12PH.ItemName,
        "ListITEM": P04INCOMINGvar_BP12PH.ListITEM,
        "DATAINPUT": P04INCOMINGvar_BP12PH_INCOMINGDATAoutput.DATAINPUT,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P04INCOMINGvar_BP12PH_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT": P04INCOMINGvar_BP12PH_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P04INCOMINGvar_BP12PH_NOGOODcon.attper,
        "ITEMspecialAccPic01": P04INCOMINGvar_BP12PH_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P04INCOMINGvar_BP12PH_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P04INCOMINGvar_BP12PH_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P04INCOMINGvar_BP12PH_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P04INCOMINGvar_BP12PH_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P04INCOMINGvar_BP12PH_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P04INCOMING_BP12PHmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P04INCOMING_BP12PHmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P04INCOMING_BP12PHmaincontextbox.read<P04INCOMING_BP12PHgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
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
