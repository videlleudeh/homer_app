import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/assets/images.dart';
import 'package:homer_app/controllers/user_controller.dart';
import 'package:homer_app/views/authentication/screens/loading.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/custom_features/custom_dialog.dart';
import 'package:homer_app/views/entry/account/widget/edit_profile.dart';
import 'package:homer_app/views/entry/account/widget/profile_tile.dart';
import 'package:homer_app/custom_features/round_container.dart';
import 'package:homer_app/custom_features/section_heading.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userControllerProvider);

    void modalSheet() {
      showModalBottomSheet(
        useSafeArea: true,
        // isScrollControlled: true,
        context: context,
        builder: (cntx) => TEditProfileModal(
          title: "Update Name",
          changeFirstName: "First Name",
          changeLastName: "Last Name",
        ),
      );
    }

    ref.listen(userControllerProvider, (previous, next) {
      if (previous == null && next == null) {
        ref.read(userControllerProvider.notifier).loadUserData();
      }
    });

    if (user == null) {
      return const LoadingScreen();
    }

    return Scaffold(
      appBar: const TAppBar(title: "Profile", isReturn: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          // Profile Picture
          child: Column(
            children: [
              Column(
                children: [
                  TRoundContainer(
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(0),
                    child: Image.asset(TImages.profileOne, fit: BoxFit.fill),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: Text("Change Profile Picture"),
                  ),
                ],
              ),

              //  Profile Information
              const Divider(),
              const SizedBox(height: 16),
              const TSectionHeading(
                title: "Profile Information",
                showButton: false,
              ),
              const SizedBox(height: 12),
              TProfileTile(
                title: "Name",
                value: user.fullName,
                onTap: () => modalSheet(),
              ),

              TProfileTile(
                title: "Username",
                value: user.userName,
                onTap: () {},
              ),

              //  Personal Information
              const Divider(),
              const SizedBox(height: 16),
              const TSectionHeading(
                title: "Personal Information",
                showButton: false,
              ),
              const SizedBox(height: 12),
              TProfileTile(title: "User ID", value: user.uid, onTap: () {}),
              TProfileTile(title: "E-mail", value: user.email, onTap: () {}),
              TProfileTile(
                title: "Phone No",
                value: user.phoneNumber,
                onTap: () {},
              ),
              TProfileTile(
                title: "Date of Birth",
                value: "07 Aug, 2003",
                onTap: () {},
              ),
              TProfileTile(title: "Gender", value: "Female", onTap: () {}),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => ShowDialog.confirmDeleteAccount(context, ref),
                child: Text("Delete Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
