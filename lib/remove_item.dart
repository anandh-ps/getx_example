import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ListDataItems extends GetxController {
  bool isLoading = false;
  List<int> numbers = List<int>.from([0, 1, 2, 3]);

  void removeItem(int index) {
    numbers.removeAt(index);
    update(['list']);
  }

  Future<void> add() async {
    await Future.delayed(
        Duration(seconds: 0), () => numbers.add(numbers.last + 1));
    update(['list']);
  }
}

class ListDataRemoveAnItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListDataItems dx = Get.put(ListDataItems());
    print('Page ** rebuilt');
    return Container(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GetBuilder<ListDataItems>(
                id: 'list',
                builder: (_dx) => !_dx.isLoading
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _dx.numbers.length,
                        itemBuilder: (context, index) {
                          print('List ** rebuilt');
                          return Container(
                            margin: EdgeInsets.all(2),
                            child: ElevatedButton(
                              child: Text(' ${_dx.numbers[index]}'),
                              onPressed: () => dx.removeItem(index),
                            ),
                          );
                        })
                    : LinearProgressIndicator()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: null,
                child: Text('Click any number to delete'),
              ),
              ElevatedButton(
                child: Text('Add'),
                onPressed: dx.add,
              )
            ],
          )
        ],
      ),
    );
  }
}
