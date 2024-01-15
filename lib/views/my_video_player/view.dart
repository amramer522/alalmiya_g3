import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayerView extends StatefulWidget {
  const MyVideoPlayerView({Key? key}) : super(key: key);

  @override
  State<MyVideoPlayerView> createState() => _MyVideoPlayerViewState();
}

class _MyVideoPlayerViewState extends State<MyVideoPlayerView> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse('http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4'), videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      debugPrint("Listener");
      debugPrint(_controller.value.position.toString());
      debugPrint(_controller.value.duration.toString());
      debugPrint("playbackSpeed");
      debugPrint(_controller.value.toString());
      debugPrint(_controller.value.caption.text);
      debugPrint(_controller.value.playbackSpeed.toString());
      // _controller.videoPlayerOptions.webOptions.controls.allowFullscreen
      if (_controller.value.isCompleted) {
        _controller.seekTo(Duration.zero);
      }
      setState(() {});
    });
  }

  // double value = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Container(
                    color: Colors.red,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        VideoPlayer(
                          _controller,
                        ),
                        Positioned(
                            right: 0,
                            top: 40,
                            bottom: 40,
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: SizedBox(
                                height: 40,
                                child: Slider(
                                  value: _controller.value.volume,
                                  onChanged: (value)async {
                                    debugPrint(value.toString());
                                   await _controller.setVolume(value);
                                   setState(() {

                                   });
                                  },
                                  min: 0,
                                  // divisions: 10,
                                  max: 1,
                                ),
                              ),
                            )),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      // _controller.se
                                      _controller.setLooping(!_controller.value.isLooping);
                                    },
                                    icon: Icon(
                                      Icons.repeat,
                                      color: _controller.value.isLooping ? Theme.of(context).primaryColor : null,
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    if (_controller.value.playbackSpeed == 2) {
                                      _controller.setPlaybackSpeed(1);
                                    } else {
                                      _controller.setPlaybackSpeed(_controller.value.playbackSpeed + .5);
                                    }
                                    // _controller.value.playbackSpeed+=.5;
                                  },
                                  child: CircleAvatar(
                                    radius: 14,
                                    child: Text(
                                      "${_controller.value.playbackSpeed}",
                                      style: const TextStyle(fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Positioned(
                          bottom: 4,
                          left: 0,
                          right: 0,
                          child: SliderTheme(
                            data: SliderThemeData(
                              thumbShape: SliderComponentShape.noThumb,
                            ),
                            child: Slider(
                              activeColor: Colors.yellow,
                              thumbColor: Colors.transparent,
                              secondaryActiveColor: Colors.transparent,
                              inactiveColor: Colors.transparent,
                              value: _controller.value.buffered.isEmpty ? 0 : _controller.value.buffered.first.end.inSeconds.toDouble(),
                              min: 0,
                              max: _controller.value.duration.inSeconds.toDouble(),
                              onChanged: (val) {},
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          left: 0,
                          right: 0,
                          child: SliderTheme(
                            data: const SliderThemeData(
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                            ),
                            child: Slider(
                              activeColor: Colors.red,
                              inactiveColor: Colors.white.withOpacity(.5),
                              value: _controller.value.position.inMicroseconds.toDouble(),
                              min: 0,
                              max: _controller.value.duration.inMicroseconds.toDouble(),
                              onChanged: (v) {
                                _controller.seekTo(Duration(microseconds: v.toInt()));
                                // debugPrint(value);
                                // value = v;
                                // setState(() {});
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 36).copyWith(bottom: 2),
                            child: Row(
                              children: [
                                Text(
                                  getTimeShape(_controller.value.position.inSeconds),
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  getTimeShape(_controller.value.duration.inSeconds),
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }

  String getTimeShape(int second) {
    int minutes = second ~/ 60;
    int seconds = second % 60;
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

