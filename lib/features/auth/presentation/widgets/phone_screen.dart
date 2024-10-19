import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/core/components/expanded_horizontal.dart';
import 'package:peak_it_2024_app/features/auth/domain/blocs/auth/auth_bloc.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/utils/auth_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final bloc = context.read<AuthBloc>();
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Text(
                  "Введите номер телефона, чтобы продолжить",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [AuthUtils.phoneFormatter],
                decoration:
                    const InputDecoration(hintText: '+7 (000) 000-00-00'),
              ),
              const Spacer(),
              ExpandedHorizontally(
                  child: FilledButton(
                      onPressed: () {
                        final phoneNumber =
                            '+${AuthUtils.phoneFormatter.unmaskText(phoneController.text)}';
                        bloc.add(AuthRequestCode(
                            entity: RequestCodeEntity(phone: phoneNumber)));
                        DefaultTabController.of(context).animateTo(1);
                      },
                      child: const Text('Далее'))),
              const SizedBox(
                height: 8,
              ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    children: [
                      const TextSpan(
                          text: 'Авторизуясь, вы даёте согласие на '),
                      TextSpan(
                          text: 'обработку персональных данных',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onSurface),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await launchUrl(Uri.parse('https://example.com'));
                            })
                    ]),
              )
            ]);
      },
    );
  }
}
