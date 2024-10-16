import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/auth/domain/blocs/auth/auth_bloc.dart';
import 'package:peak_it_2024_app/features/auth/presentation/widgets/code_verify_screen.dart';
import 'package:peak_it_2024_app/features/auth/presentation/widgets/phone_screen.dart';


@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final phoneController = TextEditingController();
  final codeController = TextEditingController();
  int page = 0;

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthUnauthorized || state is AuthCodeRequested) {
              return DefaultTabController(
                  length: 2,
                  child: TabBarView(
                    children: [
                      PhoneScreen(
                        phoneController: phoneController,
                      ),
                      CodeVerifyScreen(
                          codeController: codeController,
                          phoneController: phoneController),
                    ],
                  ));
            }
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is AuthCodeInvalid) {
              return const Center(
                child: Text('Invalid Code'),
              );
            }
            return const Placeholder();
          },
        ));
  }
}
