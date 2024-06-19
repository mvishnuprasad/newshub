import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newshub/models/newsapimodel.dart';

import 'apiservice.dart';

final userDataProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(userProvider).getNewsData();
});
