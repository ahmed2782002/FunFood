import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


import '../../l10n/app_localizations.dart';
class LossPage extends StatelessWidget {
  LossPage({super.key});


  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context)!;
    final List<Map<String, String>> exercises = [
      {
        'name': localizations.arm_scissors_name,
        'image': 'assets/arm_scissors.jpg',
        'video': 'assets/videos/loss/aarm_scissors.mp4',
        'description': localizations.arm_scissors_description,
      },
      {
        'name': localizations.jumping_jacks_name,
        'image': 'assets/jumping_jacks.jpg',
        'video': 'assets/videos/loss/jumbingjacks.mp4',
        'description': localizations.jumping_jacks_description,
      },
      {
        'name': localizations.quad_stretch_name,
        'image': 'assets/quad_stretch.jpg',
        'video': 'assets/videos/loss/quad_stretch.mp4',
        'description': localizations.quad_stretch_description,
      },
      {
        'name': localizations.side_lunges_name,
        'image': 'assets/side_lunges.jpg',
        'video': 'assets/videos/loss/side_lunges.mp4',
        'description': localizations.side_lunges_description,
      },
      {
        'name': localizations.standing_bicycle_crunches_name,
        'image': 'assets/standing_bicycle_crunches.jpg',
        'video': 'assets/videos/loss/standing_bicycle crunches.mp4',
        'description': localizations.standing_bicycle_crunches_description,
      },
      {
        'name': localizations.standing_glute_kickbacks_name,
        'image': 'assets/standing_glute_kickbacks.png',
        'video': 'assets/videos/loss/standing_glute_kickbacks.mp4',
        'description': localizations.standing_glute_kickbacks_description,
      },
      {
        'name': localizations.standing_hip_circle_name,
        'image': 'assets/standing_hip_circle.png',
        'video': 'assets/videos/loss/standing_hip_circle.mp4',
        'description': localizations.standing_hip_circle_description,
      },
      {
        'name': localizations.standing_knee_to_chest_name,
        'image': 'assets/standing_knee_to_chest.png',
        'video': 'assets/videos/loss/standing_knee_to_chest.mp4',
        'description': localizations.standing_knee_to_chest_description,
      },
    ];


    return Scaffold(
      backgroundColor: const Color(0xFF0B192C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B192C),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(AppLocalizations.of(context)!.lossExercises, style: const TextStyle(color: Colors.white)),
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

  const VideoPlayerScreen({
    super.key,
    required this.title,
    required this.videoPath,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  Timer? _timer;
  int _remainingSeconds = 30;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true); // ✅ تكرار الفيديو تلقائيًا
        _controller.play();
        startTimer();
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

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds == 0) {
        _controller.pause();
        _timer?.cancel();
        final local = AppLocalizations.of(context)!;
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(local.exerciseTimerDoneTitle),
            content: Text(local.exerciseTimerDoneContent),
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
      } else {
        setState(() {
          _remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
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
              '⏱️ ${AppLocalizations.of(context)!.secondsRemaining(_remainingSeconds.toString())}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        )
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
