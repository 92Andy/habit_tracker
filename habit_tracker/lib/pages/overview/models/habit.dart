enum HabitStatus {
  completed,
  pending,
  started,
}

extension ParseToString on HabitStatus {
  String getString() {
    switch (this) {
      case HabitStatus.started:
        return 'Started';
      case HabitStatus.pending:
        return 'Pending';
      case HabitStatus.completed:
        return 'Completed';
    }
  }
}

class Habit {
  Habit({
    required this.title,
    required this.iconString,
    required this.startTime,
    this.status = HabitStatus.started,
  });

  final String title;
  final String iconString;
  final String startTime;
  HabitStatus status;
}
