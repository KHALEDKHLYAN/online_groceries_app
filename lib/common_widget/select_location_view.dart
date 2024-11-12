import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_shop/common/color_extension.dart';
import 'package:groceries_shop/common_widget/drop_down.dart';
import 'package:groceries_shop/common_widget/rounded_button.dart';
import 'package:groceries_shop/view/login/log_in_view.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  TextEditingController txtOTP = TextEditingController();

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/img/select_location.png",
                      width: media.width * 0.6,
                    ),
                    SizedBox(height: media.width * 0.1),
                    Text(
                      "Select your location",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: media.width * 0.03),
                    Text(
                      "Switch your location to stay tune whith\n what's happening  within your area ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: media.width * 0.1),
                    Dropdown(
                      title: 'Select Your Zone',
                      placeholder: 'Your Zone',
                      valueList: ["zone 1", "Zone2"],
                      didChange: (sObj) {},
                    ),
                    SizedBox(height: media.width * 0.1),
                    Dropdown(
                      title: 'Select Your Area',
                      placeholder: 'Type of Your Area',
                      valueList: ["Area 1", "Area 2"],
                      didChange: (sObj) {},
                    ),
                    SizedBox(height: media.width * 0.1),
                    RoundButton(
                      title: 'Submit',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInView()));
                      },
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
