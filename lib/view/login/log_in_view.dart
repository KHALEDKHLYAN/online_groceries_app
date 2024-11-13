import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_shop/common/color_extension.dart';
import 'package:groceries_shop/common_widget/line_text_field.dart';
import 'package:groceries_shop/common_widget/rounded_button.dart';
import 'package:groceries_shop/view/login/sign_up_view.dart';

import '../main_tab_view/main_tab_view.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  bool isShow = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            "assets/img/bottom_bg.png",
            height: media.height,
            width: media.width,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/img/back.png", width: 20, height: 20),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/color_logo.png",
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.15,
                    ),
                    Text(
                      "Loging",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: media.width * 0.03,
                    ),
                    Text(
                      "Enter your emails and password",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    LineTextField(
                      title: "Email",
                      placeholder: "Enter your email address",
                      controller: txtEmail,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: media.width * 0.1),
                    LineTextField(
                      title: "Password",
                      placeholder: "Enter your Password",
                      controller: txtEmail,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: isShow,
                      right: IconButton(
                        onPressed: () {
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                        icon: Icon(
                          isShow ? Icons.visibility_off : Icons.visibility,
                          color: TColor.textTittle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: TColor.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    RoundButton(
                      title: 'Log In',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainTabView()));
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpView()));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),  
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: TColor.primary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
