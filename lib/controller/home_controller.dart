import 'package:dynamic_list_getx/model/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<Employee> _employee = <Employee>[].obs;
  late TextEditingController nameController, ageController;
  RxInt itemCount = 0.obs;

  RxList<Employee> get employee => _employee;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    ageController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    ageController.dispose();
  }

  addEmployee(String name, String age) {
    _employee.add(Employee(name: name, age: age));
    nameController.clear();
    ageController.clear();
  }

  removeEmployee(int index) {
    _employee.removeAt(index);
    itemCount.value = _employee.length;
  }
}
