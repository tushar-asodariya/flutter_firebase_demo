import 'package:firebase_demo/core/app_export.dart';
import 'package:firebase_demo/core/utils/progress_dialog_utils.dart';

class ApiClient extends GetConnect {
  var baseUrl = "https://trootechproducts.com:8020/api/user/";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  Future getOtp(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      Map<String, String> headers = const {},
      Map requestData = const {}}) async {
    // ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('generate-otp/',
          headers: headers, body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (response.statusCode == 200) {
        onSuccess!(response.body);
      } else {
        onError!(
          response.hasError ? response.statusText : 'Something Went Wrong!',
        );
      }
    } catch (error) {
      // ProgressDialogUtils.hideProgressDialog();
      onError!(error);
    }
  }

  Future login(
      {Function(dynamic data)? onSuccess,
        Function(dynamic error)? onError,
        Map<String, String> headers = const {},
        Map requestData = const {}}) async {
    // ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post('login',
          headers: headers, body: requestData);
      ProgressDialogUtils.hideProgressDialog();
      if (response.statusCode == 200) {
        onSuccess!(response.body);
      } else {
        onError!(
          response.hasError ? response.statusText : 'Something Went Wrong!',
        );
      }
    } catch (error) {
      // ProgressDialogUtils.hideProgressDialog();
      onError!(error);
    }
  }
}
