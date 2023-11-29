import 'package:bloc_test/core/components/appbar/appbar.dart';
import 'package:bloc_test/core/components/text/custom_text.dart';
import 'package:bloc_test/core/constants/app/string_constants.dart';
import 'package:flutter/material.dart';

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
      body: const Center(
        child: CustomText(StringConstants.homePage),
      ),
    );
  }
}
