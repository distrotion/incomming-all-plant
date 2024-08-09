import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-01-P07INCOMING_HESPHget.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/Cubit/Rebuild.dart';
import '../../data/Base64Img.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../model/model.dart';
import '../../widget/common/Loading.dart';

import '../../data/dummydata.dart';
import '../page1.dart';

import 'P07INCOMING_HESPH_CONSOLEbox/P07INCOMING_HESPH_CONSOLEbox.dart';
import 'P07INCOMINGvar_HESPH.dart';

//------------------------------------

late BuildContext P07INCOMING_HESPHmaincontext;
String _searchResult = '';

class P07INCOMING_HESPHmain extends StatelessWidget {
  /// {@macro counter_page}
  P07INCOMING_HESPHmain({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return TableBodyRebuild(
      data: data,
    );
  }
}

class TableBodyRebuild extends StatelessWidget {
  TableBodyRebuild({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocPageRebuild>(
            create: (BuildContext context) =>
                BlocPageRebuild(), //For rebuild only page inside without app bar/left menu
          ),
        ],
        child: TableBody(
          data: data,
        ));
  }
}

class TableBody extends StatefulWidget {
  TableBody({Key? key, this.data, this.DD_INCM}) : super(key: key);
  List<dataset>? data;
  DropDownData_INCM? DD_INCM;

  @override
  _TableBodyState createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  int _sortColumnIndex = 5;
  bool _sortAscending = true;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    P07INCOMINGvar_HESPH_INCOMINGDATAoutput.UserNO = USERDATA.ID;
    context.read<P07INCOMING_HESPHget>().add(GetDataPressed());
  }

  @override
  Widget build(BuildContext context) {
    P07INCOMING_HESPHmaincontext = context;

    List<dataset> datain = widget.data ?? [];
    // List<dataset> datain = data_test;

    if (_searchResult != '') {
      List<dataset> _data_exp = [];

      for (int i = 0; i < datain.length; i++) {
        if (datain[i].f01.toLowerCase().contains(_searchResult) ||
            datain[i].f02.toLowerCase().contains(_searchResult) ||
            datain[i].f03.toLowerCase().contains(_searchResult) ||
            datain[i].f04.toLowerCase().contains(_searchResult) ||
            datain[i].f05.toLowerCase().contains(_searchResult) ||
            datain[i].f06.toLowerCase().contains(_searchResult)) {
          _data_exp.add(datain[i]);
        }
      }

      datain = _data_exp;
    }

    MyData _data = MyData(context, datain);

    void _sort<T>(Comparable<T> Function(dataset d) getField, int columnIndex,
        bool ascending) {
      _data._sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }

    // print('------->' + '${_DD_INCM.list01}');

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: 1200,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      CuPage = Page1();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    },
                    child: SizedBox(
                      height: 60,
                      width: 300,
                      child: Center(
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  weight: 100,
                                  size: 40,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Text(
                                "BACK",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: (value) {
                        setState(() {
                          _searchResult = value;
                        });
                      }),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        controller.clear();
                        _searchResult = '';
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  width: 1200,
                  child: PaginatedDataTable(
                    source: _data,
                    header: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('INCOMING HES PH'),
                        Row(
                          children: [
                            // ElevatedButton(
                            //   onPressed: () {},
                            //   style: ButtonStyle(
                            //     backgroundColor:
                            //         MaterialStateProperty.all(Colors.red),
                            //   ),
                            //   child: const Text("FLUSH"),
                            // ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<P07INCOMING_HESPHget>()
                                    .add(GetDataPressed());
                              },
                              child: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    columns: [
                      DataColumn(
                          label: Text('ID'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<num>(
                                  (dataset d) => d.id, columnIndex, ascending)),
                      DataColumn(
                          label: Text('MATCP'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f01, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CUST NAME'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f02, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('PART NAME'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f03, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('PART NO'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f04, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CHARG'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f05, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('CUST LOT'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f06, columnIndex,
                                  ascending)),
                      DataColumn(
                          label: Text('QTY'),
                          onSort: (int columnIndex, bool ascending) =>
                              _sort<String>((dataset d) => d.f13, columnIndex,
                                  ascending)),
                    ],
                    columnSpacing: 25,
                    horizontalMargin: 10,
                    rowsPerPage: 10,
                    sortColumnIndex: _sortColumnIndex,
                    sortAscending: _sortAscending,
                    showCheckboxColumn: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final BuildContext context;
  late List<dataset> _data;
  late List<dataset> input;
  late List list01;

  int _selectedCount = 0;
  MyData.empty(this.context) {
    _data = [];
  }
  MyData(
    this.context,
    this.input,
  ) {
    _data = input;

    // _data_exp = [];

    // _data = _data_exp;
  }

  void _sort<T>(Comparable<T> Function(dataset d) getField, bool ascending) {
    _data.sort((dataset a, dataset b) {
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    final dataset data = _data[index];
    String for_Rust = data.f25;
    String for_Scratch = data.f26;
    return DataRow.byIndex(
        index: index,
        selected: for_Rust != '-' || for_Scratch != '-',
        color: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected) &&
              for_Rust == 'GOOD' &&
              for_Scratch == 'GOOD') {
            return Colors.green;
          } else if (states.contains(MaterialState.selected) &&
              (for_Rust == 'reject' || for_Scratch == 'reject')) {
            return Colors.red;
          } else if (states.contains(MaterialState.selected) &&
              (for_Rust == 'WAIT' || for_Scratch == 'WAIT')) {
            return Colors.orange;
          }

          return null; // Use the default value.
        }),
        onSelectChanged: (value) {
          // if (data.selected != value) {
          //   _selectedCount += value! ? 1 : -1;
          //   assert(_selectedCount >= 0);
          //   data.selected = value;
          // }
          // data.selected = true;
          //-----------
          // confirmPass = false;

          // print(data.f01);

          // if (data.f01 == '24000001') {
          //   data.selected = true;
          // }

          //-----------

          P07INCOMINGvar_HESPH.ItemNow = 0;
          P07INCOMINGvar_HESPH.modeNOGOOD = false;
          P07INCOMINGvar_HESPH.ItemName = '';
          P07INCOMINGvar_HESPH.statusNow = '';
          P07INCOMINGvar_HESPH.specialAccStatusNow = '';
          P07INCOMINGvar_HESPH.specialAccCOMMENTNow = '';
          P07INCOMINGvar_HESPH.specialAccPicNow = '';
          P07INCOMINGvar_HESPH.confirmPass = '';
          P07INCOMINGvar_HESPH.wait = '';
          P07INCOMINGvar_HESPH.PassText = '';
          P07INCOMINGvar_HESPH.ListITEM = [];

          P07INCOMINGvar_HESPH_NOGOODcon.NoGoodPage = 1;
          P07INCOMINGvar_HESPH_NOGOODcon.PiecesDropdownSelected = '1';
          P07INCOMINGvar_HESPH_NOGOODcon.yesno = 0;
          P07INCOMINGvar_HESPH_NOGOODcon.undercontrol = false;
          P07INCOMINGvar_HESPH_NOGOODcon.SpacialAccText = '';
          P07INCOMINGvar_HESPH_NOGOODcon.attper = 0;
          P07INCOMINGvar_HESPH_NOGOODcon.base64pic01 = imgw;
          P07INCOMINGvar_HESPH_NOGOODcon.base64pic02 = imgw;
          P07INCOMINGvar_HESPH_NOGOODcon.base64pic03 = imgw;
          P07INCOMINGvar_HESPH_NOGOODcon.base64pic04 = imgw;
          P07INCOMINGvar_HESPH_NOGOODcon.base64pic05 = imgw;

          //-----------
          // _selectedCount += value! ? 1 : -1;
          // assert(_selectedCount >= 0);
          // data.selected = value;
          // print(index);
          // print(data.f01);
          // print(data.f03);

          // onLoadingType01(context, () {}, () {}
          //     // context
          //     //     .read<DropDownData_INCM_Bloc>()
          //     //     .add(DropDownData_INCM_Pressed()),
          //     // ConsoleBox(data, _list01),
          //     );

          P07INCOMING_HESPH_ConsoleBoxBODY(data, context);
          notifyListeners();
        },
        cells: [
          DataCell(Text(
            data.id.toString(),
          )),
          DataCell(Text(data.f01)),
          DataCell(Text(data.f02)),
          DataCell(Text(data.f03)),
          DataCell(Text(data.f04)),
          DataCell(Text(data.f05)),
          DataCell(Text(data.f06)),
          DataCell(Text(data.f13)),
        ]);
  }
}
