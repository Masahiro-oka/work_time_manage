import 'package:flutter/material.dart';

import '../work_date.dart';

@immutable
abstract class WorkDateFactoryBase {
  WorkDate create({required DateTime workDate});
}
