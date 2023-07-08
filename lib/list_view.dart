import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ListDataX extends GetxController {
  bool isLoading = false;
  List<int> numbers = List<int>.from([0, 1, 2, 3]);
  void httpCall() async {
    isLoading = true;
    update();
    await Future.delayed(
        Duration(seconds: 1), () => numbers.add(numbers.last + 1));
    isLoading = false;
    update();
  }

  void reset() {
    numbers = numbers.sublist(0, 3);
    update();
  }
}

class GetXListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListDataX dx = Get.put(ListDataX());
    print('Page ** rebuilt');
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GetBuilder<ListDataX>(
                builder: (_dx) => !_dx.isLoading
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _dx.numbers.length,
                        itemBuilder: (context, index) {
                          print('List ** rebuilt');
                          return Text(' ${_dx.numbers[index]}');
                        })
                    : LinearProgressIndicator()),
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
