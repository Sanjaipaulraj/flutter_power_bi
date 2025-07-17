import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_power_bi/dashboard_model.dart';

// ignore: must_be_immutable
class DraggableDashboard extends StatefulWidget {
  List<TableConfig>? tables;
  DraggableDashboard({super.key, required this.tables});

  @override
  State<DraggableDashboard> createState() => _DraggableDashboardState();
}

class _DraggableDashboardState extends State<DraggableDashboard> {
  late List<TableConfig>? tables;
  int intValue = Random().nextInt(5) + 1;
  List<Offset> widgetPositions = [];
  double width = 45;
  double height = 45;
  List<List<Map<String, dynamic>>> allTableData = [];

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
          children: List.generate(widgetPositions.length, (index) {
            return Positioned(
              left: widgetPositions[index].dx,
              top: widgetPositions[index].dy,
              child: DraggableResizableTable(
                index: index,
                data: allTableData[index],
                onDragUpdate: (details) {
                  setState(() {
                    widgetPositions[index] = widgetPositions[index] + details;
                    // Manually constrain the position
                    widgetPositions[index] = Offset(
                      widgetPositions[index].dx.clamp(0.0, 1700 - 200), // Clamp the horizontal position
                      widgetPositions[index].dy.clamp(0.0, 720 - 200), // Clamp the vertical position
                    );
                  });
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DraggableResizableTable extends StatefulWidget {
  final int index;
  final List<Map<String, dynamic>>? data;
  final void Function(Offset delta) onDragUpdate;

  const DraggableResizableTable({super.key, required this.index, required this.data, required this.onDragUpdate});

  @override
  State<DraggableResizableTable> createState() => _DraggableResizableTableState();
}

class _DraggableResizableTableState extends State<DraggableResizableTable> {
  double width = 400;
  double height = 400;
  double minWidth = 200;
  double minHeight = 200;

  List<double> columnWidths = [];

  @override
  void initState() {
    super.initState();
    if (widget.data != null && widget.data!.isNotEmpty) {
      // Initialize column widths based on the number of columns
      columnWidths = List.filled(widget.data![0].keys.length, width / widget.data![0].keys.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data == null || widget.data!.isEmpty) {
      return CircularProgressIndicator();
    }

    Set<String> allKeys = widget.data![0].keys.toSet();
    List<String> keysList = allKeys.toList();

    return GestureDetector(
      onPanUpdate: (details) => widget.onDragUpdate(details.delta),
      child: Stack(
        children: [
          Card(
            elevation: 6,
            color: const Color.fromRGBO(244, 241, 223, 1),
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Table Visual ${widget.index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: const Color.fromRGBO(27, 40, 67, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0; i < keysList.length; i++)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: columnWidths[i],
                                      child: Text(
                                        keysList[i],
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
                            child: Column(
                              children: widget.data!.map((row) {
                                return Row(
                                  children: [
                                    for (int i = 0; i < keysList.length; i++)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: columnWidths[i],
                                            child: Text(
                                              "${row[keysList[i]] ?? ""}",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
