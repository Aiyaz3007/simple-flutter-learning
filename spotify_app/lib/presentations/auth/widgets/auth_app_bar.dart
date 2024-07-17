import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icons;
  final Function()? iconButton;
  final String? image;
  final Widget? actions;

  const AuthAppBar({
    super.key,
    this.icons,
    this.image,
    this.actions,
    this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: icons != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: iconButton != null
                  ? GestureDetector(
                      onTap: iconButton,
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.grey),
                        child: Icon(
                          icons,
                          size: 18,
                        ),
                      ),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.grey),
                      child: Icon(
                        icons,
                        size: 18,
                      ),
                    ),
            )
          : null,
      title: image != null
          ? SvgPicture.asset(
              image!,
              height: 36,
            )
          : null,
      actions: actions != null ? [actions!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
