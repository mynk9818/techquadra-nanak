import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';

import '../../task2/view/task_2.dart';
import '../repo/account_create_repo.dart';

class ApiScreen extends StatelessWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                AccountRepo.createAccount().then(
                  (value) => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Api Call Done"),
                    ),
                  ),
                );
              },
              child: const Text("Task 1"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TaskTwo(),
                  ),
                );
              },
              child: const Text("Task 2"),
            ),
            ChuckerFlutter.chuckerButton
          ],
        ),
      ),
    );
  }
}
