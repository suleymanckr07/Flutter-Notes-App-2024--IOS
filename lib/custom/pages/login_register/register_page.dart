import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/pages/home_page/home_page.dart';
import 'package:flutter_application_1/custom/pages/login_register/login_page.dart';
import 'package:flutter_application_1/custom/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
// Todo: Controller should

  static bool obscurePassword = true;
  static bool rememberMeCheck = false;
  final TextEditingController _emaileditingController = TextEditingController();
  final TextEditingController _phoneeditingController = TextEditingController();
  final TextEditingController _passwordeditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorModel.appBackColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: SizedBoxHeightModel.height50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ConstantText.createAnAccount,
                    style: GoogleFonts.lato().copyWith(
                        fontSize: TextHeightModel.textXlSize32,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: SizedBoxHeightModel.height5),
                  Text(
                    ConstantText.createAnAccountDescription,
                    style: GoogleFonts.lato().copyWith(
                      fontSize: TextHeightModel.descriptionLarge14,
                      color: ColorModel.appTextColorGrey2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                  const SizedBox(
                    height: SizedBoxHeightModel.height5,
                  ),
                  TextFormField(
                    controller: _emaileditingController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16))),
                        hintText: 'example@gmail.com',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16)))),
                  ),

                  // Todo: Phone number

                  const SizedBox(
                    height: SizedBoxHeightModel.height20,
                  ),
                  Text(
                    ConstantText.phoneNumberTitle,
                    style: GoogleFonts.lato().copyWith(
                        fontSize: TextHeightModel.descriptionLarge14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: SizedBoxHeightModel.height5,
                  ),
                  TextFormField(
                    controller: _phoneeditingController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16))),
                        hintText: '+90 | ',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                BorderRadiusSizeModel.borderRadiusL16)))),
                  ),

                  // Todo: Passwords

                  const SizedBox(
                    height: SizedBoxHeightModel.height20,
                  ),
                  Text(
                    ConstantText.passwordTitle,
                    style: GoogleFonts.lato().copyWith(
                        fontSize: TextHeightModel.descriptionLarge14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: SizedBoxHeightModel.height5,
                  ),
                  TextFormField(
                    controller: _passwordeditingController,
                    obscureText: obscurePassword,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: obscurePassword
                              ? ColorModel.appTextColorBlack
                              : ColorModel.appPurpleColor,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(
                              BorderRadiusSizeModel.borderRadiusL16))),
                      hintText: ConstantText.password,
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(BorderRadiusSizeModel.borderRadiusL16),
                        ),
                      ),
                    ),
                  ),

                  // Todo: Remember me Check box

                  const SizedBox(
                    height: SizedBoxHeightModel.height10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        shape: const CircleBorder(eccentricity: 1),
                        fillColor: const MaterialStatePropertyAll(Colors.white),
                        checkColor: ColorModel.appTextColorBlack,
                        value: rememberMeCheck,
                        onChanged: (value) {
                          setState(() {
                            rememberMeCheck = value!;
                          });
                        },
                      ),
                      Text(
                        ConstantText.remember,
                        style: GoogleFonts.lato().copyWith(
                            fontSize: TextHeightModel.descriptionLarge14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),

                  // Todo: Sign up button

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
                        'Sign Up',
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
                                        const LoginPage(),
                                  ),
                                );
                      }),

                  // Todo: Sign Up SizedBox height

                  const SizedBox(
                    height: SizedBoxHeightModel.height40,
                  ),

                  // Todo: Divider

                  const Divider(),

                  // Todo: SizedBox size  with 100 * 4

                  /*   const SizedBox(
                        height: SizedBoxHeight.height50 * 4,
                      ), */

                  // Todo: Already have an account Login button

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ConstantText.alreadyAccount,
                            style: GoogleFonts.lato().copyWith(
                                fontSize: TextHeightModel.descriptionLarge14,
                                fontWeight: FontWeight.bold,
                                color: ColorModel.appTextColorGrey2),
                          ),
                          const SizedBox(
                            width: SizedBoxHeightModel.height10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const HomePage(),
                                ),
                              );
                            },
                            child: Text(
                              ConstantText.login,
                              style: GoogleFonts.lato().copyWith(
                                  fontSize: TextHeightModel.descriptionLarge14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorModel.appTextColorBlack),
                            ),
                          )
                        ],
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
