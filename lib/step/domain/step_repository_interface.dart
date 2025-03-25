import 'package:pedometer/step/domain/step.dart';

abstract class StepRepositoryInterface {
  Future<Step> getStep();
}
