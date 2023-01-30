import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    super.key,
    required this.name,
    required this.onTap,
    this.icon,
  });

  final String name;
  final Function onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: AppTheme.primary),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 40.0,
            width: 95.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Row(children: [
                    Icon(icon, size: 16.0, color: AppTheme.primary),
                    const SizedBox(width: 5.0),
                  ]),
                Text(name, style: AppTheme.textStyle),
              ],
            )),
      ),
    );
  }
}
