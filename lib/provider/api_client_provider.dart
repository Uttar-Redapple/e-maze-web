

import 'package:dio/dio.dart';
import 'package:emaze_brain/client/client.dart';


import 'package:riverpod/riverpod.dart';

final apiClientProvider = Provider<APIClient>(
      (ref) => APIClient(
    Dio(
      BaseOptions(contentType: "application/json"),
    ),
  ),
);