import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxSimpleController extends GetxController {

//  static GetxSimpleController get to => Get.find();
  int count = 0;

  void increment() {
    count++;
    update();
  }

  void putNumber(int number) {
    count = number;
    update();
  }
}


class GetxSimple extends StatelessWidget {

//  final _getxSimpleController = Get.put(GetxSimpleController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Getx Update', style: TextStyle(fontSize: 20),),
          Container(height: 10,),
          GetBuilder<GetxSimpleController>(
            builder: (controller) {
              print('GetBuilder(update) called: ${controller.count}');
              return Text("${controller.count}",
                style: TextStyle(fontSize: 15),
              );
            },
          ),
          Container(height: 10,),
          SizedBox(
            width: 120,
            height: 40,
            child: ElevatedButton(
              child: Text("+", style: TextStyle(fontSize: 30)),
              onPressed: () {
//              _getxSimpleController.increment();
                Get.find<GetxSimpleController>().increment();
              },
            ),
          ),
          Container(height: 10,),
          SizedBox(
            width: 120,
            height: 40,
            child: ElevatedButton(
              child: Text("Reset", style: TextStyle(fontSize: 30)),
              onPressed: () {
//              _getxSimpleController.increment();
                Get.find<GetxSimpleController>().putNumber(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GetxReactiveController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count++;
//    update();
  }

  void putNumber(int number) {
//    count = number;
    count(number);
//    update();
  }

  @override
  void onInit() { // work 를 설정할수 있음.
    // 매 번경시마다 동작, 리엑티브 상태일때만 가능.
    ever(count, (_) => print("매번 호출"));
    // 매 번경시마다 동작, 리엑티브 상태일때만 가능.
    once(count, (_) => print("최초 호출"));
    interval(count, (_) => print("변경되고 있는 동안 1초 간격으로 호출"),
        time: Duration(seconds: 1));
    debounce(count, (_) => print("마지막 변경에 한번만 시간차 두고 호출"),
        time: Duration(seconds: 2));
    super.onInit();
  }
}


class GetxReactiv extends StatelessWidget {

  final _getxReactiveController = Get.put(GetxReactiveController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Getx Reactive', style: TextStyle(fontSize: 20),),
          Container(height: 10,),
          Obx((){
            print('Obx(reactive) called: ${_getxReactiveController.count}');
            return Text("${_getxReactiveController.count}",
              style: TextStyle(fontSize: 15),
            );
          }),

          Container(height: 10,),
          SizedBox(
            width: 120,
            height: 40,
            child: ElevatedButton(
              child: Text("+", style: TextStyle(fontSize: 30)),
              onPressed: () {
              _getxReactiveController.increment();
              },
            ),
          ),
          Container(height: 10,),
          SizedBox(
            width: 120,
            height: 40,
            child: ElevatedButton(
              child: Text("Reset", style: TextStyle(fontSize: 30)),
              onPressed: () {
              _getxReactiveController.putNumber(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}