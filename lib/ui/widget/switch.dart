import 'package:flutter/material.dart';


class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isSwitch = !isSwitch);
        // widget.onToggled(isSwitch);
      },
      onPanEnd: (b) {
        setState(() => isSwitch = !isSwitch);
        // widget.onToggled(isSwitch);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve:  Curves.decelerate,
        width: 50,
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(50),
          color: isSwitch ? const Color(0xff000000) : const Color(0xffeeeeee)
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: isSwitch ? Alignment.centerRight : Alignment.centerLeft,
          curve: Curves.decelerate,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
