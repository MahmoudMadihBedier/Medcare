import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../constants/app_colors.dart';
import '../../core/nav_manager.dart';
import '../../main.dart';
import '../home/view_handler.dart';

class OnBoardingHandler extends StatefulWidget {
  const OnBoardingHandler({super.key});

  @override
  State<OnBoardingHandler> createState() => _OnBoardingHandlerState();
}

class _OnBoardingHandlerState extends State<OnBoardingHandler> {
  final controller = PageController();
  bool isLastPage = false;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () async {
                      await prefs.setBool("onBoardingShown", true);
                      NavManager.gotoAndRemoveAllPrevious(ViewHandler());
                    },
                    child: const Text(
                      'Skip',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lexend',
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Hero(
                tag: "splash",
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: SizedBox(
                    key: ValueKey(pageIndex),
                    height: MediaQuery.of(context).size.height * 0.36,
                    child: Image.asset(
                      'assets/images/onBoarding$pageIndex.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: 3,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                      isLastPage = index == 2;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(14.0) +
                          const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            onboardingHeadings[pageIndex].toUpperCase(),
                            key: ValueKey(pageIndex),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            onboardingCaptions[pageIndex],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: primaryColor,
                    dotColor: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                          onPressed: () async {
                            if (isLastPage) {
                              await prefs.setBool("onBoardingShown", true);
                              NavManager.gotoAndRemoveAllPrevious(ViewHandler());
                            } else {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            }
                          },
                          color: primaryColor,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return ScaleTransition(
                                  scale: animation, child: child);
                            },
                            child: Text(
                              isLastPage ? 'Get Started' : 'Next',
                              key: ValueKey(pageIndex),
                              style:
                              const TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Lexend',color: Colors.white),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> onboardingHeadings = [
  'Online Consultation',
  '24 Hours Ready to Serve',
  'Medical Record Data Patient',
];

List<String> onboardingCaptions = [
  'Connect with healthcare professionals virtually for convenient medical advice and support.',
  'Instant access to expert medical assistance. Get the care you need, when you need it, with our app.',
  'Easily manage and access comprehensive health records, including medical history, test results, and treatment plans, all in one secure place.',
];

