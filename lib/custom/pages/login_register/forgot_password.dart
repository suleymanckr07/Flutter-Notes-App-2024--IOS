import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/pages/login_register/login_page.dart';
import 'package:flutter_application_1/custom/pages/login_register/otp_verification.dart';
import 'package:flutter_application_1/custom/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

// Todo: ForgotPassword controller

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emaileditingController = TextEditingController();

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
                    ConstantText.resetForgotPassword,
                    style: GoogleFonts.lato().copyWith(
                        fontSize: TextHeightModel.textXlSize32,
                        fontWeight: FontWeight.bold),
                  ),

                  // Todo: SizedBox height with 5
                  const SizedBox(height: SizedBoxHeightModel.height5),

                  // Todo: Forgot Password message description

                  Text(
                    ConstantText.forgotPasswordDescription,
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

                  // Todo: Email

                  Text(
                    ConstantText.email,
                    style: GoogleFonts.lato().copyWith(
                        fontSize: TextHeightModel.descriptionLarge14,
                        fontWeight: FontWeight.bold),
                  ),

                  // Todo: SizedBox height with 10

                  const SizedBox(
                    height: SizedBoxHeightModel.height10,
                  ),

                  // Todo: Email Texformfield

                  TextFormField(
                    controller: _emaileditingController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16))),
                        hintText: ConstantText.emailName,
                        hintStyle: TextStyle(fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16)))),
                  ),

                  // Todo: Send Code button

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
                                const OtpVerification(),
                          ),
                        );
                      }),

                  // Todo: Send Code SizedBox height

                  const SizedBox(
                    height: SizedBoxHeightModel.height25,
                  ),

                  // Todo: Send Code divider

                  const Divider(),

                  // Todo: Already have an account Login button

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantText.rememberPassword,
                        style: GoogleFonts.lato().copyWith(
                            fontSize: TextHeightModel.descriptionLarge14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: SizedBoxHeightModel.height10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          ConstantText.login,
                          style: GoogleFonts.lato().copyWith(
                              color: ColorModel.appRedColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
