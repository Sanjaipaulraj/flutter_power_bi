import 'package:json_annotation/json_annotation.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class Dashboard {
  final List<TableConfig> tables;

  Dashboard({required this.tables});

  factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable()
class TableConfig {
  final String tableName;
  final String heading;
  final double? height;
  final double? width;
  final double? offsetX;
  final double? offsetY;
  final String? datasource;
  final List<ColumnConfig>? columns;
  final List<Map<String, dynamic>>? columnValues;

  TableConfig({
    required this.tableName,
    required this.heading,
    this.height,
    this.width,
    this.offsetX,
    this.offsetY,
    this.datasource,
    this.columns,
    this.columnValues,
  });

  factory TableConfig.fromJson(Map<String, dynamic> json) => _$TableConfigFromJson(json);
  Map<String, dynamic> toJson() => _$TableConfigToJson(this);

  @override
  toString() {
    return 'TableConfig(tableName: $tableName, heading: $heading, height: $height, width: $width, offsetX: $offsetX, offsetY: $offsetY, datasource: $datasource, columns: $columns, columnValues: $columnValues, )';
  }
}

@JsonSerializable()
class ColumnConfig {
  final String title;
  final String valueFrom;
  final double width;
  final bool nullable;

  ColumnConfig({required this.title, required this.valueFrom, required this.width, required this.nullable});

  factory ColumnConfig.fromMap(Map<String, dynamic> map) {
    return ColumnConfig(
      title: map['title'] as String,
      valueFrom: map['valueFrom'] as String,
      width: map['width'] as double,
      nullable: map['nullable'] as bool,
      // Add other fields as needed
    );
  }

  factory ColumnConfig.fromJson(Map<String, dynamic> json) => _$ColumnConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ColumnConfigToJson(this);

  @override
  toString() {
    return 'ColumnConfig(title: $title, valueFrom: $valueFrom, width: $width, nullable: $nullable)';
  }
}
