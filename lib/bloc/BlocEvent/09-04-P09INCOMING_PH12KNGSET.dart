import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P09INCOMING_BP12KNG/P09INCOMING_BP12KNG_CONSOLEbox/P09INCOMING_BP12KNG_CONSOLEbox.dart';
import '../../page/P09INCOMING_BP12KNG/P09INCOMING_BP12KNGmain.dart';
import '../../page/P09INCOMING_BP12KNG/P09INCOMINGvar_BP12KNG.dart';
import '../../widget/common/Loading.dart';
import '09-03-P09INCOMING_PH12KNGgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P09INCOMING_BP12KNGSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P09INCOMING_BP12KNGSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P09INCOMING_BP12KNGSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P09INCOMING_BP12KNGSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P09INCOMING_BP12KNGSETEvent {}

class CounterValue extends P09INCOMING_BP12KNGSET {
  final int value;
  CounterValue(this.value);
}

class P09INCOMING_BP12KNGSET extends Bloc<P09INCOMING_BP12KNGSETEvent, String> {
  /// {@macro counter_bloc}
  P09INCOMING_BP12KNGSET() : super('') {
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
    FreeLoading(P09INCOMING_BP12KNGmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "05BP12KNG/SETgood",
      data: {
        "MATNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P09INCOMINGvar_BP12KNG.ItemName,
        "ListITEM": P09INCOMINGvar_BP12KNG.ListITEM,
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
    Navigator.pop(P09INCOMING_BP12KNGmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P09INCOMING_BP12KNGmaincontextbox.read<P09INCOMING_BP12KNGgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P09INCOMING_BP12KNGmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "05BP12KNG/SETgood",
      data: {
        "MATNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P09INCOMINGvar_BP12KNG.ItemName,
        "ListITEM": P09INCOMINGvar_BP12KNG.ListITEM,
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
    Navigator.pop(P09INCOMING_BP12KNGmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P09INCOMING_BP12KNGmaincontextbox.read<P09INCOMING_BP12KNGgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P09INCOMING_BP12KNGmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "05BP12KNG/SETgood",
      data: {
        "MATNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P09INCOMINGvar_BP12KNG.ItemName,
        "ListITEM": P09INCOMINGvar_BP12KNG.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P09INCOMINGvar_BP12KNG_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT":
            P09INCOMINGvar_BP12KNG_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P09INCOMINGvar_BP12KNG_NOGOODcon.attper,
        "ITEMspecialAccPic01": P09INCOMINGvar_BP12KNG_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P09INCOMINGvar_BP12KNG_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P09INCOMINGvar_BP12KNG_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P09INCOMINGvar_BP12KNG_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P09INCOMINGvar_BP12KNG_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P09INCOMINGvar_BP12KNG_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P09INCOMING_BP12KNGmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P09INCOMING_BP12KNGmaincontextbox.read<P09INCOMING_BP12KNGgetstatus>()
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
