import 'package:flutter/material.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/views/custom_features/custom_appbar.dart';
import 'package:homer_app/views/custom_features/custom_fullbutton.dart';
import 'package:homer_app/views/entry/home/screens/success.dart';
import 'package:homer_app/views/entry/home/widget/cart/cart_item.dart';
import 'package:homer_app/views/entry/account/screens/transaction.dart';
import 'package:homer_app/views/entry/account/widget/add_address_modal.dart';
import 'package:homer_app/views/entry/account/widget/address_item.dart';

import 'package:homer_app/views/entry/round_image.dart';
import 'package:homer_app/views/entry/section_heading.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: "Payment", isCenter: true, isReturn: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              //  Address
              TSectionHeading(
                title: "Address",
                subTitle: "Edit",
                showButton: true,
                onPressed: () {},
              ),
              const SizedBox(height: 12),
              const TAddressItem(),

              //  Purchased Items
              const SizedBox(height: 16),
              const TSectionHeading(title: "Products (2)", showButton: false),
              const SizedBox(height: 12),
              const TCartItem(showCounter: false),
              const TCartItem(showCounter: false),

              // Payment Methos
              const SizedBox(height: 16),
              const TSectionHeading(title: "Payment Method", showButton: false),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      TRoundImage(
                        image: TImages.paypal,
                        imageHeight: 30,
                        imageWidth: 30,
                      ),
                      SizedBox(height: 10),
                      Text("PayPal"),
                    ],
                  ),
                  Column(
                    children: [
                      TRoundImage(
                        image: TImages.creditCard,
                        imageHeight: 30,
                        imageWidth: 30,
                      ),
                      SizedBox(height: 10),
                      Text("Credit/Debit card"),
                    ],
                  ),
                  Column(
                    children: [
                      TRoundImage(
                        image: TImages.usd,
                        imageHeight: 30,
                        imageWidth: 30,
                      ),
                      SizedBox(height: 10),
                      Text("Wallet"),
                    ],
                  ),
                ],
              ),

              //  Voucher
              const SizedBox(height: 20),
              const TSectionHeading(title: "Voucher", showButton: false),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TTextField(
                      icon: Icons.discount_outlined,
                      text: "Enter Voucher Code Here...",
                      isBorder: true,
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      disabledBackgroundColor: Colors.grey,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Text("Apply"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      //  Order Summary
      bottomNavigationBar: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 8),
              TSectionHeading(title: "Order Summary", showButton: false),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Subtoatal"), Text("N35,000.00")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Shipment"), Text("N0.00")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Tax"), Text("N15.00")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Discount"), Text("N0.00")],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    "N35,000.00",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Spacer(),

              TButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                        image: TImages.contactCard,
                        titleText: "Payment Successful!",
                        subtitleText:
                            "Your Order has been placed. Please check status of your order in the transaction list.",
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TransactionScreen(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                buttonTitle: "Confirm Order",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
