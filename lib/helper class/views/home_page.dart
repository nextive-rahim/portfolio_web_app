import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_portfolio/globals/app_assets.dart';
import 'package:flutter_dev_portfolio/globals/app_buttons.dart';
import 'package:flutter_dev_portfolio/globals/app_colors.dart';
import 'package:flutter_dev_portfolio/globals/app_text_styles.dart';
import 'package:flutter_dev_portfolio/globals/constants.dart';
import 'package:flutter_dev_portfolio/helper%20class/helper_class.dart';
import 'package:flutter_dev_portfolio/widgets/profile_animation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final socialButtons = <String>[
  //   AppAssets.facebook,
  //   AppAssets.twitter,
  //   AppAssets.linkedIn,
  //   AppAssets.insta,
  //   AppAssets.github,
  // ];
  Future<void> _launchUrl(String socialLink) async {
    if (!await launchUrl(Uri.parse(socialLink))) {
      throw Exception('Could not launch $socialLink');
    }
  }

  List socialButtons = [
    {
      'icon': AppAssets.facebook,
      'url': 'https://www.facebook.com/rahim.srrahim.3'
    },
    {
      'icon': AppAssets.github,
      'url': 'https://github.com/developer-rahim',
    },
    {
      'icon': AppAssets.linkedIn,
      'url': 'https://www.linkedin.com/in/rahim-sr-rahim-09068521b/',
    },
  ];
  var socialBI;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Abdul Rahim',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Freelancer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInDown(
          duration: const Duration(milliseconds: 1600),
          child: Text(
            'Flutter developer with 1.5 years of experience .I have completed'
            '\n many projects successfully. So have the self-belief'
            ' to take on any challenge.',
            style: AppTextStyles.normalStyle(),
          ),
        ),
        Constants.sizedBox(height: 22.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1600),
          child: SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: socialButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        socialBI = index;
                      } else {
                        socialBI = null;
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(550.0),
                  hoverColor: AppColors.themeColor,
                  splashColor: AppColors.lawGreen,
                  child: buildSocialButton(
                      asset: socialButtons[index]['icon'],
                      hover: socialBI == index ? true : false,
                      onTap: () {
                        _launchUrl(socialButtons[index]['url']);
                      }),
                );
              },
            ),
          ),
        ),
        Constants.sizedBox(height: 18.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () async {
                downloadFile(
                    'https://drive.google.com/file/d/1DsCkBNSD586UQsEsog05QGLZ-NyLpR6o/view');
              },
              buttonName: 'Download CV'),
        ),
      ],
    );
  }

  void downloadFile(String url) {
    html.AnchorElement anchorElement = html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

  buildSocialButton({
    required String asset,
    required bool hover,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Ink(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.themeColor, width: 2.0),
          color: AppColors.bgColor,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(6),
        child: Image.asset(
          asset,
          width: 10,
          height: 12,
          color: hover ? AppColors.bgColor : AppColors.themeColor,
          // fit: BoxFit.fill,
        ),
      ),
    );
  }
}
