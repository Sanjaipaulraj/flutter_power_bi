import 'package:flutter/material.dart';
import 'package:flutter_power_bi/dashboard_model.dart';
import 'draggable_dashboard.dart';
import 'dashboard_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TableConfig> tables = [];
  List<Map<String, dynamic>> tableData = [];

  @override
  void initState() {
    tableData = dashboard['tables'];
    _loadData();
    super.initState();
    // print(jsonEncode(tables));
  }

  void _loadData() {
    setState(() {
      for (final el in tableData) {
        tables.add(
          TableConfig(
            tableName: el['tableName'],
            heading: el['heading'],
            height: el['height'],
            width: el['width'],
            offsetX: el['offsetX'],
            offsetY: el['offsetY'],
            datasource: el['datasource'],
            columns: (el['columns'] as List<dynamic>? ?? [])
                .map((col) => col is ColumnConfig ? col : ColumnConfig.fromMap(col as Map<String, dynamic>))
                .toList(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            height: 60,
            color: const Color.fromRGBO(247, 179, 215, 1),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Flutter Power BI",
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.account_circle, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    child: DraggableDashboard(tables: tables),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
