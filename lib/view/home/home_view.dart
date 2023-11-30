import 'dart:convert';

import 'package:bloc_test/core/base/bloc/profile_bloc/profile_bloc.dart';
import 'package:bloc_test/core/components/appbar/appbar.dart';
import 'package:bloc_test/core/components/text/custom_text.dart';
import 'package:bloc_test/core/constants/app/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isHome: true),
      body: Center(
        child: Column(
          children: [
            const CustomText(StringConstants.homePage),
            GestureDetector(
              onTap: () {
                context.read<ProfileBloc>().add(SetProfileData());
              },
              child: const Text('get Profile'),
            ),
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
              return Text(jsonEncode(state.profileData));
            })
          ],
        ),
      ),
    );
  }
}
