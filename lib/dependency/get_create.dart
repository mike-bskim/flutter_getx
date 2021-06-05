import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller_manage_page.dart';

class GetCreate extends StatelessWidget { // StatelessWidget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dependency Test - Get.create'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetCreateBody('Getx Reactive #1'),
            Divider(thickness:2.0, color: Colors.black),
            GetCreateBody('Getx Reactive #2'),
          ],
        ),
      ),
    );
  }
}


class GetCreateBody extends GetWidget<DependencyReactiveController> { // GetWidget

  final String _title;
  GetCreateBody(this._title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(this._title, style: TextStyle(fontSize: 20),),
          Container(height: 10,),
          Obx((){
            return Text("${controller.count}",
              style: TextStyle(fontSize: 15),
            );
          }),
          ElevatedButton(
            child: Text("Get.create"),
            onPressed: () {
              print('hashCode: ${controller.hashCode} / ${controller.count}'); // GetWidget
              controller.increase();
            },
          ),
        ],
      ),
    );
  }

}
