class TrainingDay {
  final String dayName;
  final String purpose;
  final List<Map<String, dynamic>> exercises;

  TrainingDay({
    this.dayName,
    this.purpose,
    this.exercises,
  });

  TrainingDay.fromData(Map<String, dynamic> data)
      : dayName = data['day_name'],
        purpose = data['purpose'],
        exercises = List.from(data['exercises']);
}
