import 'package:firebase_demo/data/models/authlogin/otp_req.dart';
import 'package:flutter/services.dart';

import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_demo/core/app_export.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
              padding:  EdgeInsets.all(getSize(20)),
              child:
                 Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone Number',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black
                        )
                      ),
                      SizedBox(height: getVerticalSize(20),),
                      Center(
                        child: TextFormField(
                          controller: controller.mobileNumberController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.phone,

                          validator: (value) {
                            if (value == null || value.isEmpty || value.length<10) {
                              return 'Please enter valid phone number.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            hintStyle:  const TextStyle(
                                color: Colors.grey
                            ),

                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  10.00,
                                ),
                              ),

                              borderSide: BorderSide(
                                color: Colors.black,
                                width: getSize(1),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(
                                  5.00,
                                ),
                                right: getHorizontalSize(
                                  10.00,
                                ),
                                top: getVerticalSize(10),
                                bottom: getVerticalSize(10)
                              ),
                              child: Container(
                                alignment: Alignment.center,

                                  decoration: const BoxDecoration(

                                    border: Border(right: BorderSide(color: Colors.grey)),
                                  ),
                                height: getSize(
                                  16.84,
                                ),
                                width: getSize(
                                 20
                                ),
                                child:const Text('+91',
                                style: TextStyle(
                                    color: Colors.grey
                                ),)
                              ),
                            ),

                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            contentPadding: EdgeInsets.only(
                              top: getVerticalSize(
                                15.21,
                              ),
                              bottom: getVerticalSize(
                                15.37,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: getFontSize(
                              14.0,
                            ),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(50),),
                      InkWell(
                        onTap: (){
                          getOtp();
                        },
                        child: Container(
                          height: getVerticalSize(70),
                          decoration: const BoxDecoration(
                          color: Colors.blue,
                            borderRadius: BorderRadius.all(
                                Radius.circular(100) //                 <--- border radius here
                            ),
                          ),
                          child: Center(
                            child: Text('Get OTP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: getFontSize(24)
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

            )));
  }

    getOtp(){
      if (
      controller.formKey.currentState!=null && controller.formKey.currentState!.validate()) {
        Otpreq otpReqModel = Otpreq(
          contact_number: controller.mobileNumberController.text,
          country_code: '+91'
        );

        Get.toNamed(AppRoutes.otpScreen,arguments: {
          'contact_number': controller.mobileNumberController.text,
          'otp' : '7894'
        });
        // ProgressDialogUtils.showProgressDialog();
        // controller.callGetOtp(
        //   otpReqModel.toJson(),
        //   successCall: _onGetOtpSuccess,
        //   errCall: _onGetOtpError,
        // );
      }

    }

  void _onGetOtpSuccess() {

  }

  void _onGetOtpError() {

  }
}
