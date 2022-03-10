import 'package:flutter/material.dart';

import '../../../data/apiClient/api_client.dart';
import '/core/app_export.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController mobileNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    mobileNumberController.dispose();
  }

  void callGetOtp(Map req,
      {VoidCallback? successCall, VoidCallback? errCall}) async {
    return Get.find<ApiClient>().getOtp(
        headers: {
          'Content-Type': 'application/json',
        },
        onSuccess: (resp) {
          onGetOtpSuccess(resp);
          if (successCall != null) {
            successCall();
          }
        },
        onError: (err) {
          onGetOtpError(err);
          if (errCall != null) {
            errCall();
          }
        },
        requestData: req);
  }

  void onGetOtpSuccess(var response) {
  }

  void onGetOtpError(var err) {
    if (err is NoInternetException) {
      Get.rawSnackbar(
        messageText: Text(
          '$err',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
