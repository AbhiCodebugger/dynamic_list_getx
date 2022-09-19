import 'package:dynamic_list_getx/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Explore '),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                hintText: 'Employee name',
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controller.ageController,
              decoration: InputDecoration(
                hintText: 'Employee age',
                labelText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.addEmployee(controller.nameController.text,
                    controller.ageController.text);
              },
              child: const Text('Add'),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  'Employee Recordes',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: Obx(
              () => controller.employee.isEmpty
                  ? const Center(
                      child: Text(
                        'No Record Found',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: ((context, index) => const Divider()),
                      physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      itemCount: controller.employee.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: Text(
                            "Name : ${controller.employee[index].name}",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Age : ${controller.employee[index].age}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.removeEmployee(index);
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                          ),
                        );
                      })),
            ))
          ],
        ),
      ),
    );
  }
}
