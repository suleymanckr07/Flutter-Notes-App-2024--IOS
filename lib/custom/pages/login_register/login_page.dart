import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/pages/home_page/home_page.dart';
import 'package:flutter_application_1/custom/pages/login_register/forgot_password.dart';
import 'package:flutter_application_1/custom/pages/login_register/register_page.dart';
import 'package:flutter_application_1/custom/utils/constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// Todo: Controller should

  static bool obscurePassword = true;
  static bool rememberMeCheck = false;
  final TextEditingController _emaileditingController = TextEditingController();
  final TextEditingController _passwordeditingController =
      TextEditingController();

  void signUsersIn() async {
    
   await showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
          ),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emaileditingController.text,
          password: _passwordeditingController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

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
            // Todo: Sized box height with 50
            const SizedBox(
              height: SizedBoxHeightModel.height50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Todo: Welcome message
                  Text(
                    ConstantText.welcomeBackTitle,
                    style: GoogleFonts.lato().copyWith(
                        fontSize: TextHeightModel.textXlSize32,
                        fontWeight: FontWeight.bold),
                  ),

                  // Todo: SizedBox height with 5
                  const SizedBox(height: SizedBoxHeightModel.height5),

                  // Todo: Welcome message description

                  Text(
                    ConstantText.welcomeBackDescription,
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
                    height: SizedBoxHeightModel.height10,
                  ),
                  TextFormField(
                    controller: _passwordeditingController,
                    obscureText: obscurePassword,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
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
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                              BorderRadiusSizeModel.borderRadiusL16),
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
                      ),
                      const Spacer(),

                      // Todo: Forgot Password

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ForgotPassword(),
                            ),
                          );
                        },
                        child: Text(
                          ConstantText.forgotPassword,
                          style: GoogleFonts.lato().copyWith(
                              color: ColorModel.appRedColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
                        ConstantText.login,
                        style: GoogleFonts.lato().copyWith(
                            color: ColorModel.appTextColorWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: TextHeightModel.textMediumSize16),
                      ),
                      onPressed: () {
                        signUsersIn();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false);
                      }),

                  // Todo: Sign Up SizedBox height

                  const SizedBox(
                    height: SizedBoxHeightModel.height40,
                  ),

                  // Todo: Divider Or continue with the

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: ColorModel.appTextColorGrey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            ConstantText.orWith,
                            style: GoogleFonts.lato().copyWith(
                                fontSize: TextHeightModel.descriptionLarge14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: ColorModel.appTextColorGrey,
                        ))
                      ],
                    ),
                  ),

                  // Todo: Social Button

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Todo: Facebook Button

                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                  BorderRadiusSizeModel.borderRadiusM10),
                            ),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Facebook Button')));
                              },
                              child: SvgPicture.asset(
                                'assets/icons/facebook.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),

                        // Todo: Google Button

                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                  BorderRadiusSizeModel.borderRadiusM10),
                            ),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Google Button')));
                              },
                              child: SvgPicture.asset(
                                'assets/icons/google.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),

                        //Todo: Apple Button

                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                  BorderRadiusSizeModel.borderRadiusM10),
                            ),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Apple Button')));
                              },
                              child: SvgPicture.asset(
                                'assets/icons/apple.svg',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Todo: SizedBox size  with 100 * 4

                  const SizedBox(
                    height: SizedBoxHeightModel.height50 * 3,
                  ),

                  // Todo: Already have an account Login button

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantText.alreadyAccount,
                        style: GoogleFonts.lato().copyWith(
                            fontSize: TextHeightModel.descriptionLarge14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: SizedBoxHeightModel.height10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          ConstantText.signUp,
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
