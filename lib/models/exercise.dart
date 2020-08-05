import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final String type;
  final String muscleGroup;
  final String targetMuscles;
  final String additionalMuscles;
  final String description;
  final List<String> instructions;
  final List<String> tips;
  final String imageAsset;
  final String videoAsset;

  Exercise({
    @required this.name,
    @required this.type,
    @required this.muscleGroup,
    @required this.targetMuscles,
    @required this.additionalMuscles,
    this.description,
    this.instructions,
    this.tips,
    this.imageAsset,
    this.videoAsset,
  });

  Exercise.fromData(Map<String, dynamic> data)
      : name = data['name'],
        type = data['type'],
        muscleGroup = data['muscle_group'],
        targetMuscles = data['target_muscles'],
        additionalMuscles = data['additional_muscles'],
        description = data['description'],
        instructions = List.from(data['instructions']),
        tips = List.from(data['tips']),
        imageAsset = data['image_url'],
        videoAsset = data['video_url'];
}
