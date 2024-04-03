import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P05INCOMING_HESGAS/P05INCOMING_HESGAS_CONSOLEbox/P05INCOMING_HESGAS_CONSOLEbox.dart';
import '../../page/P05INCOMING_HESGAS/P05INCOMING_HESGASmain.dart';
import '../../page/P05INCOMING_HESGAS/P05INCOMINGvar_HESGAS.dart';
import '../../widget/common/Loading.dart';
import '05-03-P05INCOMING_HESGASgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P05INCOMING_HESGASSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P05INCOMING_HESGASSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P05INCOMING_HESGASSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P05INCOMING_HESGASSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P05INCOMING_HESGASSETEvent {}

class CounterValue extends P05INCOMING_HESGASSET {
  final int value;
  CounterValue(this.value);
}

class P05INCOMING_HESGASSET extends Bloc<P05INCOMING_HESGASSETEvent, String> {
  /// {@macro counter_bloc}
  P05INCOMING_HESGASSET() : super('') {
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
    FreeLoading(P05INCOMING_HESGASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "07HESGAS/SETgood",
      data: {
        "MATNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P05INCOMINGvar_HESGAS.ItemName,
        "ListITEM": P05INCOMINGvar_HESGAS.ListITEM,
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
    Navigator.pop(P05INCOMING_HESGASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P05INCOMING_HESGASmaincontextbox.read<P05INCOMING_HESGASgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P05INCOMING_HESGASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "07HESGAS/SETgood",
      data: {
        "MATNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P05INCOMINGvar_HESGAS.ItemName,
        "ListITEM": P05INCOMINGvar_HESGAS.ListITEM,
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
    Navigator.pop(P05INCOMING_HESGASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P05INCOMING_HESGASmaincontextbox.read<P05INCOMING_HESGASgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P05INCOMING_HESGASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "07HESGAS/SETgood",
      data: {
        "MATNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P05INCOMINGvar_HESGAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P05INCOMINGvar_HESGAS.ItemName,
        "ListITEM": P05INCOMINGvar_HESGAS.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P05INCOMINGvar_HESGAS_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT": P05INCOMINGvar_HESGAS_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P05INCOMINGvar_HESGAS_NOGOODcon.attper,
        "ITEMspecialAccPic01": P05INCOMINGvar_HESGAS_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P05INCOMINGvar_HESGAS_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P05INCOMINGvar_HESGAS_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P05INCOMINGvar_HESGAS_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P05INCOMINGvar_HESGAS_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P05INCOMINGvar_HESGAS_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P05INCOMING_HESGASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P05INCOMING_HESGASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P05INCOMING_HESGASmaincontextbox.read<P05INCOMING_HESGASgetstatus>()
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
