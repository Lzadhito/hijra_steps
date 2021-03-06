import 'package:flutter/material.dart';
import './unify_colors.dart';

class UnifyIconButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final void Function()? onTap;
  const UnifyIconButton(
      {Key? key,
      required this.icon,
      this.backgroundColor = primaryGreen,
      this.iconColor = Colors.white,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 2,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
