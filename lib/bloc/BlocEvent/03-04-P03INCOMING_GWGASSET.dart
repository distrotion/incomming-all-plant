import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P03INCOMING_GWGAS/P03INCOMING_GWGAS_CONSOLEbox/P03INCOMING_GWGAS_CONSOLEbox.dart';
import '../../page/P03INCOMING_GWGAS/P03INCOMING_GWGASmain.dart';
import '../../page/P03INCOMING_GWGAS/P03INCOMINGvar_GWGAS.dart';
import '../../widget/common/Loading.dart';
import '03-03-P03INCOMING_GWGASgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P03INCOMING_GWGASSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P03INCOMING_GWGASSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P03INCOMING_GWGASSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P03INCOMING_GWGASSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P03INCOMING_GWGASSETEvent {}

class CounterValue extends P03INCOMING_GWGASSET {
  final int value;
  CounterValue(this.value);
}

class P03INCOMING_GWGASSET extends Bloc<P03INCOMING_GWGASSETEvent, String> {
  /// {@macro counter_bloc}
  P03INCOMING_GWGASSET() : super('') {
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
    FreeLoading(P03INCOMING_GWGASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "02GWGAS/SETgood",
      data: {
        "MATNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P03INCOMINGvar_GWGAS.ItemName,
        "ListITEM": P03INCOMINGvar_GWGAS.ListITEM,
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
    Navigator.pop(P03INCOMING_GWGASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P03INCOMING_GWGASmaincontextbox.read<P03INCOMING_GWGASgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P03INCOMING_GWGASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "02GWGAS/SETgood",
      data: {
        "MATNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P03INCOMINGvar_GWGAS.ItemName,
        "ListITEM": P03INCOMINGvar_GWGAS.ListITEM,
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
    Navigator.pop(P03INCOMING_GWGASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P03INCOMING_GWGASmaincontextbox.read<P03INCOMING_GWGASgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P03INCOMING_GWGASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "02GWGAS/SETgood",
      data: {
        "MATNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P03INCOMINGvar_GWGAS.ItemName,
        "ListITEM": P03INCOMINGvar_GWGAS.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P03INCOMINGvar_GWGAS_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT": P03INCOMINGvar_GWGAS_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P03INCOMINGvar_GWGAS_NOGOODcon.attper,
        "ITEMspecialAccPic01": P03INCOMINGvar_GWGAS_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P03INCOMINGvar_GWGAS_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P03INCOMINGvar_GWGAS_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P03INCOMINGvar_GWGAS_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P03INCOMINGvar_GWGAS_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P03INCOMINGvar_GWGAS_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P03INCOMING_GWGASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P03INCOMING_GWGASmaincontextbox.read<P03INCOMING_GWGASgetstatus>()
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
