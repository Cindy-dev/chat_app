import 'package:chat_app/presentation/helpers/buttons.dart';
import 'package:chat_app/presentation/helpers/color.dart';
import 'package:chat_app/presentation/helpers/device_size.dart';
import 'package:chat_app/presentation/helpers/navigators.dart';
import 'package:chat_app/presentation/views/chat_home_screen.dart';
import 'package:chat_app/presentation/views/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../logic/view_model_provider.dart';
import '../helpers/text_form.dart';

class LogInScreen extends StatefulHookConsumerWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(loginVM).obscurePasswordText = true;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(loginVM);
    final readViewModel = ref.read(loginVM);
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            foreground: AppColors.paintText,
                          ),
                        ),
                      ),
                      const Spacer(),
                      buildTextForm(context,
                          controller: readViewModel.emailController,
                          obscure: false,
                          hintText: 'alberto@mail.com',
                          icon: const Icon(
                            Icons.email,
                            size: 24,
                            color: AppColors.iconColor,
                          ), validator: (val) {
                        if (val!.isEmpty || val == null) {
                          return 'This Field Is Required';
                        } else if (!val.contains('@')) {
                          return 'Please input a valid Email';
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
                          ), validator: (val) {
                        if (val!.length < 8) {
                          return ('password is too short');
                        } else if (val.isEmpty || val == null) {
                          return 'Please input a password';
                        }
                      },
                          icon: const Icon(Icons.lock,
                              size: 24, color: AppColors.iconColor)),
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.only(right: 35, top: 6),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot password',
                            style: TextStyle(
                                foreground: AppColors.paintText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (!_formKey.currentState!.validate()) {
                              // Invalid!
                              return;
                            }
                            readViewModel.signIn(context, () {
                              navigatePush(context, ChatHomeScreen());
                            });
                          },
                          child: gradientButton(context, 'Login')),
                      textButton('Don’t have a account?', ' Sign up here',
                          () => navigatePush(context, SignUpScreen())),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
