import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_manage_page.dart';

class GetPut extends GetView<DependencyUpdateController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dependency Test - Get.put'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<DependencyUpdateController>(
                builder: (controller) {
                  return Text(
                    "숫자증가: ${controller.count}",
                    style: TextStyle(fontSize: 30),
                  );
                }
            ),
            SizedBox(
              width: 130,
              child: ElevatedButton(
                child: Text("Get.put"),
                onPressed: () {
                  print('hashCode: ${controller.hashCode} / ${controller.count}');
                  controller.increase();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
