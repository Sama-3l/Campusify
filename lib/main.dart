import 'package:campusify/business_logic/cubits/LoadEvents/load_events_cubit.dart';
import 'package:campusify/business_logic/cubits/LoginSignUp/log_in_sign_up_cubit.dart';
import 'package:campusify/business_logic/cubits/SelectOptionCubit/select_option_cubit.dart';
import 'package:campusify/business_logic/cubits/SwitchPasswordVisibility/switch_password_visibility_cubit.dart';
import 'package:campusify/business_logic/cubits/Timer/timer_cubit.dart';
import 'package:campusify/constants/theme.dart';
import 'package:campusify/presentation/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchPasswordVisibilityCubit()),
        BlocProvider(create: (context) => LogInSignUpCubit()),
        BlocProvider(create: (context) => TimerCubit()),
        BlocProvider(create: (context) => LoadEventsCubit()),
        BlocProvider(create: (context) => SelectOptionCubit()),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: LoginPage(),
      ),
    );
  }
}
