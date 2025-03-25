part of 'step_bloc.dart';

class StepState extends Equatable {
  final int count;

  const StepState({this.count = 0});

  StepState copyWith({int? count}) {
    return StepState(count: count ?? this.count);
  }

  @override
  List<Object> get props => [count];
}
