import 'package:flutter/material.dart';

abstract class MyColors {
  // Primary Colors - Orange
  static const Color orangeLight = Color(0xFFffeee6);
  static const Color orangeLightHover = Color(0xFFfee5d9);
  static const Color orangeLightActive = Color(0xFFfec9b1);
  static const Color orangeNormal = Color(0xFFfb5002);
  static const Color orangeNormalHover = Color(0xFFe24802);
  static const Color orangeActiveBut = Color(0xFFFB5002);
  static const Color orangeNormalActive = Color(0xFFc94002);
  static const Color orangeDark = Color(0xFFbc3c02);
  static const Color orangeDarkHover = Color(0xFF973001);
  static const Color orangeDarkActive = Color(0xFF712401);
  static const Color orangeDarker = Color(0xFF581c01);

  // Primary Colors - Blue (Purple)
  static const Color purpleLight = Color(0xFFE8E0FF);
  static const Color purpleLightHover = Color(0xFFece8ff);
  static const Color purpleLightActive = Color(0xFFd9d0ff);
  static const Color purpleNormal = Color(0xFF8366ff);
  static const Color purpleNormalHover = Color(0xFF765ce6);
  static const Color purpleNormalActive = Color(0xFF6952cc);
  static const Color purpleDark = Color(0xFF624dbf);
  static const Color purpleDarkHover = Color(0xFF4f3d99);
  static const Color purpleDarkActive = Color(0xFF3b2e73);
  static const Color purpleDarker = Color(0xFF2e2459);

  // Primary Colors - Grey
  static const Color greyLight = Color(0xFFe9e9e9);
  static const Color greyLightHover = Color(0xFFdeddde);
  static const Color greyLightActive = Color(0xFFbbbaba);
  static const Color greyNormal = Color(0xFF231f20);
  static const Color greyNormalHover = Color(0xFF201c1d);
  static const Color greyNormalActive = Color(0xFF1c191a);
  static const Color greyDark = Color(0xFF1a1718);
  static const Color greyDarkHover = Color(0xFF151313);
  static const Color greyDarkActive = Color(0xFF100e0e);
  static const Color greyDarker = Color(0xFF0c0b0b);

  // Secondary Colors - Blue (Dark Blue)
  static const Color darkBlueLight = Color(0xFFfefefe);
  static const Color darkBlueLightHover = Color(0xFFfdfdfd);
  static const Color darkBlueLightActive = Color(0xFFfbfbfb);
  static const Color darkBlueNormal = Color(0xFFf1f1f2);
  static const Color darkBlueNormalHover = Color(0xFFd9d9da);
  static const Color darkBlueNormalActive = Color(0xFFc1c1c2);
  static const Color darkBlueDark = Color(0xFFb5b5b6);
  static const Color darkBlueDarkHover = Color(0xFF919191);
  static const Color darkBlueDarkActive = Color(0xFF6c6c6d);
  static const Color grayDarkActive = Color(0xFF565B61);
  static const Color darkBlueDarker = Color(0xFF545455);
  static const Color darkBlueOflight = Color(0xFFF3F0FF);

  // Secondary Colors - Orange
  static const Color secondaryOrangeLight = Color(0xFFfef7e8);
  static const Color secondaryOrangeLightHover = Color(0xFFfef2dd);
  static const Color secondaryOrangeLightActive = Color(0xFFfde5b8);
  static const Color secondaryOrangeNormal = Color(0xFFf7aa1a);
  static const Color secondaryOrangeNormalHover = Color(0xFFde9917);
  static const Color secondaryOrangeNormalActive = Color(0xFFc68815);
  static const Color secondaryOrangeDark = Color(0xFFb98014);
  static const Color secondaryOrangeDarkHover = Color(0xFF946610);
  static const Color secondaryOrangeDarkActive = Color(0xFF6f4c0c);
  static const Color secondaryOrangeDarker = Color(0xFF563b09);

  // Secondary Colors - Green
  static const Color greenLight = Color(0xFFeaf7ef);
  static const Color greenLightHover = Color(0xFFe0f3e6);
  static const Color greenLightActive = Color(0xFFbfe7cc);
  static const Color greenNormal = Color(0xFF2fb05b);
  static const Color greenNormalHover = Color(0xFF2a9e52);
  static const Color greenNormalActive = Color(0xFF268d49);
  static const Color greenDark = Color(0xFF238444);
  static const Color greenDarkHover = Color(0xFF1c6a37);
  static const Color greenDarkActive = Color(0xFF154f29);
  static const Color greenDarker = Color(0xFF103e20);
  static const Color green = Color(0xFF068006);

  // Secondary Colors - Blue (Teal)
  static const Color tealLight = Color(0xFFEBF9F9);
  static const Color tealLightHover = Color(0xFFE2F5F6);
  static const Color tealLightActive = Color(0xFFC2EBEC);
  static const Color tealNormal = Color(0xFF3BBFC2);
  static const Color tealNormalHover = Color(0xFF35ACAF);
  static const Color tealNormalActive = Color(0xFF2F999B);
  static const Color tealDark = Color(0xFF2C8F92);
  static const Color tealDarkHover = Color(0xFF237374);
  static const Color tealDarkActive = Color(0xFF1B5657);
  static const Color tealDarker = Color(0xFF154344);
  static const Color tealOflight = Color(0xFF008F8F);

  // Secondary Colors - Red (Pink)
  static const Color pinkLight = Color(0xFFFDEDF3);
  static const Color pinkLightHover = Color(0xFFFCE3ED);
  static const Color pinkLightActive = Color(0xFFF9C6DB);
  static const Color pinkNormal = Color(0xFFED478A);
  static const Color pinkNormalHover = Color(0xFFD5407C);
  static const Color pinkNormalActive = Color(0xFFBE396E);
  static const Color pinkDark = Color(0xFFB23568);
  static const Color pinkDarkHover = Color(0xFF8E2B53);
  static const Color pinkDarkActive = Color(0xFF6B203E);
  static const Color pinkDarker = Color(0xFF531930);

  // Secondary Colors - Red
  static const Color redLight = Color(0xFFfee8e7);
  static const Color redLightHover = Color(0xFFfddcdb);
  static const Color redLightActive = Color(0xFFfbb8b5);
  static const Color redNormal = Color(0xFFf51a0e);
  static const Color redNormalHover = Color(0xFFdd170d);
  static const Color redNormalActive = Color(0xFFc4150b);
  static const Color redDark = Color(0xFFb8140b);
  static const Color redDarkHover = Color(0xFF931008);
  static const Color redDarkActive = Color(0xFF6e0c06);
  static const Color redDarker = Color(0xFF560905);

  //white
  static const Color white = Color(0xFFFFFFFF);
}
