import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/globals/app_colors.dart';
import 'package:flutter_dev_portfolio/globals/app_text_styles.dart';
import 'package:flutter_dev_portfolio/globals/constants.dart';
import 'package:flutter_dev_portfolio/helper%20class/helper_class.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildContactText(),
          Constants.sizedBox(height: 40.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: buildInputDecoration(
              title: 'Name : ',
              label: 'Abdul Rahim',
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: buildInputDecoration(
              title: 'Email : ',
              label: 'rahimsr983@gmail.com',
              onTap: () {
                emailSupport();
              },
              isShowUnderline: true,
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: buildInputDecoration(
              title: 'phone : ',
              label: '01718663032',
            ),
          ),
          Constants.sizedBox(width: 20.0),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              elevation: 8,
              child: buildInputDecoration(
                title: 'Whatsapp : ',
                label: '01718663032',
                onTap: () {
                  whatappSupport();
                },
                isShowUnderline: true,
              ),
            ),
          ),
          Constants.sizedBox(height: 20.0),
        ],
      ),
      tablet: buildForm(),
      desktop: buildForm(),
      paddingWidth: size.width * 0.2,
      bgColor: AppColors.bgColor,
    );
  }

  Column buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildContactText(),
        Constants.sizedBox(height: 40.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: buildInputDecoration(
                  title: 'Name : ',
                  label: 'Abdul Rahim',
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: buildInputDecoration(
                  title: 'Email : ',
                  label: 'rahimsr983@gmail.com',
                  onTap: () {
                    emailSupport();
                  },
                  isShowUnderline: true,
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: buildInputDecoration(
                  title: 'Phone : ',
                  label: '01718663032',
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: buildInputDecoration(
                  title: 'Whatsapp : ',
                  label: '01718663032',
                  onTap: () {
                    whatappSupport();
                  },
                  isShowUnderline: true,
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          elevation: 8,
          child: buildInputDecoration(
            title: 'Messanger : ',
            label: 'https://m.me/rahim.srrahim.3',
            onTap: () {
              _launchUrl('https://m.me/rahim.srrahim.3');
            },
            isShowUnderline: true,
          ),
        ),
      ],
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  Widget buildInputDecoration({
    required String label,
    required String title,
    void Function()? onTap,
    bool isShowUnderline = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bgColor2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white,
                letterSpacing: 1.7,
                height: 1.5,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                shadows: isShowUnderline
                    ? const [
                        Shadow(
                          color: Colors.white,
                          offset: Offset(0, -3),
                        )
                      ]
                    : null,
                color: isShowUnderline ? Colors.transparent : Colors.white,
                decoration: isShowUnderline ? TextDecoration.underline : null,
                decorationColor: Colors.white,
                decorationThickness: 2,
                fontWeight: FontWeight.w500,
                fontSize: 16,
                letterSpacing: 1.7,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Email Support
  Future<void> emailSupport() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: 'rahimsr983@gmail.com',
    );
    await _launchUrl(
      launchUri.toString(),
    );
  }

// Hotline Support
  Future<void> whatappSupport() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '+8801718 663 032',
    );
    await _launchUrl(
      launchUri.toString(),
    );
  }

  Future<void> _launchUrl(String socialLink) async {
    if (!await launchUrl(Uri.parse(socialLink))) {
      throw Exception('Could not launch $socialLink');
    }
  }
}
