import 'package:flutter/material.dart';
import 'package:my_app/src/themes/app_theme.dart';
import 'package:provider/provider.dart';

import '../controllers/game_controller.dart';
import '../controllers/game_state.dart';
import '../utils/get_image.dart';
import 'button_outlined.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final state = controller.state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonOutlined(
                name: state.status == GameStatus.created ? "START" : "RESET",
                onTap: controller.shuffle,
                icon: Icons.replay_rounded,
              ),
              const SizedBox(width: 20.0),
              if (controller.state.type == GameType.clasic)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: AppTheme.primary),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 40.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButton<int>(
                    // style: textStyle,
                    // alignment: Alignment.center,
                    borderRadius: BorderRadius.circular(10.0),
                    underline: Container(height: 0.0),
                    iconEnabledColor: AppTheme.primary,
                    items: [3, 4, 5, 6]
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.grid_3x3,
                                  size: 16.0,
                                  color: AppTheme.primary,
                                ),
                                Text(
                                  "${e}x$e",
                                  style: AppTheme.textStyle,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (crossAxisCount) {
                      if (crossAxisCount != null &&
                          crossAxisCount != state.crossAxisCount) {
                        controller.changeGrid(crossAxisCount);
                      }
                    },
                    value: state.crossAxisCount,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonOutlined(
                  name: 'Clasic',
                  onTap: () => controller.changeType(GameType.clasic)),
              const SizedBox(width: 20.0),
              ButtonOutlined(
                  name: 'Picture',
                  onTap: () => controller.changeType(GameType.picture)),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          ButtonOutlined(name: 'Pick image', onTap: () => getImage()),
        ],
      ),
    );
  }
}
