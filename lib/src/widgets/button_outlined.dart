import 'package:flutter/material.dart';

import '../themes/app_themes.dart';

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({
    super.key,
    required this.name,
    required this.onTap,
  });

  final String name;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        fontSize: 12.0, fontWeight: FontWeight.bold, color: AppThemes.primary);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: AppThemes.primary),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 40.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(name, style: textStyle)),
      ),
    );
  }
}