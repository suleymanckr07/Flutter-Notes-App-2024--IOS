import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/pages/login_register/login_page.dart';
import 'package:flutter_application_1/custom/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangedPassword extends StatelessWidget {
  const ChangedPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorModel.appBackColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100, child: Image.asset('assets/images/tick.png')),
              const SizedBox(
                height: SizedBoxHeightModel.height30,
              ),
              Text(
                ConstantText.passwordChangedTitle,
                style: GoogleFonts.lato().copyWith(
                    fontSize: TextHeightModel.textXlSize32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: SizedBoxHeightModel.height10,
              ),
              Text(
                ConstantText.passwordChangedDescription,
                style: GoogleFonts.lato().copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: SizedBoxHeightModel.height30,
              ),
              MaterialButton(
                  highlightColor: ColorModel.appPurpleColor,
                  minWidth: double.infinity,
                  color: ColorModel.appTextColorBlack,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          BorderRadiusSizeModel.borderRadiusM10))),
                  child: Text(
                    ConstantText.backToLogin,
                    style: GoogleFonts.lato().copyWith(
                        color: ColorModel.appTextColorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: TextHeightModel.textMediumSize16),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
