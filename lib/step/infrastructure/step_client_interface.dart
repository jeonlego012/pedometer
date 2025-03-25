import 'package:pedometer/step/infrastructure/step_dto.dart';

abstract class StepClientInterface {
  Future<StepDto> getStepDto();
}
