import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisaan_konnect/bloc/cubit/auth.cubit.dart';
import 'package:kisaan_konnect/bloc/cubit/product.cubit.dart';
import 'package:kisaan_konnect/constants/app.theme.dart';
import 'package:kisaan_konnect/constants/size.config.dart';
import 'package:kisaan_konnect/utils/shared_pref.dart';
import 'package:kisaan_konnect/view/auth_view/signup.view.dart';
import 'package:kisaan_konnect/view/home/home.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductCubit()),
          BlocProvider(create: (context) => AuthCubit()),
        ],
        child: MaterialApp(
          title: 'KisaanKonnect',
          theme: AppTheme().appTheme(),
          debugShowCheckedModeBanner: false,
          home: const Wrapper(),
        ));
  }
}

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String token = "";

  checkToken() async {
    String? authToken = await SharedPrefService().getData('token');
    setState(() {
      token = authToken ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return (token.isEmpty) ? const SignupView() : const HomeView();
  }
}
