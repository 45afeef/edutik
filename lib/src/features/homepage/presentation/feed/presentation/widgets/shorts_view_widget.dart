import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../domain/shorts_data.dart';

class ShortView extends StatefulWidget {
  final ShortsData data;

  const ShortView({super.key, required this.data});

  @override
  State<ShortView> createState() => _ShortViewState();
}

class _ShortViewState extends State<ShortView> {
  late VideoPlayerController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        widget.data.videoUrl
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
        ))
      // _controller = VideoPlayerController.network(widget.data.videoUrl)
      ..initialize().then((_) {
        setState(
            () {}); // Ensure the first frame is shown after the video is initialized
        _controller.play(); // Auto-play the video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ),
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
