import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P02INCOMING_BP12GAS/P02INCOMING_BP12GAS_CONSOLEbox/P02INCOMING_BP12GAS_CONSOLEbox.dart';
import '../../page/P02INCOMING_BP12GAS/P02INCOMING_BP12GASmain.dart';
import '../../page/P02INCOMING_BP12GAS/P02INCOMINGvar_BP12GAS.dart';
import '../../widget/common/Loading.dart';
import '02-03-P02INCOMING_BP12GASgetStatus.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P02INCOMING_BP12GASSETEvent {}

/// Notifies bloc to increment state.
class SETDataPressedST extends P02INCOMING_BP12GASSETEvent {
  SETDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedRJ extends P02INCOMING_BP12GASSETEvent {
  SETDataPressedRJ({required this.ITEMcode});

  String ITEMcode;
}

class SETDataPressedW8 extends P02INCOMING_BP12GASSETEvent {
  SETDataPressedW8({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P02INCOMING_BP12GASSETEvent {}

class CounterValue extends P02INCOMING_BP12GASSET {
  final int value;
  CounterValue(this.value);
}

class P02INCOMING_BP12GASSET extends Bloc<P02INCOMING_BP12GASSETEvent, String> {
  /// {@macro counter_bloc}
  P02INCOMING_BP12GASSET() : super('') {
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
    FreeLoading(P02INCOMING_BP12GASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "01BP12GAS/SETgood",
      data: {
        "MATNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P02INCOMINGvar_BP12GAS.ItemName,
        "ListITEM": P02INCOMINGvar_BP12GAS.ListITEM,
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
    Navigator.pop(P02INCOMING_BP12GASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P02INCOMING_BP12GASmaincontextbox.read<P02INCOMING_BP12GASgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedRJ(String toAdd, Emitter<String> emit) async {
    FreeLoading(P02INCOMING_BP12GASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "01BP12GAS/SETgood",
      data: {
        "MATNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P02INCOMINGvar_BP12GAS.ItemName,
        "ListITEM": P02INCOMINGvar_BP12GAS.ListITEM,
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
    Navigator.pop(P02INCOMING_BP12GASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P02INCOMING_BP12GASmaincontextbox.read<P02INCOMING_BP12GASgetstatus>()
        .add(GetDataPressedST(
      ITEMcode: toAdd,
    ));
    emit(stateoutput);
  }

  Future<void> _SETDataPressedW8(String toAdd, Emitter<String> emit) async {
    FreeLoading(P02INCOMING_BP12GASmaincontext);

    // print(zreoover(now.day.toString()));

    final response = await Dio().post(
      server + "01BP12GAS/SETgood",
      data: {
        "MATNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MATNRnow,
        "CHARG": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.CHARGnow,
        "MBLNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MBLNRnow,
        "BWART": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.BWARTnow,
        "MENGE": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MENGEnow,
        "MEINS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MEINSnow,
        "MAT_FG": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.MAT_FGnow,
        "KUNNR": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.KUNNRnow,
        "SORTL": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.SORTLnow,
        "NAME1": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.NAME1now,
        "CUST_LOT": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.CUST_LOTnow,
        "PART_NM": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PART_NMnow,
        "PART_NO": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PART_NOnow,
        "PROCESS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.PROCESSnow,
        "OLDMAT_CP": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.OLDMAT_CPnow,
        "STATUS": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.STATUSnow,
        "UserNO": P02INCOMINGvar_BP12GAS_INCOMINGDATAoutput.UserNO,
        //
        "ITEMcode": toAdd,
        "ITEM": P02INCOMINGvar_BP12GAS.ItemName,
        "ListITEM": P02INCOMINGvar_BP12GAS.ListITEM,
        "ITEMstatus": "WAIT",
        "ITEMspecialAccStatus": P02INCOMINGvar_BP12GAS_NOGOODcon.yesno,
        "ITEMspecialAccCOMMENT":
            P02INCOMINGvar_BP12GAS_NOGOODcon.SpacialAccText,
        "ITEMspecialAccPic": P02INCOMINGvar_BP12GAS_NOGOODcon.attper,
        "ITEMspecialAccPic01": P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic01,
        "ITEMspecialAccPic02": P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic02,
        "ITEMspecialAccPic03": P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic03,
        "ITEMspecialAccPic04": P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic04,
        "ITEMspecialAccPic05": P02INCOMINGvar_BP12GAS_NOGOODcon.base64pic05,
        "ITEMsPiecesSelected":
            P02INCOMINGvar_BP12GAS_NOGOODcon.PiecesDropdownSelected,
      },
    );
    Navigator.pop(P02INCOMING_BP12GASmaincontext);

    String stateoutput = '';
    if (response.statusCode == 200) {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);

      //stateoutput = data_test
    } else {
      // Navigator.pop(P02INCOMING_BP12GASmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = '';
    }

    P02INCOMING_BP12GASmaincontextbox.read<P02INCOMING_BP12GASgetstatus>()
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
