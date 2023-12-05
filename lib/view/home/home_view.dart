import 'package:bloc_test/core/base/functions/base_functions.dart';
import 'package:bloc_test/core/components/appbar/appbar.dart';
import 'package:bloc_test/core/components/button/button.dart';
import 'package:bloc_test/core/components/textFormField/text_form_field.dart';
import 'package:bloc_test/core/constants/app/string_constants.dart';
import 'package:bloc_test/core/utils/validate_operations.dart';
import 'package:bloc_test/view/home/profile_bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController =
      TextEditingController(text: '08408408408');
  TextEditingController birthController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool? get validate => _formKey.currentState?.validate();
  final BaseFunctions baseFunctions = BaseFunctions.instance;

  @override
  void initState() {
    profileBloc.add(ProfileInitialFetchEvent());
    super.initState();
  }

  final ProfileBloc profileBloc = ProfileBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(isHome: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: BlocConsumer<ProfileBloc, ProfileState>(
                      bloc: profileBloc,
                      listenWhen: (previous, current) =>
                          current is ProfileActionState,
                      buildWhen: (previous, current) =>
                          current is! ProfileActionState,
                      listener: (context, state) {
                        print('hello${state.runtimeType}');
                        if (state is ProfileFetchingSuccessFulState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('ProfileFetchingSuccessFulState')));
                        } else if (state is ProfileFetchingLoadingState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('ProfileFetchingLoadingState')));
                        } else if (state is ProfileInitialFetchEvent) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('ProfileInitialFetchEvent')));
                        }
                      },
                      builder: (context, state) {
                        switch (state.runtimeType) {
                          case ProfileFetchingLoadingState:
                            return baseFunctions.platformIndicator();
                          case ProfileFetchingErrorState:
                            return const Text('Error fetching');
                          case ProfileFetchingSuccessFulState:
                            final successState =
                                state as ProfileFetchingSuccessFulState;
                            phoneController.text = successState.profiles.phone;
                            birthController.text =
                                successState.profiles.birthday.toString();
                            nicknameController.text =
                                successState.profiles.nickname;
                            emailController.text =
                                successState.profiles.email ??
                                    'example@gmail.com';
                            return Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  _PhoneFormField(
                                    phoneController: phoneController,
                                  ),
                                  _BirthFormField(
                                    birthController: birthController,
                                  ),
                                  _NicknameFormField(
                                    nicknameController: nicknameController,
                                  ),
                                  _EmailFormField(
                                    emailController: emailController,
                                    // successState.profiles.email ?? '',
                                  )
                                ],
                              ),
                            );
                          default:
                            return baseFunctions.platformIndicator();
                        }
                      }),
                ),
                _UpdateButton(
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return baseFunctions.platformIndicator();
                    //     });
                    if (validate != null && validate == true) {
                      profileBloc.add(ProfileUpdateEvent(
                          nicknameController.text, emailController.text));
                    }
                  },
                ),
              ],
            ),
          ),
        )

        // BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        //   return Text(jsonEncode(state.profileData));
        // })
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
      onSaved: (value) {
        phoneController.text = value!;
      },
      // validator: (value) => ValidateOperations.emailValidation(value),
      validator: (value) => ValidateOperations.normalValidation(value),
    );
  }
}

class _BirthFormField extends StatelessWidget {
  const _BirthFormField({
    required this.birthController,
  });

  final TextEditingController birthController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: birthController,
      title: StringConstants.birthTitle,
      hintText: StringConstants.birthHint,
      onSaved: (value) {
        birthController.text = value!;
      },
      validator: (value) => ValidateOperations.normalValidation(value),
    );
  }
}

class _NicknameFormField extends StatelessWidget {
  const _NicknameFormField({
    required this.nicknameController,
  });

  final TextEditingController nicknameController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: nicknameController,
      title: StringConstants.nicknameTitle,
      hintText: StringConstants.nicknameHint,
      keyboardType: TextInputType.name,
      onSaved: (value) {
        nicknameController.text = value!;
      },
      // validator: (value) => ValidateOperations.emailValidation(value),
      validator: (value) => ValidateOperations.normalValidation(value),
    );
  }
}

class _EmailFormField extends StatelessWidget {
  const _EmailFormField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: emailController,
      title: StringConstants.emailTitle,
      hintText: StringConstants.emailHint,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      // validator: (value) => ValidateOperations.emailValidation(value),
      validator: (value) => ValidateOperations.normalValidation(value),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      buttonText: StringConstants.updateButtonText,
      onTap: onTap,
    );
  }
}
