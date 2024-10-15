import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P09INCOMING_BP12KNG/P09INCOMINGvar_BP12KNG.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P09INCOMING_BP12KNGgetstatusEvent {}

/// Notifies bloc to increment state.
class GetDataPressedST extends P09INCOMING_BP12KNGgetstatusEvent {
  GetDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P09INCOMING_BP12KNGgetstatusEvent {}

class CounterValue extends P09INCOMING_BP12KNGgetstatus {
  final int value;
  CounterValue(this.value);
}

class P09INCOMING_BP12KNGgetstatus
    extends Bloc<P09INCOMING_BP12KNGgetstatusEvent, statusinc> {
  /// {@macro counter_bloc}
  P09INCOMING_BP12KNGgetstatus() : super(statusinc()) {
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
    // FreeLoading(P09INCOMING_BP12KNGmaincontext);

    // print(zreoover(now.day.toString()));
    print(toAdd.ITEMcode);
    final response = await Dio().post(
      server + "05BP12KNG/GETdata",
      data: {
        "CHARG": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CHARGnow,
        "CUST_LOT": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.CUST_LOTnow,
        "MATNR": P09INCOMINGvar_BP12KNG_INCOMINGDATAoutput.MATNRnow,
      },
    );

    statusinc stateoutput = statusinc();
    if (response.statusCode == 200) {
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
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
      // Navigator.pop(P09INCOMING_BP12KNGmaincontext);
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
