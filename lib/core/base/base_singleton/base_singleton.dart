import 'package:bloc_test/core/base/functions/base_functions.dart';
import 'package:bloc_test/core/constants/app/color_constants.dart';

abstract class BaseSingleton {
  ColorConstants get colors => ColorConstants.instance;
  BaseFunctions get functions => BaseFunctions.instance;
}
