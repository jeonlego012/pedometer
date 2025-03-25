import 'package:pedometer/step/domain/step.dart';

class StepDto {
  final int count;
  final DateTime date;

  StepDto({required this.count, required this.date});

  Step toDomain() {
    return Step(count: count, date: date);
  }

  StepDto copyWith({int? count, DateTime? date}) {
    return StepDto(count: count ?? this.count, date: date ?? this.date);
  }
}
