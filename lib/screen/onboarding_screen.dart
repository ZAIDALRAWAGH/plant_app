import 'package:flutter/material.dart';

import 'package:projrct01/screen/root_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pagecontroller = PageController();

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: isLast
                ? Container()
                : TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const RootPage();
                        },
                      ));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: pagecontroller,
            onPageChanged: (value) {
              setState(() {
                isLast = 2 == value;
              });
            },
            children: [
              OnboardingItem(
                title: Constants.titleOne,
                description: Constants.descriptionOne,
                image: 'images/plant-one.png',
              ),
              OnboardingItem(
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
                image: 'images/plant-two.png',
              ),
              OnboardingItem(
                title: Constants.titleThree,
                description: Constants.descriptionThree,
                image: 'images/plant-three.png',
              ),
            ],
          ),
          isLast
              ? getStarted()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 35, horizontal: 20),
                      child: SmoothPageIndicator(
                        controller: pagecontroller,
                        count: 3,
                        effect:
                            SlideEffect(activeDotColor: Constants.primaryColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pagecontroller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 35, horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }

  Widget getStarted() {
    return Container(
      height: 50,
      width: 300,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const RootPage();
            },
          ));
        },
        style:
            ElevatedButton.styleFrom(backgroundColor: Constants.primaryColor),
        child: const Text(
          'Get Stared',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 35,
        ),
        Image.asset(
          image,
          height: 350,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 35,
                color: Constants.primaryColor,
                fontWeight: FontWeight.w800),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
