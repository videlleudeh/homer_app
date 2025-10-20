import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/custom_features/custom_snackbar.dart';
import 'package:homer_app/custom_features/round_image.dart';
import 'package:homer_app/provider/cart_provider.dart';
import 'package:homer_app/views/entry/home/screens/all_product.dart';
import 'package:homer_app/views/entry/home/screens/checkout.dart';

import 'package:homer_app/views/entry/home/widget/cart/cart_item.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_fullbutton.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: TAppBar(
        title: "My Cart",
        isCenter: true,
        isReturn: true,
        iconButton: Icons.shopping_cart_outlined,
      ),
      body: cartState.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TRoundImage(
                      isNetworkImage: false,
                      image: TImages.nothingFound,
                      imageHeight: 250,
                      imageWidth: 250,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Your Cart is empty!",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      textAlign: TextAlign.center,
                      "Looks like you haven’t added anything to your cart yet ",
                    ),

                    SizedBox(height: 16),
                    TButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AllProductScreen(),
                          ),
                        );
                      },
                      buttonTitle: "Continue Browsing",
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16),
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                separatorBuilder: (_, __) => SizedBox(height: 15),
                itemCount: cartState.length,
                itemBuilder: (context, index) {
                  final cartItem = cartState[index];
                  return TCartItem(
                    image: cartItem.productImage,
                    name: cartItem.productName,
                    quantity: cartItem.quantity,
                    price: cartItem.totalPrice,
                    onDelete: () {
                      cartNotifier.deleteItem(cartItem.uid);
                      showSuccessSnackbar(
                        context,
                        "${cartItem.productName} Removed from Cart",
                        SnackBarAction(
                          label: "UNDO",
                          onPressed: () => cartNotifier.addToCart(cartItem),
                        ),
                      );
                    },
                    onIncreaseQ: () => cartNotifier.increaseQ(cartItem.uid),
                    onDecreaseQ: () => cartNotifier.decreaseQ(cartItem.uid),
                  );
                },
              ),
            ),
      bottomNavigationBar: cartState.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: TButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
                buttonTitle: "Check Out",
              ),
            )
          : null,
    );
  }
}
