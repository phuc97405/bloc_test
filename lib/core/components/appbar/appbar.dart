import 'package:bloc_test/core/base/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/core/base/functions/base_functions.dart';
import 'package:bloc_test/core/components/text/custom_text.dart';
import 'package:bloc_test/core/constants/app/color_constants.dart';
import 'package:bloc_test/core/extensions/context_extensions.dart';
import 'package:bloc_test/core/extensions/image_extensions.dart';
import 'package:bloc_test/core/extensions/num_extensions.dart';
import 'package:bloc_test/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app/string_constants.dart';
import '../../constants/enums/icon_enums.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    this.isHome = false,
  }) : super(key: key);

  final bool isHome;

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final BaseFunctions baseFunctions = BaseFunctions.instance;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.primary,
      elevation: 1,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            IconEnums.appLogo.iconName.toPng,
            height: context.dynamicHeight(0.03),
            width: context.dynamicWidth(0.06),
          ),
          7.pw,
          CustomText(
            StringConstants.appName,
            textStyle: context.textTheme.headlineSmall,
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      actions: [
        widget.isHome
            ? IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return baseFunctions.platformIndicator();
                      });
                  context.read<AuthBloc>().add(LogoutRequested());
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: ColorConstants.black,
                ),
              )
            : const SizedBox.shrink(),
        10.pw,
      ],
    );
  }
}
