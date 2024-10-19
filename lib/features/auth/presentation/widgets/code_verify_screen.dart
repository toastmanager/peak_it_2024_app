import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/core/components/expanded_horizontal.dart';
import 'package:peak_it_2024_app/features/auth/domain/blocs/auth/auth_bloc.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/verify_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/utils/auth_utils.dart';
import 'package:pinput/pinput.dart';

class CodeVerifyScreen extends StatelessWidget {
  const CodeVerifyScreen({
    super.key,
    required this.codeController,
    required this.phoneController,
  });

  final TextEditingController codeController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () =>
                          DefaultTabController.of(context).animateTo(0),
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              Text(
                "Введите код из отправленного сообщения на номер ${phoneController.text}",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Pinput(
                  autofocus: true,
                  defaultPinTheme: PinTheme(
                      width: 40,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8))),
                  length: 6,
                  onCompleted: (pin) {
                    bloc.add(AuthVerifyCode(
                        entity: VerifyCodeEntity(
                            phone:
                                AuthUtils.unformatPhone(phoneController.text),
                            code: pin)));
                  }),
              if (state is AuthCodeInvalid)
                Text(
                  'Неверный код верификации',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
                ),
              if (state is AuthCodeExpired)
                Text('Истёк срок кода верификации',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).colorScheme.error)),
              ExpandedHorizontally(
                  child: FilledButton(
                      onPressed: () {
                        bloc.add(AuthRequestCode(
                            entity: RequestCodeEntity(
                                phone: AuthUtils.unformatPhone(
                                    phoneController.text))));
                      },
                      child: const Text('Запросить код повторно')))
            ]);
      },
    );
  }
}
