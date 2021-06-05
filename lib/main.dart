import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'binding_instance.dart';
import 'binding_sample.dart';
import 'dependency/controller_manage_page.dart';
import 'getx_simple.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DependencyTestPage(),
//      getPages: [
//        GetPage(name: '/binding', page: () => BindingSamplePage(),
//          binding: BindingsBuilder(() {
//            Get.put(GetxSimpleController());
//          }),
//        ),
//        GetPage(name: '/binding', page: () => BindingSamplePage(),
//          binding: BindingInstancePages(),),
//      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    //instantiating your Getx controller
    Get.put(GetxSimpleController());

    print('------------ build(MyHomePage) ------------');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Getx Update/Reactive'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          GetxSimple(),
          Container(height: 40,),
          GetxReactiv(),
          ]
        ),
      ),

    );
  }
}

// Binding Test main page
class _BindingTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //instantiating your Getx controller
//    Get.put(GetxSimpleController());

    print('------------ build(_BindingTestPage) ------------');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Binding Test Page'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                  child: Text("바인딩 관리 Get.toNamed"),
                  onPressed: () {
                    Get.toNamed('/binding');
                  },
                ),
              ),
              Container(height: 40,),
              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                  child: Text("바인딩 관리 Get.put"),
                  onPressed: () {
                    Get.to(
                        () => BindingSamplePage(),
                      binding: BindingsBuilder(() {
                        Get.put(GetxSimpleController());
                      }),
                    );
                  },
                ),
              ),
            ]
        ),
      ),
    );
  }
}


class DependencyTestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    print('------------ build(DependencyMainPage) ------------');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dependency Test'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DependencyMainPage(),
            ]
        ),
      ),
    );
  }
}
