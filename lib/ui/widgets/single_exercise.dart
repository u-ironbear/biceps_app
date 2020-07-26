import 'package:biceps_app/models/exercise.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SingleExercise extends StatefulWidget {
  final Exercise exercise;

  const SingleExercise({
    Key key,
    this.exercise,
  }) : super(key: key);

  @override
  _SingleExerciseState createState() => _SingleExerciseState();
}

class _SingleExerciseState extends State<SingleExercise> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.exercise.videoAsset,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        isLive: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: YoutubePlayer(
                  controller: _controller,
                ),
              ),
              verticalSpaceSmall,
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black87),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Целевые группы мышц: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.exercise.targetMuscles),
                  ],
                ),
              ),
              verticalSpaceSmall,
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black87),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Дополнительные группы мышц: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.exercise.additionalMuscles),
                  ],
                ),
              ),
              verticalSpaceSmall,
              Text(widget.exercise.description),
              verticalSpaceSmall,
              Text(
                'Последовательность выполнения',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              verticalSpaceSmall,
              for (String currentString in widget.exercise.instructions)
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 4,
                  ),
                  child: Text(currentString),
                ),
              verticalSpaceSmall,
              if (widget.exercise.tips.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Подсказки и ошибки',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    verticalSpaceSmall,
                    for (String currentString in widget.exercise.tips)
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 4,
                        ),
                        child: Text(currentString),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
