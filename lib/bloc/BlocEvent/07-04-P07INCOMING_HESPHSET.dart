import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P07INCOMING_HESPH/P07INCOMING_HESPH_CONSOLEbox/P07INCOMING_HESPH_CONSOLEbox.dart';
import '../../page/P07INCOMING_HESPH/P07INCOMING_HESPHmain.dart';
import '../../page/P07INCOMING_HESPH/P07INCOMINGvar_HESPH.dart';
import '../../widget/common/Loading.dart';

import '07-03-P07INCOMING_HESPHgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P07INCOMING_HESPHSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P07INCOMING_HESPHSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P07INCOMING_HESPHSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P07INCOMING_HESPHSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P07INCOMING_HESPHSETEvent {}

class CounterValue extends P07INCOMING_HESPHSET {
  final int value;
  CounterValue(this.value);
}

class P07INCOMING_HESPHSET extends Bloc<P07INCOMING_HESPHSETEvent, String> {
  /// {@macro counter_bloc}
  P07INCOMING_HESPHSET() : super('') {
    on<SETDataPressedST>((event, emit) {
      return _SETDataPressedST(event.ITEMcode, emit);
    });
    on<SETDataPressedRJ>((event, emit) {
      return _SETDataPressedRJ(event.ITEMcode, emit);
    });

    on<SETDataPressedW8>((event, emit) {
      return _SETDataPressedW8(event.ITEMcode, emit);
    });
  }
  Future<void> _SETDataPressedST(String toAdd, Emitter<String> emit) async {
    FreeLoading(P07INCOMING_HESPHmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "07HESPH/SETgood",
      data: {
        "MATNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P07INCOMINGvar_HESPH.ItemName,
        "ListITEM": P07INCOMINGvar_HESPH.ListITEM,
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
    Navigator.pop(P07INCOMING_HESPHmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P07INCOMING_HESPHmaincontextbox.read<P07INCOMING_HESPHgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P07INCOMING_HESPHmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "07HESPH/SETgood",
      data: {
        "MATNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P07INCOMINGvar_HESPH.ItemName,
        "ListITEM": P07INCOMINGvar_HESPH.ListITEM,
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
    Navigator.pop(P07INCOMING_HESPHmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P07INCOMING_HESPHmaincontextbox.read<P07INCOMING_HESPHgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P07INCOMING_HESPHmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "07HESPH/SETgood",
      data: {
        "MATNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P07INCOMINGvar_HESPH_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P07INCOMINGvar_HESPH.ItemName,
        "ListITEM": P07INCOMINGvar_HESPH.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P07INCOMINGvar_HESPH_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT": P07INCOMINGvar_HESPH_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P07INCOMINGvar_HESPH_NOGOODcon.attper,
        "ITEMspecialAccPic01": P07INCOMINGvar_HESPH_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P07INCOMINGvar_HESPH_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P07INCOMINGvar_HESPH_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P07INCOMINGvar_HESPH_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P07INCOMINGvar_HESPH_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P07INCOMINGvar_HESPH_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P07INCOMING_HESPHmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P07INCOMING_HESPHmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P07INCOMING_HESPHmaincontextbox.read<P07INCOMING_HESPHgetstatus>()
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
