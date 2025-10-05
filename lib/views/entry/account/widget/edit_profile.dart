import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homer_app/controllers/edit_controller.dart';
import 'package:homer_app/provider/form_provider.dart';
import 'package:homer_app/custom_features/custom_fullbutton.dart';
import 'package:homer_app/views/entry/account/widget/add_address_modal.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TEditProfileModal extends ConsumerStatefulWidget {
  final String title;
  final String changeFirstName;
  final String changeLastName;

  const TEditProfileModal({
    super.key,
    required this.title,
    required this.changeFirstName,
    required this.changeLastName,
  });

  @override
  ConsumerState<TEditProfileModal> createState() => _TEditProfileModalState();
}

class _TEditProfileModalState extends ConsumerState<TEditProfileModal> {
  late EditController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EditController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validForm = ref.watch(signUpFormProvider.notifier);

    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _controller.formKey,
        child: Column(
          children: [
            Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            TTextField(
              text: widget.changeFirstName,
              controller: _controller.changeFirstName,
              icon: Iconsax.user_copy,
              validator: (value) => validForm.setFirstName(value),
            ),
            const SizedBox(height: 10),
            TTextField(
              text: widget.changeLastName,
              controller: _controller.changeLastName,
              icon: Iconsax.user_copy,
              validator: (value) => validForm.setLastName(value),
            ),

            const SizedBox(height: 24),
            TButton(
              onPressed: () => _controller.updateUserName(context, ref),
              buttonTitle: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
