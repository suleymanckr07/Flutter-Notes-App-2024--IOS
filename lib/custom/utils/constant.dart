import 'dart:ui';

// Todo: App is currently using colors in the

class ColorModel {
  static const Color appBackColor = Color(0xffFAF6EF);
  static const Color appTextColorBlack = Color(0xff272829);
  static const Color appTextColorWhite = Color(0xfFf7F7F7);
  static const Color appTextColorGrey = Color(0xffB4B4B8);
  static const Color appTextColorGrey2 = Color(0xffA8A196);
  static const Color appRedColor = Color(0xffB31312);
  static const Color appGreenColor = Color(0xff9BCF53);
  static const Color appPurpleColor = Color(0xff5F5D9C);
}

// Todo: Text Height

class TextHeightModel {
  static const double textXxlSize36 = 36;
  static const double textXlSize32 = 32;
  static const double textLargeSize24 = 24;
  static const double textMediumSize16 = 16;
  static const double textSmallSize12 = 12;
  static const double descriptionLarge14 = 14;
  static const double descriptionMedium12 = 12;
  static const double descriptionSmall10 = 10;
  static const double descriptionXSmall8 = 8;
}

// Todo: Border Radius 

class  BorderRadiusSizeModel {
  static const double borderRadiusM10 = 10;
  static const double borderRadiusL16 = 16;
  static const double borderRadiusXl32 = 32;
}


// Todo: Sized box height 

class SizedBoxHeightModel {
  static const double height5 = 5;
  static const double height10 = 10;
  static const double height20 = 20;
  static const double height25 = 25;
  static const double height30 = 30;
  static const double height40 = 40;
  static const double height50 = 50;
}

class ConstantText {
  // Todo: Sign Up page for the current

  static const String createAnAccount = "Create An Account";
  static const String createAnAccountDescription = "Step into digital world";
  static const String email = "Email";
  static const String phoneNumberTitle = "Phone Number";
  static const String phoneNumberText = "Enter your phone number";
  static const String password = "Enter your password";
  static const String remember = "Remember Me";
  static const String signUp = "Sign Up";
  static const String alreadyAccount = "Already have an account?";
  static const String passwordTitle = "Password";
  static const String emailExample = "example@email.com";

  // Todo: Login page for the current

  static const String login = "Login";
  static const String welcomeBackTitle = "Hi, Welcome Back!";
  static const String welcomeBackDescription =
      "Hello again, you'we been missed!";
  static const String forgotPassword = "Forgot Password";
  static const String orWith = "Or continue with";
  static const String emailName = 'name@email.com';
  // Todo: Reset Password page for the current

  static const String resetForgotPassword = "Forgot Password?";

  static const String sendCode = "Send Code";
  static const String rememberPassword = "Remember Password?";
  static const String forgotPasswordDescription =
      "Please enter the email address linked with your account";

  //Todo: Create a new password for the current

  static const String createNewPasswordTitle = "Create new password";
  static const String createNewPasswordDescription =
      "Your new password must be unique from those previously used";
  static const String newPasswordText = "New password";
  static const String newPasswordConfirmText = "Confirm Password";

  // Todo: OTP Verification

  static const String otpVerificationTitle = "OTP Verification";
  static const String otpVerificationDescription =
      "Enter the verification code we just sent on your email address";
  static const String verify = "Verify";

  // Todo: Password Changed

  static const String passwordChangedTitle = "Password Changed!";
  static const String passwordChangedDescription =
      " Your password has been changed successfully";
  static const String backToLogin = "Back to Login";
}
