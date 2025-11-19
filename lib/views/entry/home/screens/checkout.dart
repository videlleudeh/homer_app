import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:homer_app/assets/images.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_fullbutton.dart';
import 'package:homer_app/custom_features/custom_snackbar.dart';
import 'package:homer_app/custom_features/round_container.dart';
import 'package:homer_app/provider/cart_provider.dart';
import 'package:homer_app/provider/order_provider.dart';
import 'package:homer_app/views/entry/account/widget/add_address_modal.dart';
import 'package:homer_app/views/entry/account/widget/address_item.dart';
import 'package:homer_app/custom_features/round_image.dart';
import 'package:homer_app/custom_features/section_heading.dart';
import 'package:homer_app/views/entry/home/screens/home.dart';
import 'package:homer_app/views/entry/home/screens/success.dart';
import 'package:homer_app/views/entry/home/widget/cart/cart_item.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartProvider);
    final subTotalFee = cartState.fold(
      0.00,
      (sum, items) => sum + items.productPrice * items.quantity,
    );
    const deliveryFee = 1500.00;
    const taxFee = 250.0;
    final totalFee = subTotalFee + deliveryFee + taxFee;

    return Scaffold(
      appBar: TAppBar(title: "Checkout", isCenter: true, isReturn: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              //  Address
              TRoundContainer(
                radius: 12,
                bgColor: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Column(
                  children: [
                    TSectionHeading(
                      title: "Address",
                      subTitle: "Edit",
                      showButton: true,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),
                    const TAddressItem(),
                  ],
                ),
              ),

              //  Purchased Items
              const SizedBox(height: 16),
              TRoundContainer(
                radius: 12,
                bgColor: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Column(
                  children: [
                    TSectionHeading(
                      title: "Products (${cartState.length})",
                      showButton: false,
                    ),
                    const SizedBox(height: 12),
                    for (final cartItem in cartState)
                      TCartItem(
                        image: cartItem.productImage,
                        name: cartItem.productName,
                        quantity: cartItem.quantity,
                        price: cartItem.totalPrice,
                        showCounter: false,
                        margin: EdgeInsets.only(bottom: 10),
                      ),
                  ],
                ),
              ),

              // Payment Method
              const SizedBox(height: 16),
              TRoundContainer(
                radius: 12,
                bgColor: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Column(
                  children: [
                    const TSectionHeading(
                      title: "Payment Method",
                      showButton: false,
                    ),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            TRoundImage(
                              isNetworkImage: false,
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
                              isNetworkImage: false,
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
                              isNetworkImage: false,
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
                  ],
                ),
              ),

              //  Voucher
              const SizedBox(height: 20),
              TRoundContainer(
                radius: 12,
                bgColor: Theme.of(context).colorScheme.surfaceContainerLow,
                child: Column(
                  children: [
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
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onPrimary,
                          ),
                          child: const Text("Apply"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //  Order Summary
      bottomNavigationBar: SizedBox(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              TSectionHeading(title: "Order Summary", showButton: false),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Subtotal"), Text("N$subTotalFee")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Shipment"), Text("N$deliveryFee")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Tax"), Text("N$taxFee")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Discount"), Text("N0.00")],
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    "N$totalFee",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TButton(
                onPressed: () async {
                  try {
                    final user = FirebaseAuth.instance.currentUser;
                    if (cartState.isEmpty) {
                      showSuccessSnackbar(context, "Your cart is empty", null);
                    }
                    if (user == null) {
                      showSuccessSnackbar(
                        context,
                        "Please Login to continue",
                        null,
                      );
                      return;
                    }
                    await ref
                        .read(orderProvider.notifier)
                        .placeOrder(user.uid, cartState);
                    ref.read(cartProvider.notifier).clearCart();

                    showSuccessSnackbar(context, "Your cart is empty", null);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(
                          image: TImages.contactCard,
                          titleText: "Order Successfully Placed!",
                          subtitleText:
                              "Your Order has been placed. Please check status of your order in the transaction list.",
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          ),
                          buttonText: "Return Home",
                        ),
                      ),
                    );
                  } catch (e) {
                    "Unexpected Error: $e";
                  }
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
