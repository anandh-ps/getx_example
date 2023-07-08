import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ListDataXObx {
  RxList<int> numbers = List<int>.from([0, 1, 2, 3]).obs;
  RxBool loading = false.obs;
  void httpCall() async {
    loading.value = true;
    await Future.delayed(
        Duration(seconds: 1), () => numbers.add(numbers.last + 1));
    loading.value = false;
  }

  void reset() {
    numbers.value = numbers.sublist(0, 3);
  }
}

class GetXListViewObx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListDataXObx dx = Get.put(ListDataXObx());
    print('Page ** rebuilt');
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(() {
              return !dx.loading.value
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dx.numbers.length,
                      itemBuilder: (context, index) {
                        print('List ** rebuilt');
                        return Text(' ${dx.numbers[index]}');
                      })
                  : CircularProgressIndicator();
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('Http Request'),
                onPressed: dx.httpCall,
              ),
              ElevatedButton(
                child: Text('Reset'),
                onPressed: dx.reset,
              )
            ],
          )
        ],
      ),
    );
  }
}
