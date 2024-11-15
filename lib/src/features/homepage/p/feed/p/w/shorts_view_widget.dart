import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../do/shorts_data.dart';

class ShortView extends StatefulWidget {
  final ShortsData data;

  const ShortView({super.key, required this.data});

  @override
  State<ShortView> createState() => _ShortViewState();
}

class _ShortViewState extends State<ShortView> {
  VideoPlayerController? _videoPlayerController;
  YoutubePlayerController? _youtubePlayerController;

  bool _isExpanded = false;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();

    switch (widget.data.videoSource) {
      case VideoSource.youTube:
        initYoutubePlayer();
        break;
      case VideoSource.network:
      default:
        initNetworkVideoPlayer();
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _youtubePlayerController?.dispose();
    super.dispose();
  }

  void initNetworkVideoPlayer() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.data.videoUrl))
          ..setLooping(true)
          ..initialize().then((_) {
            setState(
                () {}); // Ensure the first frame is shown after the video is initialized
            _videoPlayerController?.play(); // Auto-play the video
          });
  }

  void initYoutubePlayer() {
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.data.videoUrl,
      flags: const YoutubePlayerFlags(
        loop: true,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void handleUserTap() {
    if (_videoPlayerController != null) {
      if (_isPlaying) {
        _videoPlayerController!.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        _videoPlayerController!.play();
        setState(() {
          _isPlaying = true;
        });
      }
    } else if (_youtubePlayerController != null) {
      if (_isPlaying) {
        _youtubePlayerController!.pause();
        setState(() {
          _isPlaying = false;
        });
      } else {
        _youtubePlayerController!.play();
        setState(() {
          _isPlaying = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Vedio Section
        Center(
          child: _youtubePlayerController != null
              ? YoutubePlayer(
                  controlsTimeOut: 1.microseconds,
                  aspectRatio: 9 / 16,
                  controller: _youtubePlayerController!,
                )
              : _videoPlayerController != null
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController!))
                  : const Center(child: CircularProgressIndicator()),
        ),
        // Overlay to bypass vedio controlls
        Positioned(
          top: 0,
          left: 0,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: InkWell(onTap: handleUserTap),
        ),

        // Creator section
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.data.creatorProfile),
                    radius: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(widget.data.creatorName),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isExpanded
                      ? MediaQuery.of(context).size.width * 0.8
                      : MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    widget.data.description,
                    maxLines: _isExpanded ? null : 2,
                    overflow: _isExpanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Metrics Section
        Positioned(
          bottom: 50,
          right: 10,
          child: Column(
            children: [
              const Icon(Icons.favorite, color: Colors.white),
              const SizedBox(width: 4),
              Text(
                widget.data.likes.toString(),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Icon(Icons.visibility, color: Colors.white),
              const SizedBox(width: 4),
              Text(
                widget.data.views.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
