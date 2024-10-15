import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P10INCOMING_BP12PVD/P10INCOMINGvar_BP12PVD.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P10INCOMING_BP12PVDgetstatusEvent {}

/// Notifies bloc to increment state.
class GetDataPressedST extends P10INCOMING_BP12PVDgetstatusEvent {
  GetDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P10INCOMING_BP12PVDgetstatusEvent {}

class CounterValue extends P10INCOMING_BP12PVDgetstatus {
  final int value;
  CounterValue(this.value);
}

class P10INCOMING_BP12PVDgetstatus
    extends Bloc<P10INCOMING_BP12PVDgetstatusEvent, statusinc> {
  /// {@macro counter_bloc}
  P10INCOMING_BP12PVDgetstatus() : super(statusinc()) {
    on<GetDataPressedST>((event, emit) {
      return _GetDataPressedST(
          statusinc(
            ITEMcode: event.ITEMcode,
          ),
          emit);
    });
  }
  Future<void> _GetDataPressedST(
      statusinc toAdd, Emitter<statusinc> emit) async {
    // FreeLoading(P10INCOMING_BP12PVDmaincontext);

    // print(zreoover(now.day.toString()));
    print(toAdd.ITEMcode);
    final response = await Dio().post(
      server + "06BP12PVD/GETdata",
      data: {
        "CHARG": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CHARGnow,
        "CUST_LOT": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.CUST_LOTnow,
        "MATNR": P10INCOMINGvar_BP12PVD_INCOMINGDATAoutput.MATNRnow,
      },
    );

    statusinc stateoutput = statusinc();
    if (response.statusCode == 200) {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;

      print(databuff);
      if (databuff.length > 0) {
        if (databuff[0][toAdd.ITEMcode] != null) {
          stateoutput = statusinc(
            ITEMcode: toAdd.ITEMcode,
            status: databuff[0][toAdd.ITEMcode]['status'].toString(),
            specialAccStatus:
                databuff[0][toAdd.ITEMcode]['specialAccStatus'].toString(),
            specialAccCOMMENT:
                databuff[0][toAdd.ITEMcode]['specialAccCOMMENT'].toString(),
            specialAccPiecesSelected: databuff[0][toAdd.ITEMcode]
                    ['specialAccPiecesSelected']
                .toString(),
            specialAccPic01:
                databuff[0][toAdd.ITEMcode]['specialAccPic01'].toString(),
            specialAccPic02:
                databuff[0][toAdd.ITEMcode]['specialAccPic02'].toString(),
            specialAccPic03:
                databuff[0][toAdd.ITEMcode]['specialAccPic03'].toString(),
            specialAccPic04:
                databuff[0][toAdd.ITEMcode]['specialAccPic04'].toString(),
            specialAccPic05:
                databuff[0][toAdd.ITEMcode]['specialAccPic05'].toString(),
          );
        }
      }

      //stateoutput = data_test

      emit(stateoutput);
    } else {
      // Navigator.pop(P10INCOMING_BP12PVDmaincontext);
      print("where is my server");
      //stateoutput = data_test
      stateoutput = statusinc();
      emit(stateoutput);
    }
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

class statusinc {
  statusinc({
    this.ITEMcode = '',
    this.status = '',
    this.specialAccStatus = '',
    this.specialAccCOMMENT = '',
    this.specialAccPiecesSelected = '',
    this.specialAccPic01 = '',
    this.specialAccPic02 = '',
    this.specialAccPic03 = '',
    this.specialAccPic04 = '',
    this.specialAccPic05 = '',
  });
  String ITEMcode;
  String status;
  String specialAccStatus;
  String specialAccCOMMENT;
  String specialAccPiecesSelected;
  String specialAccPic01;
  String specialAccPic02;
  String specialAccPic03;
  String specialAccPic04;
  String specialAccPic05;
}
