import 'package:flutter/material.dart';
import 'package:nuforce/app/modules/auth/components/svg_button.dart';
import 'package:nuforce/gen/assets.gen.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgButton(
          onPressed: () {},
          svgPath: Assets.images.svg.google,
        ),
        SvgButton(
          onPressed: () {},
          svgPath: Assets.images.svg.microsoft,
        ),
        SvgButton(
          onPressed: () {},
          svgPath: Assets.images.svg.facebook,
        ),
        SvgButton(
          onPressed: () {},
          svgPath: Assets.images.svg.apple,
        ),
      ],
    );
  }
}
