import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P03INCOMING_GWGAS/P03INCOMING_GWGASmain.dart';
import '../../page/P03INCOMING_GWGAS/P03INCOMINGvar_GWGAS.dart';
import '../../widget/common/Loading.dart';

// String server = 'http://localhost:10000/';
String server = GLOserver;

//172.23.10.39

DateTime now = new DateTime.now();

/// Event being processed by [CounterBloc].
abstract class P03INCOMING_GWGASgetstatusEvent {}

/// Notifies bloc to increment state.
class GetDataPressedST extends P03INCOMING_GWGASgetstatusEvent {
  GetDataPressedST({required this.ITEMcode});

  String ITEMcode;
}

class FlushITDataPressed extends P03INCOMING_GWGASgetstatusEvent {}

class CounterValue extends P03INCOMING_GWGASgetstatus {
  final int value;
  CounterValue(this.value);
}

class P03INCOMING_GWGASgetstatus
    extends Bloc<P03INCOMING_GWGASgetstatusEvent, statusinc> {
  /// {@macro counter_bloc}
  P03INCOMING_GWGASgetstatus() : super(statusinc()) {
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
    // FreeLoading(P03INCOMING_GWGASmaincontext);

    // print(zreoover(now.day.toString()));
    print(toAdd.ITEMcode);
    final response = await Dio().post(
      server + "02GWGAS/GETdata",
      data: {
        "CHARG": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CHARGnow,
        "CUST_LOT": P03INCOMINGvar_GWGAS_INCOMINGDATAoutput.CUST_LOTnow,
      },
    );

    statusinc stateoutput = statusinc();
    if (response.statusCode == 200) {
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
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
      // Navigator.pop(P03INCOMING_GWGASmaincontext);
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
