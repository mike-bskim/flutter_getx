import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_create.dart';
import 'get_lazyput.dart';
import 'get_put.dart';
import 'get_putasync.dart';


class DependencyUpdateController extends GetxController {
  int count=0;
  void increase() {
    count++;
    update();
  }
}


class DependencyReactiveController extends GetxController {
  RxInt count=0.obs;
  void increase() {
    count++;
  }

  void putNumber(int number) {
    count(number);
  }

  @override
  void onInit() { // work 를 설정할수 있음.
    super.onInit();
  }
}


class DependencyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 130,
            child: ElevatedButton(
              child: Text("Get.put()"),
              onPressed: () {
                Get.to(() => GetPut(),
                  binding: BindingsBuilder(() {
                    Get.put(DependencyUpdateController());
                  }),
                );
              },
            ),
          ),
          SizedBox(
            width: 130,
            child: ElevatedButton(
              child: Text("Get.lazyPut()"),
              onPressed: () {
                Get.to(() => GetLazyPut(),
                  binding: BindingsBuilder(() {
                    Get.lazyPut<DependencyUpdateController>(
                            () => DependencyUpdateController());
                  }),
                );
              },
            ),
          ),
          SizedBox(
            width: 130,
            child: ElevatedButton(
              child: Text("Get.putAsync()"),
              onPressed: () {
                Get.to(() => GetPutAsync(),
                  binding: BindingsBuilder(() {
                    Get.putAsync<DependencyUpdateController>(() async {
                      await Future.delayed(Duration(seconds: 5));
                      return DependencyUpdateController();
                    });
                  }),
                );
              },
            ),
          ),
          SizedBox(
            width: 130,
            child: ElevatedButton(
              child: Text("Get.create()"),
              onPressed: () {
                Get.to(() => GetCreate(),
                  binding: BindingsBuilder(() {
                    Get.create<DependencyReactiveController>( // DependencyReactiveController/DependencyReactiveController
                            () => DependencyReactiveController());
                  }),
                );
              },
            ),
          )
        ],

      ),
    );
  }
}
