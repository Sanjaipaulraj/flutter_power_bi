import 'package:flutter/material.dart';
import 'package:flutter_power_bi/dashboard_model.dart';

// ignore: must_be_immutable
class CustomDashboard extends StatefulWidget {
  List<TableConfig> tables;
  CustomDashboard({super.key, required this.tables});

  @override
  State<CustomDashboard> createState() => _CustomDashboardState();
}

class _CustomDashboardState extends State<CustomDashboard> {
  List<TableConfig> tables = [];

  @override
  void initState() {
    super.initState();
    tables = widget.tables;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 2000,
        height: 2000,
        child: Stack(
          clipBehavior: Clip.none,
          children: List.generate(tables.length, (index) {
            return Positioned(
              left: tables[index].offsetX,
              top: tables[index].offsetY,
              child: CustomTable(index: index, data: tables[index]),
            );
          }),
        ),
      ),
    );
  }
}

class CustomTable extends StatefulWidget {
  final int index;
  final TableConfig? data;

  const CustomTable({super.key, required this.index, required this.data});

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  double width = 0.0;
  double height = 0.0;
  List<ColumnConfig> columns = [];

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    height = widget.data!.height ?? 400;
    width = widget.data!.width ?? 400;
    columns = widget.data!.columns ?? [];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      return CircularProgressIndicator();
    }

    return Card(
      elevation: 6,
      color: const Color.fromRGBO(244, 241, 223, 1),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(" ${widget.data!.heading}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: const Color.fromRGBO(27, 40, 67, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (final col in columns)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: col.width,
                                child: Text(
                                  col.title,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      // child: Column(
                      //       children: widget.data!.map((row) {
                      //         return Row(
                      //           children: [
                      //             for (int i = 0; i < keysList.length; i++)
                      //               Expanded(
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.all(8.0),
                      //                   child: SizedBox(
                      //                     width: columnWidths[i],
                      //                     child: Text(
                      //                       "${row[keysList[i]] ?? ""}",
                      //                       overflow: TextOverflow.ellipsis,
                      //                       textAlign: TextAlign.left,
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //           ],
                      //         );
                      //       }).toList(),
                      //     ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
