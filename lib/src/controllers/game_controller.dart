import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/src/controllers/game_state.dart';
import 'package:my_app/src/models/puzzle.dart';

import '../models/tile.dart';

// images
import '../utils/image_splitter.dart';
import 'package:image_picker/image_picker.dart';

import 'package:palette_generator/palette_generator.dart';

class GameController extends ChangeNotifier {
  GameState _state = GameState(
    crossAxisCount: 3,
    puzzle: Puzzle.create(3),
    solved: false,
    moves: 0,
    status: GameStatus.created,
    type: GameType.clasic,
  );

  final ValueNotifier<int> time = ValueNotifier(0);

  final StreamController<void> _streamController = StreamController.broadcast();

  Stream<void> get onFinish => _streamController.stream;

  Timer? _timer;

  GameState get state => _state;

  Puzzle get puzzle => _state.puzzle;

  // images
  final ImageSplitter _splitter = ImageSplitter();

  Uint8List? bytes;

  List<Image>? images;

  PaletteGenerator? palette;

  void onTileTapped(Tile tile) {
    final canMove = puzzle.canMove(tile.position);
    if (canMove) {
      final newPuzzle = puzzle.move(tile);
      final solved = newPuzzle.isSolved();
      _state = state.copyWith(
        puzzle: newPuzzle,
        moves: state.moves + 1,
        status: solved ? GameStatus.solved : state.status,
      );
      notifyListeners();
      if (solved) {
        _timer?.cancel();
        _streamController.sink.add(null);
      }
    }
  }

  void shuffle() {
    if (_timer != null) {
      time.value = 0;
      _timer!.cancel();
    }
    _state = state.copyWith(
      puzzle: puzzle.shuffle(),
      status: GameStatus.playing,
      moves: 0,
    );
    notifyListeners();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        time.value++;
      },
    );
  }

  void resetGame({GameType? type, int? crossAxisCount}) {
    _timer?.cancel();
    time.value = 0;
    final newState = GameState(
      crossAxisCount: crossAxisCount ?? 3,
      puzzle: crossAxisCount != null
          ? Puzzle.create(crossAxisCount)
          : Puzzle.create(3),
      solved: false,
      moves: 0,
      status: GameStatus.created,
      type: type ?? _state.type,
    );
    _state = newState;
  }

  void changeGrid(int crossAxisCount) async {
    if (bytes != null) {
      images = await _splitter.runSplitterIsolate(bytes!, crossAxisCount);
    }

    resetGame(crossAxisCount: crossAxisCount);
    notifyListeners();
  }

  void changeType(GameType type) async {
    if (type == GameType.picture) {
      final source = await rootBundle.load('assets/images/logo.png');
      bytes = Uint8List.fromList(Uint8List.view(source.buffer));
      images =
          await _splitter.runSplitterIsolate(bytes!, _state.crossAxisCount);

      final image = Image.memory(bytes!);
      palette = await _splitter.getImagePalette(image.image);
    }

    if (type == GameType.clasic) {
      bytes = null;
      images = null;
      palette = null;
    }

    resetGame(type: type, crossAxisCount: _state.crossAxisCount);
    notifyListeners();
  }

  void getImage() async {
    resetGame();
    bytes = await _splitter.getImage(picker: ImagePicker());
    images = await _splitter.runSplitterIsolate(bytes!, _state.crossAxisCount);

    final image = Image.memory(bytes!);
    palette = await _splitter.getImagePalette(image.image);
    notifyListeners();
  }

  @override
  void dispose() {
    _streamController.close();
    _timer?.cancel();
    super.dispose();
  }
}
