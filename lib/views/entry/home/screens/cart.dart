import 'package:flutter/material.dart';
import 'package:homer_app/views/entry/home/screens/checkout.dart';

import 'package:homer_app/views/entry/home/widget/cart/cart_item.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_fullbutton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: "My Cart",
        isCenter: true,
        isReturn: true,
        iconButton: Icons.shopping_cart_outlined,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemCount: 8,
          itemBuilder: (context, index) {
            return TCartItem();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: TButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => CheckoutScreen()));
          },
          buttonTitle: "Check Out",
        ),
      ),
    );
  }
}
