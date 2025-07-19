import 'package:flutter/material.dart';
import 'package:flutter_power_bi/dashboard_model.dart';
import 'package:flutter_power_bi/custom_dashboard.dart';
import 'dashboard_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TableConfig> tables = [];
  List<Map<String, dynamic>> tableData = [];
  Map<String, dynamic>? data;

  @override
  void initState() {
    tableData = dashboard['tables'];
    _loadData();
    // print(tables);
    super.initState();
  }

  void _loadData() {
    setState(() {
      data = dataSource;
      for (final el in tableData) {
        final datasource = el['datasource'];
        final columns = (el['columns'] as List<dynamic>? ?? [])
            .map((col) => col is ColumnConfig ? col : ColumnConfig.fromMap(col as Map<String, dynamic>))
            .toList();
        List<Map<String, dynamic>> columnValues = [];
        if (datasource != null && data != null && data![datasource] is List) {
          final sourceData = data![datasource] as List<dynamic>;
          for (final row in sourceData) {
            Map<String, dynamic> valueRow = {};
            for (final col in columns) {
              valueRow[col.valueFrom] = row[col.valueFrom];
            }
            columnValues.add(valueRow);
          }
        }
        tables.add(
          TableConfig(
            tableName: el['tableName'],
            heading: el['heading'],
            height: el['height'],
            width: el['width'],
            offsetX: el['offsetX'],
            offsetY: el['offsetY'],
            datasource: datasource,
            columns: columns,
            columnValues: columnValues,
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
              children: [Expanded(child: CustomDashboard(tables: tables))],
            ),
          ),
        ],
      ),
    );
  }
}
