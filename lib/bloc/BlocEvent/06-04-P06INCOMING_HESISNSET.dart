import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P06INCOMING_HESISN/P06INCOMING_HESISN_CONSOLEbox/P06INCOMING_HESISN_CONSOLEbox.dart';
import '../../page/P06INCOMING_HESISN/P06INCOMING_HESISNmain.dart';
import '../../page/P06INCOMING_HESISN/P06INCOMINGvar_HESISN.dart';
import '../../widget/common/Loading.dart';
import '06-03-P06INCOMING_HESISNgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P06INCOMING_HESISNSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P06INCOMING_HESISNSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P06INCOMING_HESISNSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P06INCOMING_HESISNSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P06INCOMING_HESISNSETEvent {}

class CounterValue extends P06INCOMING_HESISNSET {
  final int value;
  CounterValue(this.value);
}

class P06INCOMING_HESISNSET extends Bloc<P06INCOMING_HESISNSETEvent, String> {
  /// {@macro counter_bloc}
  P06INCOMING_HESISNSET() : super('') {
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
    FreeLoading(P06INCOMING_HESISNmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "09HESISN/SETgood",
      data: {
        "MATNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P06INCOMINGvar_HESISN.ItemName,
        "ListITEM": P06INCOMINGvar_HESISN.ListITEM,
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
    Navigator.pop(P06INCOMING_HESISNmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P06INCOMING_HESISNmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P06INCOMING_HESISNmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P06INCOMING_HESISNmaincontextbox.read<P06INCOMING_HESISNgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P06INCOMING_HESISNmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "09HESISN/SETgood",
      data: {
        "MATNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P06INCOMINGvar_HESISN.ItemName,
        "ListITEM": P06INCOMINGvar_HESISN.ListITEM,
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
    Navigator.pop(P06INCOMING_HESISNmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P06INCOMING_HESISNmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P06INCOMING_HESISNmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P06INCOMING_HESISNmaincontextbox.read<P06INCOMING_HESISNgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P06INCOMING_HESISNmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "09HESISN/SETgood",
      data: {
        "MATNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P06INCOMINGvar_HESISN_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P06INCOMINGvar_HESISN.ItemName,
        "ListITEM": P06INCOMINGvar_HESISN.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P06INCOMINGvar_HESISN_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT": P06INCOMINGvar_HESISN_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P06INCOMINGvar_HESISN_NOGOODcon.attper,
        "ITEMspecialAccPic01": P06INCOMINGvar_HESISN_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P06INCOMINGvar_HESISN_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P06INCOMINGvar_HESISN_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P06INCOMINGvar_HESISN_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P06INCOMINGvar_HESISN_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P06INCOMINGvar_HESISN_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P06INCOMING_HESISNmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P06INCOMING_HESISNmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P06INCOMING_HESISNmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P06INCOMING_HESISNmaincontextbox.read<P06INCOMING_HESISNgetstatus>()
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
