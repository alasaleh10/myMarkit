import 'package:audioplayers/audioplayers.dart';

Future<void> barcodeSound() async {
  final player = AudioPlayer();
  player.audioCache = AudioCache(prefix: 'assets/images/');
  await player.play(AssetSource('barcode.wav'));
}
