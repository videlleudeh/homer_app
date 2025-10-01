import 'package:flutter/material.dart';

import 'package:homer_app/views/authentication/widgets/indicator.dart';
import 'package:homer_app/data/pgcontent.dart';
import 'package:homer_app/views/authentication/screens/login.dart';
import 'package:homer_app/views/custom_features/custom_fullbutton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            scrollDirection: Axis.horizontal,
            children: pagesContent,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height - 100,
            right: 18,
            child: TextButton(
              onPressed: () {
                setState(() {
                  currentPage = 2;
                  _controller.jumpToPage(2);
                });
              },
              child: Text(
                "Skip",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 350,
            left: 18,
            child: ItemIndicator(
              controller: _controller,
              count: pagesContent.length,
              activeColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 120,
            left: 18,
            right: 18,
            child: TButton(
              buttonTitle: "Let's Go",
              isButtonIcon: true,
              onPressed: () {
                if (currentPage == 2) {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (cntxt) => LoginScreen()));
                } else {
                  _controller.animateToPage(
                    currentPage + 1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
