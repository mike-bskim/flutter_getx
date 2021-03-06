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
  void onInit() { // work ??? ???????????? ??????.
    // ??? ??????????????? ??????, ???????????? ??????????????? ??????.
    ever(count, (_) => print("?????? ??????"));
    // ??? ??????????????? ??????, ???????????? ??????????????? ??????.
    once(count, (_) => print("?????? ??????"));
    interval(count, (_) => print("???????????? ?????? ?????? 1??? ???????????? ??????"),
        time: Duration(seconds: 1));
    debounce(count, (_) => print("????????? ????????? ????????? ????????? ?????? ??????"),
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