final Map<String, dynamic> dashboard = {
  "tables": [
    {
      "tableName": 'StudentInfo',
      "heading": 'Student Information',
      "height": 400.00,
      "width": 400.00,
      "offsetX": 50.00,
      "offsetY": 150.00,
      "datasource": 'student',
      "columns": [
        {"title": 'StudentName', "valueFrom": 'name', "width": 80.00, "nullable": false},
        {"title": 'English', "valueFrom": 'english', "width": 80.00, "nullable": false},
        {"title": 'Tamil', "valueFrom": 'tamil', "width": 80.00, "nullable": false},
        {"title": 'Total', "valueFrom": 'total', "width": 80.00, "nullable": false},
      ],
    },
  ],
};
Map<String, dynamic> dataSource = {
  "student": [
    {"id": 1, "name": 'Ravi', "english": 85, "tamil": 74, "total": 159},
    {"id": 2, "name": 'Raja', "english": 90, "tamil": 70, "total": 160},
    {"id": 3, "name": 'Deepak', "english": 78, "tamil": 86, "total": 154},
  ],
};
