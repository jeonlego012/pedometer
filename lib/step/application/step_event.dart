part of 'step_bloc.dart';

abstract class StepEvent extends Equatable {
  const StepEvent();
}

class StepFetch extends StepEvent {
  const StepFetch();

  @override
  List<Object> get props => [];
}
