import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthOtherSignInWays extends StatelessWidget {
  final List<String> icons;
  final List<VoidCallback> onTapCallbacks;

  const AuthOtherSignInWays({
    super.key,
    required this.icons,
    required this.onTapCallbacks,
  }) : assert(icons.length == onTapCallbacks.length,
            'The length of icons and onTapCallbacks should be equal.');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: icons.asMap().entries.map((entry) {
        int index = entry.key;
        String icon = entry.value;

        return GestureDetector(
          onTap: onTapCallbacks[index],
          child: SvgPicture.asset(icon),
        );
      }).toList(),
    );
  }
}
