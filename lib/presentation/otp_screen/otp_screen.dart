import 'package:firebase_demo/data/models/authlogin/login_req.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:io';
import '../../core/utils/progress_dialog_utils.dart';
import 'controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_demo/core/app_export.dart';

class OtpScreen extends GetWidget<OtpController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
              padding:  EdgeInsets.all(getSize(20)),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                      'Verify Code',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                        fontSize: getFontSize(20)
                      )
                  ),
                  SizedBox(height: getVerticalSize(20),),
                  Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(
                              14 ),
                          top:
                          getVerticalSize(15 ),
                          right: getHorizontalSize(
                              14 )),
                      child: Container(
                          width: getHorizontalSize(
                              310 ),
                          child: Obx(() => PinCodeTextField(
                              appContext: context,
                              controller: controller
                                  .otpController
                                  .value,
                              length: 4,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: TextInputType
                                  .number,
                              autoDismissKeyboard:
                              true,
                              enableActiveFill: true,
                              onChanged: (value) {
                               if(value.length==4){
                                 callLoginApi();
                               }
                              },
                              pinTheme: PinTheme(
                                  fieldWidth:
                                  getHorizontalSize(
                                      70 ),
                                  shape:
                                  PinCodeFieldShape
                                      .underline,
                                  selectedFillColor:
                                 Colors.white,
                                  activeFillColor:
                                  Colors.blue,
                                  inactiveFillColor: Colors.grey[100],
                                  inactiveColor: Colors.grey[100],
                                  selectedColor:  Colors.white,
                                  activeColor:   Colors.blue,))))),


                ],
    ),
            )));
  }

  void callLoginApi() {
      String contact_number = Get.arguments['contact_number'] ?? '';
      String otp = Get.arguments['otp'] ?? '';
      String device_type = Platform.isAndroid? 'android' : 'ios';
      Loginreq loginReqModel = Loginreq(
        country_code: '+91',
        contact_number: contact_number,
        otp: otp,
        device_token: "1234",
        device_type: device_type
      );
      Get.toNamed(AppRoutes.homeScreen);
      // ProgressDialogUtils.showProgressDialog();
      // controller.callLoginApi(
      //   loginReqModel.toJson(),
      //   successCall: _onLoginSuccess,
      //   errCall: _onLoginError,
      // );
  }


  void _onLoginSuccess() {
  }

  void _onLoginError() {
  }
}
