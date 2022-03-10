import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '/core/app_export.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{

  Rx<TextEditingController> otpController = TextEditingController().obs;


  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
    otpController.value.dispose();

  }
  void callLoginApi(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().login(
        headers: {
          'Content-Type': 'application/json',
        },
        onSuccess: (resp) {
          onCreateAuthloginSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onCreateAuthloginError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onCreateAuthloginSuccess(var response) {
    // postAuthloginResp = PostAuthloginResp.fromJson(response);
  }

  void onCreateAuthloginError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
