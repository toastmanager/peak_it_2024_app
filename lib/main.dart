import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:peak_it_2024_app/features/auth/domain/blocs/auth/auth_bloc.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:peak_it_2024_app/features/auth/domain/entities/verify_code_entity.dart';
import 'package:peak_it_2024_app/injection.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final phoneController = TextEditingController();
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>()..add(AuthGetToken()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final bloc = context.read<AuthBloc>();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: phoneController,
                  ),
                  TextField(
                    controller: codeController,
                  ),
                  TextButton(
                      onPressed: () => bloc.add(AuthRequestCode(
                          entity:
                              RequestCodeEntity(phone: phoneController.text))),
                      child: const Text("Request Code")),
                  TextButton(
                      onPressed: () => bloc.add(AuthVerifyCode(
                          entity: VerifyCodeEntity(
                              phone: phoneController.text,
                              code: codeController.text))),
                      child: const Text("Verify Code")),
                  TextButton(onPressed: () => bloc.add(AuthRefreshToken()), child: const Text("Refresh")),
                  TextButton(onPressed: () => bloc.add(AuthGetToken()), child: const Text("Get Token")),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
