import 'package:bloc_test/bloc/authen_bloc.dart';
import 'package:bloc_test/bloc/authen_event.dart';
import 'package:bloc_test/components/my_button.dart';
import 'package:bloc_test/components/my_textfield.dart';
import 'package:bloc_test/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController(text: "08411111111");
  final passwordController = TextEditingController(text: "11111111");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset('lib/images/ic_bus.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome back you've been missed!",
                style: TextStyle(color: Colors.black26),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: phoneController,
                hintText: 'Phone',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black26),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              MyButton(
                  labelSubmit: 'Sign In',
                  onTap: () {
                    context.read<AuthBloc>().add(AuthChangeEvent());
                  }
                  // signUserIn,
                  ),
              const SizedBox(height: 30),
              // BlocBuilder<AuthBloc, AuthState>(
              //   builder: (context, state) {
              //     return Text(state.isAuth.toString());
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey[700], fontSize: 12),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imgPath: 'lib/images/gg.png', onTap: () => {}),
                  const SizedBox(width: 30),
                  SquareTile(
                    imgPath: 'lib/images/apple.png',
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    // onTap: controller.goToSignUp,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
