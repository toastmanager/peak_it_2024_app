import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/core/components/expanded_horizontal.dart';
import 'package:peak_it_2024_app/features/auth/domain/blocs/auth/auth_bloc.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/utils/auth_utils.dart';

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
              Text(
                "Введите номер, чтобы продолжить",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: phoneController,
                inputFormatters: [AuthUtils.phoneFormatter],
                decoration:
                    const InputDecoration(hintText: '+7 (000) 000-00-00'),
              ),
              ExpandedHorizontally(
                  child: FilledButton(
                      onPressed: () {
                        final phoneNumber = '+${AuthUtils.phoneFormatter.unmaskText(phoneController.text)}';
                        bloc.add(AuthRequestCode(entity: RequestCodeEntity(phone: phoneNumber)));
                        DefaultTabController.of(context).animateTo(1);
                      },
                      child: const Text('Далее')))
            ]);
      },
    );
  }
}
