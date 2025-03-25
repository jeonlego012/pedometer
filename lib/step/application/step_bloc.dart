import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedometer/step/domain/step.dart';
import 'package:pedometer/step/domain/step_repository.dart';

part 'step_event.dart';
part 'step_state.dart';

class StepBloc extends Bloc<StepEvent, StepState> {
  final stepRepository = StepRepository();

  StepBloc() : super(const StepState()) {
    on<StepFetch>(_stepFetch);
    add(StepFetch());
  }

  void _stepFetch(StepFetch event, Emitter<StepState> emit) async {
    Step step;
    step = await stepRepository.getStep();

    emit(state.copyWith(count: step.count));
  }
}
