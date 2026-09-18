import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


import '../../l10n/app_localizations.dart';
class ExercisesPage extends StatelessWidget {
  ExercisesPage({super.key});



  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context)!;



    final List<Map<String, dynamic>> exercises =
    [
      {
        'name': localizations.arm_scissors_name,
        'image': 'assets/arm_scissors.jpg',
        'video': 'assets/videos/mus/arm_scissors.mp4',
        'description': localizations.arm_scissors_description,
        'reps': 3,
      },
      {
        'name': localizations.incline_push_ups_name,
        'image': 'assets/incline_push_ups.webp',
        'video': 'assets/videos/mus/incline_push_ups.mp4',
        'description': localizations.incline_push_ups_description,
        'reps': 4,
      },
      {
        'name': localizations.jumping_jacks_name,
        'image': 'assets/jumping_jacks.jpg',
        'video': 'assets/videos/mus/jumping_jacks.mp4',
        'description': localizations.jumping_jacks_description,
        'reps': 2,
      },
      {
        'name': localizations.knee_push_ups_name,
        'image': 'assets/knee_push_ups.jpg',
        'video': 'assets/videos/mus/knee_push_ups.mp4',
        'description': localizations.knee_push_ups_description,
        'reps': 3,
      },
      {
        'name': localizations.wide_arm_push_ups_name,
        'image': 'assets/wide_arm_push_ups.webp',
        'video': 'assets/videos/mus/wide_arm_push_ups.mp4',
        'description': localizations.wide_arm_push_ups_description,
        'reps': 3,
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF0B192C),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF0B192C),
        title: Text(AppLocalizations.of(context)!.exercises, style: const TextStyle(color: Colors.white)),

    centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoPlayerScreen(
                    title: exercise['name']!,
                    videoPath: exercise['video']!,
                    repetitions: exercise['reps'] ?? 3,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(left: 12, top: 4),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      exercise['image']!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            exercise['description']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String title;
  final String videoPath;
  final int repetitions;

  const VideoPlayerScreen({
    super.key,
    required this.title,
    required this.videoPath,
    this.repetitions = 3,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  int _currentRepetition = 1;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(false);
        _controller.addListener(_onVideoEnd);
      }).catchError((error) {
        debugPrint('❌ Error loading video: $error');
        final local = AppLocalizations.of(context)!;
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(local.videoErrorTitle),
            content: Text(local.videoErrorContent),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(local.ok),
              )
            ],
          ),
        );
      });
  }

  void _onVideoEnd() {
    if (_controller.value.position >= _controller.value.duration &&
        !_controller.value.isPlaying) {
      if (_currentRepetition < widget.repetitions) {
        setState(() {
          _currentRepetition++;
        });
        _controller.seekTo(Duration.zero);
        _controller.play();
      } else {
        _controller.removeListener(_onVideoEnd);
        _showCompletionDialog();
      }
    }
  }

  void _showCompletionDialog() {
    final local = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(local.exerciseDoneTitle),
        content: Text(local.exerciseDoneContent),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(local.back),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onVideoEnd);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B192C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B192C),
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            const SizedBox(height: 20),
            Text(
              '🔁 ${AppLocalizations.of(context)!.repetitionProgress(_currentRepetition.toString(), widget.repetitions.toString())}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        )
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
