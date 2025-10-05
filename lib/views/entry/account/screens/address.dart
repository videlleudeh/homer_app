import 'package:flutter/material.dart';
import 'package:homer_app/custom_features/custom_appbar.dart';
import 'package:homer_app/views/entry/account/widget/add_address_modal.dart';
import 'package:homer_app/views/entry/account/widget/address_item.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void modalSheet() {
      showModalBottomSheet(
        useSafeArea: true,
        // isScrollControlled: true,
        context: context,
        builder: (cntx) => TAddressModal(),
      );
    }

    return Scaffold(
      appBar: TAppBar(
        isReturn: true,
        title: "My Address",
        iconButton: Icons.add,
        onPressed: modalSheet,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [TAddressItem(), TAddressItem()]),
        ),
      ),
    );
  }
}
