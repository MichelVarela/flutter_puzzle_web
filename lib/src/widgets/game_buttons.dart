import 'package:flutter/material.dart';
import 'package:my_app/src/themes/app_theme.dart';
import 'package:my_app/src/utils/color_brightness.dart';
import 'package:provider/provider.dart';

import '../controllers/game_controller.dart';
import '../controllers/game_state.dart';
import 'button_outlined.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final image = Provider.of<GameController>(context, listen: false).bytes;
    final palette = Provider.of<GameController>(context, listen: false).palette;
    Color button() {
      if (palette != null) {
        if (palette.vibrantColor?.color != null) {
          return palette.vibrantColor!.color;
        }
      }
      return AppTheme.primary;
    }
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
              Container(
                decoration: BoxDecoration(
                  color: button(),
                  border: Border.all(width: 2.0, color: button()),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 40.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownButton<int>(
                  dropdownColor: button(),
                  borderRadius: BorderRadius.circular(10.0),
                  underline: Container(height: 0.0),
                  iconEnabledColor: AppTheme.white,
                  items: [3, 4, 5]
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.grid_3x3,
                                size: 16.0,
                                color: AppTheme.white,
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
          if (state.type == GameType.picture)
            Column(
              children: [
                ButtonOutlined(
                    name: 'Pick image', onTap: () => controller.getImage()),
                const SizedBox(
                  height: 20.0,
                ),
                if (image != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.memory(
                      image,
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            )
        ],
      ),
    );
  }
}
