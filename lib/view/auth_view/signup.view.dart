import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisaan_konnect/bloc/cubit/auth.cubit.dart';
import 'package:kisaan_konnect/bloc/states/auth.state.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/constants/size.config.dart';
import 'package:kisaan_konnect/utils/shared_pref.dart';
import 'package:kisaan_konnect/utils/snackbar.dart';
import 'package:kisaan_konnect/view/auth_view/login.view.dart';
import 'package:kisaan_konnect/view/home/home.view.dart';
import 'package:kisaan_konnect/view/widgets/buttons.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController useremail = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController userpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthCubit authcubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 160, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "New User ?",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.secondaryText),
              ),
              Text(
                "Create Account",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.accentMain,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: username,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                decoration: InputDecoration(
                  label: Text(
                    "Full Name",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  hintText: "Full Name",
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: useremail,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                decoration: InputDecoration(
                  label: Text(
                    "Email Address",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  hintText: "Email Address",
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: userpassword,
                obscureText: true,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                decoration: InputDecoration(
                  label: Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  hintText: "Password",
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: SizedBox(
                    width: AppSizeConfig.screenWidth,
                    child: BlocConsumer<AuthCubit, AuthState>(
                        builder: (context, state) {
                      if (state is LoadingAuthState) {
                        return CustomButtons().loadingElevatedButton(10);
                      }

                      return CustomButtons()
                          .customElevatedButton("Create Account", () {
                        // signup
                        authcubit.signupUser(username.text.trim(),
                            useremail.text.trim(), userpassword.text.trim());
                      }, 10);
                    }, listener: (context, state) async {
                      if (state is DoneAuthState) {
                        // save the token
                        SharedPrefService().setData('token', state.userToken);
                        // navigate to home
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const HomeView()),
                            (Route<dynamic> route) => false);
                      }

                      if (state is ErrorAuthState) {
                        ShowSnackBar(context, state.err, Colors.red);
                      }
                    })),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account ? ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginView()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "SignIn",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
