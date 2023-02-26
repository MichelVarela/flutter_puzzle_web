import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/game_controller.dart';
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
    final controller = context.watch<GameController>();
    final palette = Provider.of<GameController>(context, listen: false).palette;
    Color button() {
      if (palette != null) {
        if (palette.vibrantColor?.color != null) {
          return palette.vibrantColor!.color;
        }
      }
      return AppTheme.primary;
    }

    return Material(
      color: button(),
      borderRadius: BorderRadius.circular(20.0),
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          //constraints: BoxConstraints(maxWidth: 100.0),
            decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: button()),
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: 40.0,
            //width: 95.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Row(children: [
                    Icon(icon, size: 16.0, color: AppTheme.white),
                    const SizedBox(width: 5.0),
                  ]),
                Text(name, style: AppTheme.textStyle),
              ],
            )),
      ),
    );
  }
}
