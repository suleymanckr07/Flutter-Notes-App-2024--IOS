import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/pages/login_register/changed_password.dart';
import 'package:flutter_application_1/custom/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';
    
class CreatePassword extends StatefulWidget {

  const CreatePassword({ super.key });

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorModel.appBackColor,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: ColorModel.appBackColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Todo: Sized box height with 50 */
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Todo: Welcome message
                  Text(
                    ConstantText.createNewPasswordTitle,
                    style: GoogleFonts.lato().copyWith(
                        fontSize: TextHeightModel.textXlSize32,
                        fontWeight: FontWeight.bold),
                  ),

                  // Todo: SizedBox height with 5
                  const SizedBox(height: SizedBoxHeightModel.height5),

                  // Todo: Forgot Password message description

                  Text(
                    ConstantText.createNewPasswordDescription,
                    style: GoogleFonts.lato().copyWith(
                      fontSize: TextHeightModel.descriptionLarge14,
                      color: ColorModel.appTextColorGrey2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Todo: SizedBox height with 50

                  const SizedBox(
                    height: SizedBoxHeightModel.height50,
                  ),

                  // Todo: New Password 

                TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16))),
                        hintText: ConstantText.newPasswordText,
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16)))),
                  ),

                  // Todo: SizedBox

                  const SizedBox(
                    height: SizedBoxHeightModel.height20,
                  ),

                  // Todo: Confirm New Password

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16))),
                        hintText: ConstantText.newPasswordConfirmText,
                        hintStyle: TextStyle(fontWeight: FontWeight.w400,),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16)))),
                  ),

                  // Todo: Verify Code button

                  const SizedBox(
                    height: SizedBoxHeightModel.height20,
                  ),
                  MaterialButton(
                      highlightColor: ColorModel.appPurpleColor,
                      minWidth: double.infinity,
                      color: ColorModel.appTextColorBlack,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              BorderRadiusSizeModel.borderRadiusM10))),
                      child: Text(
                        ConstantText.sendCode,
                        style: GoogleFonts.lato().copyWith(
                            color: ColorModel.appTextColorWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: TextHeightModel.textMediumSize16),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ChangedPassword(),
                          ),
                        );
                      }),

                  // Todo: Send Code SizedBox height

                  const SizedBox(
                    height: SizedBoxHeightModel.height25,
                  ),


                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}