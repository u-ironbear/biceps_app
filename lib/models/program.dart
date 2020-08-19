class Program {
  //TODO добавить свойство isAvailable; также и в Firestore
  /// Свойство isAvailable меняется с true на false, если пользователь уже
  /// выбрал эту программу. Также с его помощью можно контролировать
  /// видимость (доступность) платных программ.
  /// Строго говоря, этим свойством можно заменить isFree.
  final String code;
  final String name;
  final int order;
  final int split;
  final String place;
  final String goal;
  final String description;
  final String targetGender;
  final int duration;
  final String trainingLevel;
  final bool isFree;
  final String imageAsset;
  final String videoAsset;

  Program({
    this.code,
    this.name,
    this.order,
    this.split,
    this.place,
    this.goal,
    this.description,
    this.targetGender,
    this.duration,
    this.trainingLevel,
    this.isFree,
    this.imageAsset,
    this.videoAsset,
  });

  Program.fromData(Map<String, dynamic> data)
      : code = data['code'],
        name = data['name'],
        order = data['order'],
        split = data['split'],
        place = data['place'],
        goal = data['goal'],
        description = data['description'],
        targetGender = data['target_gender'],
        duration = data['duration'],
        trainingLevel = data['level'],
        isFree = data['is_free'],
        imageAsset = data['image_url'],
        videoAsset = data['video_url'];
}
