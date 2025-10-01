import 'package:flutter/material.dart';
import 'package:homer_app/views/custom_features/custom_appbar.dart';

import 'package:homer_app/views/entry/account/widget/order_detail_item.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(isReturn: true, title: "Order Detail"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [TOrderDetailItem(), TOrderDetailItem()]),
        ),
      ),
    );
  }
}
