import 'package:flutter/material.dart';
import 'package:hijra_steps/theme/colors.dart';

class CZButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double verticalPadding;
  final double horizontalPadding;
  final bool small;
  final bool disabled;
  final void Function() onPress;

  const CZButton(
      {Key? key,
      required this.onPress,
      required this.text,
      this.icon,
      this.verticalPadding = 12.0,
      this.horizontalPadding = 16.0,
      this.small = false,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primaryGreen,
        padding: !small
            ? EdgeInsets.symmetric(
                vertical: verticalPadding, horizontal: horizontalPadding)
            : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(icon),
            ),
          Text(text)
        ],
      ),
      onPressed: disabled ? null : onPress,
    );
  }
}
