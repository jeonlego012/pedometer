import 'package:pedometer/step/infrastructure/step_dto.dart';
import 'package:pedometer/step/infrastructure/step_client_interface.dart';
import 'package:health/health.dart';

class StepClient implements StepClientInterface {
  final health = Health();
  List<RecordingMethod> recordingMethodsToFilter = [];

  @override
  Future<StepDto> getStepDto() async {
    int? steps;
    StepDto stepDto = StepDto(count: 0, date: DateTime.now());
    // get steps for today
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);
    bool stepPermission =
        await health.hasPermissions([HealthDataType.STEPS]) ?? false;

    if (!stepPermission) {
      stepPermission = await health.requestAuthorization([
        HealthDataType.STEPS,
      ]);
      // TODO: handle error
    }

    if (stepPermission) {
      try {
        steps = await health.getTotalStepsInInterval(
          midnight,
          now,
          includeManualEntry:
              !recordingMethodsToFilter.contains(RecordingMethod.manual),
        );
        stepDto = stepDto.copyWith(count: steps ?? 10, date: midnight);
      } catch (error) {
        // TODO: handle error
      }
    }
    return stepDto;
  }
}
