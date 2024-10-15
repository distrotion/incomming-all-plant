import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P11INCOMING_BP12PAL/P11INCOMING_BP12PAL_CONSOLEbox/P11INCOMING_BP12PAL_CONSOLEbox.dart';
import '../../page/P11INCOMING_BP12PAL/P11INCOMING_BP12PALmain.dart';
import '../../page/P11INCOMING_BP12PAL/P11INCOMINGvar_BP12PAL.dart';
import '../../widget/common/Loading.dart';

import '11-03-P08INCOMING_PH12PALgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P11INCOMING_BP12PALSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P11INCOMING_BP12PALSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P11INCOMING_BP12PALSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P11INCOMING_BP12PALSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P11INCOMING_BP12PALSETEvent {}

class CounterValue extends P11INCOMING_BP12PALSET {
  final int value;
  CounterValue(this.value);
}

class P11INCOMING_BP12PALSET extends Bloc<P11INCOMING_BP12PALSETEvent, String> {
  /// {@macro counter_bloc}
  P11INCOMING_BP12PALSET() : super('') {
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
    FreeLoading(P11INCOMING_BP12PALmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "04BP12PAL/SETgood",
      data: {
        "MATNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P11INCOMINGvar_BP12PAL.ItemName,
        "ListITEM": P11INCOMINGvar_BP12PAL.ListITEM,
        "ITEMstatus": "GOOD",
        "ITEMspecialAccStatus": '',
        "ITEMspecialAccCOMMENT": '',
        "ITEMspecialAccPic": '',
        "ITEMspecialAccPic01": '',
        "ITEMspecialAccPic02": '',
        "ITEMspecialAccPic03": '',
        "ITEMspecialAccPic06": '',
        "ITEMspecialAccPic05": '',
        "ITEMsPiecesSelected": '',
      },
    );
    Navigator.pop(P11INCOMING_BP12PALmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P11INCOMING_BP12PALmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P11INCOMING_BP12PALmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P11INCOMING_BP12PALmaincontextbox.read<P11INCOMING_BP12PALgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P11INCOMING_BP12PALmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "04BP12PAL/SETgood",
      data: {
        "MATNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P11INCOMINGvar_BP12PAL.ItemName,
        "ListITEM": P11INCOMINGvar_BP12PAL.ListITEM,
        "ITEMstatus": "reject",
        "ITEMspecialAccStatus": '',
        "ITEMspecialAccCOMMENT": '',
        "ITEMspecialAccPic": '',
        "ITEMspecialAccPic01": '',
        "ITEMspecialAccPic02": '',
        "ITEMspecialAccPic03": '',
        "ITEMspecialAccPic06": '',
        "ITEMspecialAccPic05": '',
        "ITEMsPiecesSelected": '',
      },
    );
    Navigator.pop(P11INCOMING_BP12PALmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P11INCOMING_BP12PALmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P11INCOMING_BP12PALmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P11INCOMING_BP12PALmaincontextbox.read<P11INCOMING_BP12PALgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P11INCOMING_BP12PALmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "04BP12PAL/SETgood",
      data: {
        "MATNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P11INCOMINGvar_BP12PAL_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P11INCOMINGvar_BP12PAL.ItemName,
        "ListITEM": P11INCOMINGvar_BP12PAL.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P11INCOMINGvar_BP12PAL_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT":
            P11INCOMINGvar_BP12PAL_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P11INCOMINGvar_BP12PAL_NOGOODcon.attper,
        "ITEMspecialAccPic01": P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic03,
        "ITEMspecialAccPic06": P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P11INCOMINGvar_BP12PAL_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P11INCOMINGvar_BP12PAL_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P11INCOMING_BP12PALmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P11INCOMING_BP12PALmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P11INCOMING_BP12PALmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P11INCOMING_BP12PALmaincontextbox.read<P11INCOMING_BP12PALgetstatus>()
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
