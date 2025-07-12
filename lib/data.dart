import 'dart:math';
import 'package:faker/faker.dart';

// List<Map<String, dynamic>> getArray() {
//   var faker = Faker();
//   List<Map<String, dynamic>> list = [];
//   int value = Random().nextInt(1000) + 1;
//   print("Random Row : $value");
//   for (var i = 0; i < value; i++) {
//     list.add({
//       "Name": faker.person.name(),
//       "City": faker.address.city(),
//       "Mobile": faker.phoneNumber.us(),
//       "Company": faker.company.name(),
//     });
//   }
//   return list;
// }

List<Map<String, dynamic>> getArray(int tableIndex) {
  final faker = Faker();
  final random = Random();
  final int rowCount = random.nextInt(1000) + 10;

  List<Map<String, dynamic>> data = [];

  switch (tableIndex % 3) {
    case 0:
      for (int i = 0; i < rowCount; i++) {
        data.add({
          "Name": faker.person.name(),
          "City": faker.address.city(),
          "Mobile": faker.phoneNumber.us(),
          "Company": faker.company.name(),
        });
      }
      break;

    case 1:
      for (int i = 0; i < rowCount; i++) {
        data.add({"Vehicle Name": faker.vehicle.make(), "Model": faker.vehicle.model(), "Year": faker.vehicle.year()});
      }
      break;

    case 2:
      for (int i = 0; i < rowCount; i++) {
        data.add({"Restaurant": faker.food.restaurant(), "Dish": faker.food.dish(), "Cuisine": faker.food.cuisine()});
      }
      break;

    default:
      break;
  }

  return data;
}
