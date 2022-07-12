import 'package:chat_app/logic/view_model_provider.dart';
import 'package:chat_app/presentation/helpers/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../helpers/buttons.dart';
import '../helpers/color.dart';
import '../helpers/navigators.dart';
import '../helpers/text_form.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(signupVM);
    final readViewModel = ref.read(signupVM);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: context.height(),
          width: context.width(),
          child: Stack(fit: StackFit.loose, children: [
            Container(
              height: context.height() * .37,
              width: context.width(),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('asset/images/Rectangle 8.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: 197,
              bottom: 0,
              child: Container(
                height: context.height() * .615,
                width: context.width(),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60))),
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formStateKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  foreground: AppColors.paintText,
                                ),
                              ),
                            ),
                            buildTextForm(
                              context,
                              controller: readViewModel.emailController,
                              obscure: false,
                              hintText: 'alberto@mail.com',
                              icon: const Icon(
                                Icons.email,
                                size: 24,
                                color: AppColors.iconColor,
                              ),
                              validator: (val) {
                                if (val!.isEmpty || val == null) {
                                  return 'This Field Is Required';
                                } else if (!val.contains('@')) {
                                  return 'Please input a valid Email';
                                }
                              },
                            ),
                            buildTextForm(context,
                                controller: readViewModel.nameController,
                                obscure: false,
                                hintText: 'Cindy Dev_',
                                icon: const Icon(
                                  Icons.person,
                                  size: 24,
                                  color: AppColors.iconColor,
                                ), validator: (val) {
                              if (val!.isEmpty || val == null) {
                                return 'This Field Is Required';
                              }
                            }),
                            buildTextForm(context,
                                controller: readViewModel.passwordController,
                                obscure: viewModel.obscurePasswordText,
                                hintText: 'password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    viewModel.obscurePasswordText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 20,
                                    color: AppColors.iconColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      readViewModel.obscurePasswordText =
                                          !readViewModel.obscurePasswordText;
                                    });
                                  },
                                ),
                                icon: const Icon(Icons.lock,
                                    size: 24, color: AppColors.iconColor),
                                validator: (val) {
                              if (val!.length < 8) {
                                return ('password is too short');
                              } else if (val.isEmpty || val == null) {
                                return 'Please input a password';
                              }
                            }),
                            buildTextForm(context,
                                controller:
                                    readViewModel.confirmPasswordController,
                                obscure: viewModel.obscurePasswordText,
                                hintText: 'confirm password',
                                icon: const Icon(
                                  Icons.lock,
                                  size: 24,
                                  color: AppColors.iconColor,
                                ), validator: (val) {
                              if (val != readViewModel.passwordController) {
                                return ('password do not match');
                              }
                            }),
                            GestureDetector(
                                onTap: () {
                                  readViewModel.signUP(context, () {
                                    navigatePush(context, LogInScreen());
                                  });
                                },
                                child: gradientButton(context, 'Sign Up')),
                            textButton(
                                'Do you have an account?',
                                ' Login here',
                                () =>
                                    navigatePush(context, const LogInScreen())),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
