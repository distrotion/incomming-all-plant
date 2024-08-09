import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:qc_ui_isn_hes/bloc/BlocEvent/08-03-P08INCOMING_HESPALgetStatus.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P08INCOMING_HESPAL/P08INCOMING_HESPAL_CONSOLEbox/P08INCOMING_HESPAL_CONSOLEbox.dart';
import '../../page/P08INCOMING_HESPAL/P08INCOMING_HESPALmain.dart';
import '../../page/P08INCOMING_HESPAL/P08INCOMINGvar_HESPAL.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P08INCOMING_HESPALSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P08INCOMING_HESPALSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P08INCOMING_HESPALSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P08INCOMING_HESPALSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P08INCOMING_HESPALSETEvent {}

class CounterValue extends P08INCOMING_HESPALSET {
  final int value;
  CounterValue(this.value);
}

class P08INCOMING_HESPALSET extends Bloc<P08INCOMING_HESPALSETEvent, String> {
  /// {@macro counter_bloc}
  P08INCOMING_HESPALSET() : super('') {
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
    FreeLoading(P08INCOMING_HESPALmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "10HESPAL/SETgood",
      data: {
        "MATNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P08INCOMINGvar_HESPAL.ItemName,
        "ListITEM": P08INCOMINGvar_HESPAL.ListITEM,
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
    Navigator.pop(P08INCOMING_HESPALmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P08INCOMING_HESPALmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P08INCOMING_HESPALmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P08INCOMING_HESPALmaincontextbox.read<P08INCOMING_HESPALgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P08INCOMING_HESPALmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "10HESPAL/SETgood",
      data: {
        "MATNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P08INCOMINGvar_HESPAL.ItemName,
        "ListITEM": P08INCOMINGvar_HESPAL.ListITEM,
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
    Navigator.pop(P08INCOMING_HESPALmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P08INCOMING_HESPALmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P08INCOMING_HESPALmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P08INCOMING_HESPALmaincontextbox.read<P08INCOMING_HESPALgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P08INCOMING_HESPALmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "10HESPAL/SETgood",
      data: {
        "MATNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P08INCOMINGvar_HESPAL_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P08INCOMINGvar_HESPAL.ItemName,
        "ListITEM": P08INCOMINGvar_HESPAL.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P08INCOMINGvar_HESPAL_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT": P08INCOMINGvar_HESPAL_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P08INCOMINGvar_HESPAL_NOGOODcon.attper,
        "ITEMspecialAccPic01": P08INCOMINGvar_HESPAL_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P08INCOMINGvar_HESPAL_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P08INCOMINGvar_HESPAL_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P08INCOMINGvar_HESPAL_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P08INCOMINGvar_HESPAL_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P08INCOMINGvar_HESPAL_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P08INCOMING_HESPALmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P08INCOMING_HESPALmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P08INCOMING_HESPALmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P08INCOMING_HESPALmaincontextbox.read<P08INCOMING_HESPALgetstatus>()
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
