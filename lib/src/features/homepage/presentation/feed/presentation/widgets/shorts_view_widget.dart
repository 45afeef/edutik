import 'package:flutter/material.dart';

import '../domain/shorts_data.dart';

class ShortView extends StatefulWidget {
  final ShortsData data;

  const ShortView({super.key, required this.data});

  @override
  State<ShortView> createState() => _ShortViewState();
}

class _ShortViewState extends State<ShortView> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey[900],
                // Add your video player here
                child: const Center(
                  child: Text(
                    'Video Player Placeholder',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
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
                  Text(
                    widget.data.creatorName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.data.title,
                style: const TextStyle(
                  color: Colors.white,
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
