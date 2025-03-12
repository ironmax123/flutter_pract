import 'package:flutter/material.dart';

class InstagramColor {
  InstagramColor._();

  /// Mono
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF8E8E8E);

  /// Primary Colors
  static const Color blue = Color(0xFF3797EF); // フォロー・リンク色
  static const Color red = Color(0xFFFD1D1D); // 通知・アクション系
  static const Color green = Color(0xFF70C050); // 成功メッセージ系

  /// Gradient Colors
  static const Color gradientStart = Color(0xFFFEDA77); // 黄
  static const Color gradientMiddle1 = Color(0xFFFA7E1E); // オレンジ
  static const Color gradientMiddle2 = Color(0xFFD62976); // ピンク
  static const Color gradientMiddle3 = Color(0xFF962FBF); // 紫
  static const Color gradientEnd = Color(0xFF4F5BD5); // 青

  /// Instagram公式のグラデーション
  static const LinearGradient instagramGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      gradientStart,
      gradientMiddle1,
      gradientMiddle2,
      gradientMiddle3,
      gradientEnd,
    ],
  );
}
