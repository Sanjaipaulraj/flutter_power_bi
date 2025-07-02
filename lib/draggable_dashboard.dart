import 'package:flutter/material.dart';
import 'package:flutter_power_bi/data.dart';

class DraggableDashboard extends StatefulWidget {
  const DraggableDashboard({super.key});

  @override
  State<DraggableDashboard> createState() => _DraggableDashboardState();
}

class _DraggableDashboardState extends State<DraggableDashboard> {
  List<Offset> widgetPositions = [Offset(50, 50), Offset(250, 100), Offset(100, 300)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 2000,
        height: 2000,
        child: Stack(
          children: List.generate(widgetPositions.length, (index) {
            return Positioned(
              left: widgetPositions[index].dx,
              top: widgetPositions[index].dy,
              child: DraggableResizableTable(
                index: index,
                onDragUpdate: (details) {
                  setState(() {
                    widgetPositions[index] += details;
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
  final void Function(Offset delta) onDragUpdate;

  const DraggableResizableTable({super.key, required this.index, required this.onDragUpdate});

  @override
  State<DraggableResizableTable> createState() => _DraggableResizableTableState();
}

class _DraggableResizableTableState extends State<DraggableResizableTable> {
  double width = 400;
  double height = 400;
  double minWidth = 200;
  double minHeight = 200;

  @override
  Widget build(BuildContext context) {
    Set<String> allKeys = {};
    final dt = data.toList();
    for (var obj in dt) {
      allKeys.addAll(obj.keys);
    }
    return GestureDetector(
      onPanUpdate: (details) => widget.onDragUpdate(details.delta),
      child: Stack(
        children: [
          Card(
            elevation: 6,
            color: const Color.fromARGB(255, 180, 229, 238),
            child: Container(
              width: width,
              height: height,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text("Table Visual ${widget.index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    color: const Color.fromARGB(255, 7, 21, 206),
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var item in allKeys)
                          Text(
                            item.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dt.length,
                      itemBuilder: (BuildContext context, int index) {
                        final ls = dt[index];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [for (var item in allKeys) Text("${ls[item] ?? " "}", textAlign: TextAlign.left)],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Left resize zone
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 10,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  setState(() {
                    width = (width - details.delta.dx).clamp(minWidth, double.infinity);
                  });
                  widget.onDragUpdate(Offset(details.delta.dx, 0));
                },
              ),
            ),
          ),

          // Right resize zone
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 10,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  setState(() {
                    width = (width + details.delta.dx).clamp(minWidth, double.infinity);
                  });
                },
              ),
            ),
          ),

          // Top resize zone
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 10,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  setState(() {
                    height = (height - details.delta.dy).clamp(minHeight, double.infinity);
                  });
                  widget.onDragUpdate(Offset(0, details.delta.dy)); // shift down as we shrink up
                },
              ),
            ),
          ),

          // Bottom resize zone
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 10,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  setState(() {
                    height = (height + details.delta.dy).clamp(minHeight, double.infinity);
                  });
                },
              ),
            ),
          ),

          // Bottom-Right corner (diagonal resize)
          Positioned(
            right: 0,
            bottom: 0,
            width: 20,
            height: 20,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpLeftDownRight,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onPanUpdate: (details) {
                  setState(() {
                    width = (width + details.delta.dx).clamp(minWidth, double.infinity);
                    height = (height + details.delta.dy).clamp(minHeight, double.infinity);
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
