import 'package:firebase_demo/core/app_export.dart';
import 'package:firebase_demo/data/apiClient/api_client.dart';
import 'package:firebase_core/firebase_core.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
    // await Firebase.initializeApp();
  }
}
