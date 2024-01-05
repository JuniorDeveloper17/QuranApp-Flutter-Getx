import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioService extends GetxController {
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  RxInt number_surah = 0.obs;
  RxBool isLoading = false.obs;
  RxInt page_init = 0.obs;

  Future add_audio(value) async {
    audio.clear();
    audioPlayer.stop();
    indexPlay(0);
    audioPlayer.stop();
    isPlay(false);
    condition('noPlay');
    isPlay(false);
    if (playlist != null) {
      playlist!.clear();
    }
    ConcatenatingAudioSource(children: []).clear();
    await indexPlay(0);
    audio.add(value.toString());
  }

  List<String> audio = [];

  AudioPlayer audioPlayer = AudioPlayer();

  RxInt indexPlay = 0.obs;

  RxString condition = 'noPlay'.obs;
  RxBool isPlay = false.obs;

  void play(int index) async {
    if (condition == 'noPlay') {
      condition('play');
      await play_state();
      audioPlayer.play();
    } else if (isPlay.isTrue) {
      audioPlayer.pause();
      isPlay(false);
    } else if (isPlay.isFalse) {
      audioPlayer.play();
      isPlay(true);
    }
  }

  void previus(bool next) {
    if (next) {
      if (indexPlay.value != audio.length - 1) {
        audioPlayer.seekToNext();
      }
    } else {
      if (indexPlay.value != 0) {
        audioPlayer.seekToPrevious();
      }
    }
  }

  ConcatenatingAudioSource? playlist;

  Future play_state() async {
    if (audio.length != 0) {
      playlist = ConcatenatingAudioSource(
          useLazyPreparation: true,
          shuffleOrder: DefaultShuffleOrder(),
          children: List.generate(audio.length, (index) {
            return AudioSource.uri(Uri.parse(audio[index]));
          }));
      await audioPlayer.setAudioSource(playlist!,
          initialIndex: 0, initialPosition: Duration.zero);
      audioPlayer.currentIndexStream.listen((event) {
        indexPlay(event! + 1);
      });
      audioPlayer.processingStateStream.listen((event) {
        if (event == ProcessingState.completed) {
          indexPlay(0);
          condition('noPlay');
          isPlay(false);
        } else {
          isPlay(true);
        }
      });
    }
  }
}
