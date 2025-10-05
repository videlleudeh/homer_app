import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/controllers/user_controller.dart';
import 'package:homer_app/views/authentication/screens/loading.dart';
import 'package:homer_app/views/authentication/screens/login.dart';
import 'package:homer_app/views/entry/favorite/screens/favorite.dart';
import 'package:homer_app/views/entry/account/screens/address.dart';
import 'package:homer_app/views/entry/account/screens/profile.dart';
import 'package:homer_app/views/entry/account/screens/transaction.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:homer_app/assets/images.dart';

import 'package:homer_app/custom_features/custom_fullbutton.dart';
import 'package:homer_app/views/entry/account/widget/settings_listtile.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/round_container.dart';
import 'package:homer_app/custom_features/section_heading.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(userControllerProvider.notifier).loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userControllerProvider);
    if (user == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: const TAppBar(title: "My Account", isCenter: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              // height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).colorScheme.primaryFixedDim,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TRoundContainer(
                    width: 80,
                    height: 80,
                    padding: EdgeInsets.all(0),
                    child: Image.asset(TImages.profileOne, fit: BoxFit.fill),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.fullName,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.apply(color: Colors.white),
                  ),

                  Text(
                    user.userName,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.apply(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        label: const Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(Icons.mode_edit_outlined),
                        style: const ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Column(
                children: [
                  TSectionHeading(title: "General", showButton: false),
                  const SizedBox(height: 12),
                  TSettingsTile(
                    title: "Transactions",
                    leadingicon: Iconsax.receipt_1,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionScreen(),
                        ),
                      );
                    },
                  ),
                  TSettingsTile(
                    title: "WishList",
                    leadingicon: Icons.favorite_border_outlined,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FavoriteScreen(),
                        ),
                      );
                    },
                  ),
                  TSettingsTile(
                    title: "Saved Address",
                    leadingicon: Iconsax.safe_home,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddressScreen(),
                        ),
                      );
                    },
                  ),
                  TSettingsTile(
                    title: "Security",
                    leadingicon: Iconsax.security_card,
                    onTap: () {},
                  ),
                  TSettingsTile(
                    title: "Payment Methods",
                    leadingicon: Iconsax.bank,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  TSectionHeading(title: "Help", showButton: false),
                  const SizedBox(height: 12),
                  TSettingsTile(
                    title: "Reset Password",
                    leadingicon: Iconsax.receipt_1,
                    onTap: () {},
                  ),
                  TSettingsTile(
                    title: "Upload Document",
                    leadingicon: Iconsax.receipt_1,
                    onTap: () {},
                  ),
                  const SizedBox(height: 24),
                  TButton(
                    buttonTitle: "Log Out",
                    onPressed: () async {
                      try {
                        await ref
                            .read(userControllerProvider.notifier)
                            .logout(context, ref);
                        if (context.mounted) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Logout failed: ${e.toString()}'),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
