import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P10INCOMING_BP12PVD/P10INCOMING_BP12PVD_CONSOLEbox/P10INCOMING_BP12PVD_CONSOLEbox.dart';
import '../../page/P10INCOMING_BP12PVD/P10INCOMING_BP12PVDmain.dart';
import '../../page/P10INCOMING_BP12PVD/P10INCOMINGvar_BP12PVD.dart';
import '../../widget/common/Loading.dart';
import '10-03-P08INCOMING_PH12PVDgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P10INCOMING_BP12PVDSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P10INCOMING_BP12PVDSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P10INCOMING_BP12PVDSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P10INCOMING_BP12PVDSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P10INCOMING_BP12PVDSETEvent {}

class CounterValue extends P10INCOMING_BP12PVDSET {
  final int value;
  CounterValue(this.value);
}

class P10INCOMING_BP12PVDSET extends Bloc<P10INCOMING_BP12PVDSETEvent, String> {
  /// {@macro counter_bloc}
  P10INCOMING_BP12PVDSET() : super('') {
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
    FreeLoading(P10INCOMING_BP12PVDmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "06BP12PVD/SETgood",
      data: {
        "MATNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P10INCOMINGvar_BP12PVD.ItemName,
        "ListITEM": P10INCOMINGvar_BP12PVD.ListITEM,
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
    Navigator.pop(P10INCOMING_BP12PVDmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P10INCOMING_BP12PVDmaincontextbox.read<P10INCOMING_BP12PVDgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P10INCOMING_BP12PVDmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "06BP12PVD/SETgood",
      data: {
        "MATNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P10INCOMINGvar_BP12PVD.ItemName,
        "ListITEM": P10INCOMINGvar_BP12PVD.ListITEM,
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
    Navigator.pop(P10INCOMING_BP12PVDmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P10INCOMING_BP12PVDmaincontextbox.read<P10INCOMING_BP12PVDgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P10INCOMING_BP12PVDmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "06BP12PVD/SETgood",
      data: {
        "MATNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P10INCOMINGvar_BP12PVD.ItemName,
        "ListITEM": P10INCOMINGvar_BP12PVD.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P10INCOMINGvar_BP12PVD_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT":
            P10INCOMINGvar_BP12PVD_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P10INCOMINGvar_BP12PVD_NOGOODcon.attper,
        "ITEMspecialAccPic01": P10INCOMINGvar_BP12PVD_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P10INCOMINGvar_BP12PVD_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P10INCOMINGvar_BP12PVD_NOGOODcon.base64pic03,
        "ITEMspecialAccPic06": P10INCOMINGvar_BP12PVD_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P10INCOMINGvar_BP12PVD_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P10INCOMINGvar_BP12PVD_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P10INCOMING_BP12PVDmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P10INCOMING_BP12PVDmaincontextbox.read<P10INCOMING_BP12PVDgetstatus>()
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
