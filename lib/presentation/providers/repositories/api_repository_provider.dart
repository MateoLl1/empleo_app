
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:empleo_app/infrastructure/infrastructure.dart';

final apiRepositoryProvider = Provider((ref) {
  return ApiRepositoryImpl(
    datasource: ApiJavaDatasource()
  );
});