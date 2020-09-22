class TrainingDay {
  final String dayName;
  final int dayOrder;
  final String purpose;
  final List<Map<String, dynamic>> exercises;

  TrainingDay({
    this.dayName,
    this.dayOrder,
    this.purpose,
    this.exercises,
  });

  TrainingDay.fromData(Map<String, dynamic> data)
      : dayName = data['day_name'],
        dayOrder = data['day_order'],
        purpose = data['purpose'],
        exercises = List.from(data['exercises']);
}
