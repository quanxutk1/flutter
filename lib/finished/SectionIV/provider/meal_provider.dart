import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/finished/SectionIV/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
