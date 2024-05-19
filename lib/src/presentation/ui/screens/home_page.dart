//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import  FILES
import '../../../data/all_users.dart';
import '../../providers/listview_provider.dart';
//  //   ///

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page - ListView Filter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          const SizedBox(height: 20.0),
          TextField(
            onChanged: (value) =>
                ref.read(userNotifierProvider.notifier).filterUser(value),
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text('Search Results'),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: users.length, //AllUsers.length, //20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    // 'Name: ${AllUsers[index]['name']}',
                    'Name: ${users[index]['name']}',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    // 'Job: ${AllUsers[index]['job']}',
                    // '${AllUsers[index]['job']}',
                    '${users[index]['job']}',
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    // 'Country: ${AllUsers[index]['country']}',
                    'Country: ${users[index]['country']}',
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w500),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
