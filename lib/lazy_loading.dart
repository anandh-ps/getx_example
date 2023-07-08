import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  RxList<String> data = <String>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchData() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2));

    data.addAll(
        List<String>.generate(10, (index) => 'Item ${data.length + index}'));

    isLoading.value = false;
    update();
  }
}

class LazyLoadingPage extends StatelessWidget {
  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lazy Loading Example'),
        ),
        body: Center(
          child: GetBuilder<MyController>(
            builder: (controller) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.data.length + 1,
                itemBuilder: (context, index) {
                  if (index < controller.data.length) {
                    return ListTile(
                      title: Text(controller.data[index]),
                    );
                  } else {
                    // Call the fetchData method to load more data
                    controller.fetchData();
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
