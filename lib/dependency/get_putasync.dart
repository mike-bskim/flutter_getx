import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_manage_page.dart';

class GetPutAsync extends GetView<DependencyUpdateController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dependency Test - Get.putAsync'),),
      body: Center(
        child: ElevatedButton(
          child: Text("Get.putAsync"),
          onPressed: () {
            print('hashCode: ${controller.hashCode} / ${controller.count}');
            controller.increase();
          },
        ),
      ),
    );
  }
}
