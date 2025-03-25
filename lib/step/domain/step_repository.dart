import 'package:pedometer/step/domain/step_repository_interface.dart';
import 'package:pedometer/step/domain/step.dart';
import 'package:pedometer/step/infrastructure/step_client.dart';
import 'package:pedometer/step/infrastructure/step_dto.dart';

class StepRepository implements StepRepositoryInterface {
  final stepClient = StepClient();

  @override
  Future<Step> getStep() async {
    StepDto stepDto = await stepClient.getStepDto();
    return stepDto.toDomain();
  }
}
