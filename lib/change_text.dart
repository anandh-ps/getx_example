import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChangeTextValue extends StatelessWidget {
  ChangeTextValue({super.key});
  RxInt count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: _decrement,
          child: Text('-'),
        ),
        Obx(() => Text(count.toString())),
        ElevatedButton(
          onPressed: _increment,
          child: Text('+'),
        ),
      ],
    );
  }

  void _increment() {
    count.value++;
  }

  void _decrement() {
    count.value--;
  }
}
