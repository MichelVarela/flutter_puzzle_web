import 'package:flutter/material.dart';
import 'package:my_app/src/controllers/game_controller.dart';
import 'package:my_app/src/controllers/game_state.dart';
import 'package:my_app/src/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../models/tile.dart';

class PuzzleTile extends StatelessWidget {
  final Tile tile;
  final double size;
  final VoidCallback onTap;
  const PuzzleTile({
    Key? key,
    required this.tile,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();

    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 200,
      ),
      left: (tile.position.x - 1) * size,
      top: (tile.position.y - 1) * size,
      child: GestureDetector(
        onTap: onTap,
        child: controller.state.type == GameType.clasic
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppTheme.primary,
                ),
                width: size - 5.0,
                height: size - 5.0,
                alignment: Alignment.center,
                child: Text(
                  tile.value.toString(),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.white,
                  ),
                ),
              )
            : Container(
                color: Colors.transparent,
                width: size - 2.0,
                height: size - 2.0,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/images/no-image.jpg'),
                    image: AssetImage(
                        'assets/images/separated/0${tile.value.toString()}.png'),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
      ),
    );
  }
}
