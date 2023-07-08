import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_text_change/remove_item.dart';
import 'change_text.dart';
import 'lazy_loading.dart';
import 'list_view.dart';
import 'list_view_obx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Change text using GetX\n"),
            ChangeTextValue(),
            Divider(thickness: 2),
            Text("Refresh List using GetX - update() \n"),
            GetXListView(),
            Divider(thickness: 2),
            Text("Refresh List using GetX - Obx\n"),
            GetXListViewObx(),
            Divider(thickness: 2),
            Text("Remove item from list without list refresh\n"),
            ListDataRemoveAnItem(),
            Divider(thickness: 2),
            Text("Lazy loading in Getx"),
            ElevatedButton(
              onPressed: () {
                Get.to(LazyLoadingPage());
              },
              child: Text('Go to Lazy Loading'),
            ),
            Divider(thickness: 2),
          ],
        ),
      ),
    ));
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Text('adf'),
        ),
        Expanded(
          child: Text('adf'),
        ),
      ],
    );
  }
}
