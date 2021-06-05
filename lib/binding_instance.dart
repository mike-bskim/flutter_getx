import 'package:get/get.dart';
import 'getx_simple.dart';


class BindingInstancePages implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(GetxSimpleController());
  }

}