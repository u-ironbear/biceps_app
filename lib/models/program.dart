class Program {
  final String descriptionUrl;
  final String descriptionShort;
  final String menWomen;
  final String trainingLevel;
  final bool isFree;

  Program({
    this.descriptionUrl,
    this.descriptionShort,
    this.menWomen,
    this.trainingLevel,
    this.isFree,
  });

  Program.fromData(Map<String, dynamic> data)
      : descriptionUrl = data['description_url'],
        descriptionShort = data['description_short'],
        menWomen = data['men_women'],
        trainingLevel = data['training_level'],
        isFree = data['is_free'];
}

class TrainingDay {
  final String purpose;
  final List<String> exercises;

  TrainingDay({
    this.purpose,
    this.exercises,
  });

  TrainingDay.fromData(Map<String, dynamic> data)
      : purpose = data['purpose'],
        exercises = List.from(data['exercises']);
}
