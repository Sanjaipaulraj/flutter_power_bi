// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) => Dashboard(
  tables: (json['tables'] as List<dynamic>)
      .map((e) => TableConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
  'tables': instance.tables,
};

TableConfig _$TableConfigFromJson(Map<String, dynamic> json) => TableConfig(
  tableName: json['tableName'] as String,
  heading: json['heading'] as String,
  height: (json['height'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  offsetX: (json['offsetX'] as num?)?.toDouble(),
  offsetY: (json['offsetY'] as num?)?.toDouble(),
  datasource: json['datasource'] as String?,
  columns: (json['columns'] as List<dynamic>?)
      ?.map((e) => ColumnConfig.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TableConfigToJson(TableConfig instance) =>
    <String, dynamic>{
      'tableName': instance.tableName,
      'heading': instance.heading,
      'height': instance.height,
      'width': instance.width,
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'datasource': instance.datasource,
      'columns': instance.columns,
    };

ColumnConfig _$ColumnConfigFromJson(Map<String, dynamic> json) => ColumnConfig(
  title: json['title'] as String,
  valueFrom: json['valueFrom'] as String,
  width: (json['width'] as num).toDouble(),
  nullable: json['nullable'] as bool,
);

Map<String, dynamic> _$ColumnConfigToJson(ColumnConfig instance) =>
    <String, dynamic>{
      'title': instance.title,
      'valueFrom': instance.valueFrom,
      'width': instance.width,
      'nullable': instance.nullable,
    };
