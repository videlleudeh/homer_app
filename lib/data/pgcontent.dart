import 'package:flutter/widgets.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/views/authentication/widgets/onboard_content.dart';

final List<Widget> pagesContent = [
  OnboardContent(
    backgroundImage: TImages.onboardOne,
    headlineText: "Online Home Store and Furniture",
    bodyText:
        "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.",
  ),
  OnboardContent(
    backgroundImage: TImages.onboardTwo,
    headlineText: "Delivery Right to Your Doorstep",
    bodyText:
        "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep",
  ),
  OnboardContent(
    backgroundImage: TImages.onboardThree,
    headlineText: "Get Support From Our Skilled Team",
    bodyText:
        "If our products don't meet your expectations, we're available 24/7 to assist you.",
  ),
];
