final Map<String, dynamic> dashboard = {
  "tables": [
    {
      "tableName": 'StudentInfo',
      "heading": 'Student Information',
      "height": 400.00,
      "width": 500.00,
      "offsetX": 50.00,
      "offsetY": 150.00,
      "datasource": 'student',
      "columns": [
        {"title": 'StudentName', "valueFrom": 'name', "width": 80.00, "nullable": false},
        {"title": 'Tamil', "valueFrom": 'tamil', "width": 80.00, "nullable": false},
        {"title": 'English', "valueFrom": 'english', "width": 80.00, "nullable": false},
        {"title": 'Total', "valueFrom": 'total', "width": 80.00, "nullable": false},
      ],
    },
    {
      "tableName": 'EmployeeInfo',
      "heading": 'Employee Information',
      "height": 400.00,
      "width": 400.00,
      "offsetX": 600.00,
      "offsetY": 150.00,
      "datasource": 'employee',
      "columns": [
        {"title": 'EmpId', "valueFrom": 'empId', "width": 80.00, "nullable": false},
        {"title": 'EmployeeName', "valueFrom": 'empName', "width": 80.00, "nullable": false},
        {"title": 'Department', "valueFrom": 'dept', "width": 80.00, "nullable": false},
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
  "employee": [
    {"empId": 1, "empName": 'Ravi', "dept": 'Finance'},
    {"empId": 2, "empName": 'Raja', "dept": 'Marketing'},
    {"empId": 3, "empName": 'Deepak', "dept": 'Production'},
  ],
};
