import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_simple.dart';


class BindingSamplePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('------------- build(BindingSamplePage) -------------');
    return Scaffold(
      appBar: AppBar(
        title: Text('Buinding test page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<GetxSimpleController>(
                builder: (controller){
                  return Text(controller.count.toString(),
                    style: TextStyle(fontSize: 30),);
                }),
            ElevatedButton(
              child: Text("바인딩 샘플"),
              onPressed: () {
//                GetxSimpleController.to.increment();
                Get.find<GetxSimpleController>().increment();
              },
            ),

          ],
        ),
      ),
    );
  }

}
