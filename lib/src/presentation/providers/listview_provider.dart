//  //   ///
//  Import LIBRARIES
import 'package:riverpod_annotation/riverpod_annotation.dart';
//  Import  FILES
import '../../data/all_users.dart';
//  PARTS
part 'listview_provider.g.dart';
//  //   ///

//  userNotifierProvider
@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  List<Map<String, String>> build() {
    return AllUsers;
  }

  void filterUser(String userName) {
    if (userName.isEmpty) {
      state = AllUsers;
      return;
    }
    state = AllUsers.where((user) =>
        user['name']!.toLowerCase().contains(userName.toLowerCase())).toList();
  }
}
