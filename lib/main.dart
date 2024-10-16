import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:peak_it_2024_app/core/routes/router.dart';
import 'package:peak_it_2024_app/features/auth/domain/blocs/auth/auth_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/food/food_bloc.dart';
import 'package:peak_it_2024_app/injection.dart';
import 'package:smooth_corner/smooth_corner.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(AuthGetToken()),
        ),
        BlocProvider(
          create: (context) => sl<FoodBloc>()..add(FoodGetCategories()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Ужин с пандой',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              primary: const Color(0xFFFF4B3A),
              onSurfaceVariant: const Color(0xFF8D8D8F)),
          fontFamily: 'SFProRounded',
          filledButtonTheme: FilledButtonThemeData(
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  shape: WidgetStatePropertyAll(SmoothRectangleBorder(
                    smoothness: 0.6,
                    borderRadius: BorderRadius.circular(10),
                  )))),
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
