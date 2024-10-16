import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:peak_it_2024_app/core/components/expanded_horizontal.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

var phoneFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

class _ProfilePageState extends State<ProfilePage> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Введите номер, чтобы продолжить",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextField(
          controller: phoneController,
          inputFormatters: [phoneFormatter],
          decoration: const InputDecoration(hintText: '+7 (000) 000-00-00'),
        ),
        ExpandedHorizontally(
            child: FilledButton(onPressed: () {}, child: const Text('Далее')))
      ]),
    );
  }
}
