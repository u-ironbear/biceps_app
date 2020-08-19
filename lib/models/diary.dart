class DiaryProgram {
  final String programName;
  final DateTime startDate;
  final int duration;
  final int split;
  final List<String> trainingDates;

  DiaryProgram({
    this.programName,
    this.startDate,
    this.duration,
    this.split,
    this.trainingDates,
  });
}

class DiarySession {}
