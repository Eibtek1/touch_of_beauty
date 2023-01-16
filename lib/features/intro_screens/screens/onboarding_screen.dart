import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_of_beauty/core/app_router/screens_name.dart';
import 'package:touch_of_beauty/core/app_theme/light_theme.dart';
import 'package:touch_of_beauty/features/intro_screens/widgets/boarding_button.dart';
import '../../../core/assets_path/images_path.dart';
import '../widgets/images_widget.dart';
import '../widgets/onboarding_class.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageViewController = PageController();
  bool isLast = false;
  List<OnboardingModel> boarding = [
    OnboardingModel(
        backGround: ImagePath.onboarding1,
        title: 'تعرف علي تطبيق خانة الجمال',
        bodyTitle: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى من مولد النص العربى'),
    OnboardingModel(
        backGround: ImagePath.onboarding2,
        title: 'تعرف علي تطبيق خانة الجمال',
        bodyTitle: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى من مولد النص العربى'),
    OnboardingModel(
        backGround: ImagePath.onboarding3,
        title: 'تعرف علي تطبيق خانة الجمال',
        bodyTitle: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى من مولد النص العربى')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: PageView.builder(
              controller: pageViewController,
              itemCount: boarding.length,
              itemBuilder: (BuildContext context, int index) {
                return ImagesWidget(
                  model: boarding[index],
                );
              },
              onPageChanged: (index) {
                if (index == 2 && !isLast) {
                  setState(() {
                    isLast = true;
                  });
                }
                if (index == 1 || index == 0 && isLast) {
                  setState(() {
                    isLast = false;
                  });
                }
              },
            ),
          ),
          Positioned(
            bottom: 256.h,
            left: 156.w,
            right: 158.w,
            child: SmoothPageIndicator(
              controller: pageViewController,
              count: boarding.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  expansionFactor: 3,
                  spacing: 5.w,
                  activeDotColor: AppColorsLightTheme.secondaryColor,
                  dotColor: AppColorsLightTheme.smoothPageIndicatorGreyColor),
            ),
          ),
          Positioned(
            bottom: 141.h,
            // left: !isLast?157.w:112.w,
            right: !isLast ? 158.w : 114.w,
            child: CustomButton(
              isLast: isLast,
              isLastTap: () {
                  Navigator.pushReplacementNamed(context, ScreenName.chooseRegisterType);
              },
              isTapped: () {
                pageViewController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
              },
            ),
          )
        ],
      ),
    );
  }
}
