import 'package:bloc_test/core/base/bloc/auth_bloc.dart';
import 'package:bloc_test/core/components/appbar/appbar.dart';
import 'package:bloc_test/core/components/button/button.dart';
import 'package:bloc_test/core/components/text/custom_text.dart';
import 'package:bloc_test/core/components/textFormField/text_form_field.dart';
import 'package:bloc_test/core/constants/app/string_constants.dart';
import 'package:bloc_test/core/constants/enums/icon_enums.dart';
import 'package:bloc_test/core/extensions/context_extensions.dart';
import 'package:bloc_test/core/extensions/image_extensions.dart';
import 'package:bloc_test/core/extensions/num_extensions.dart';
import 'package:bloc_test/core/utils/validate_operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController =
      TextEditingController(text: '08408408408');
  TextEditingController passwordController =
      TextEditingController(text: '11111111');

  bool? get validate => _formKey.currentState?.validate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth(0.05),
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _LogoAndTitleWidget(),
                  _PhoneFormField(phoneController: phoneController),
                  _PasswordFormField(passwordController: passwordController),
                  _LoginButton(
                    onTap: () {
                      if (validate != null && validate == true) {
                        context.read<AuthBloc>().add(LoginRequested(
                              phoneController.text.trim(),
                              passwordController.text.trim(),
                            ));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LogoAndTitleWidget extends StatelessWidget {
  const _LogoAndTitleWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.dynamicHeight(0.06),
      ),
      child: Column(
        children: [
          Image.asset(
            IconEnums.appLogo.iconName.toPng,
            height: context.dynamicHeight(0.2),
          ),
          30.ph,
          CustomText(
            StringConstants.loginTitle,
            textStyle: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _PhoneFormField extends StatelessWidget {
  const _PhoneFormField({
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: phoneController,
      title: StringConstants.phoneTitle,
      hintText: StringConstants.phoneHint,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        phoneController.text = value!;
      },
      // validator: (value) => ValidateOperations.emailValidation(value),
      validator: (value) => ValidateOperations.normalValidation(value),
    );
  }
}

class _PasswordFormField extends StatelessWidget {
  const _PasswordFormField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: passwordController,
      title: StringConstants.passwordTitle,
      hintText: StringConstants.passwordHint,
      isPassword: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) => ValidateOperations.normalValidation(value),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      buttonText: StringConstants.loginButtonText,
      onTap: onTap,
    );
  }
}
