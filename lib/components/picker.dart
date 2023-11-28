import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Picker extends StatelessWidget {
  Function? callback;
  Picker({this.callback});

  final List<String> _fruitNames = <String>[
    '37 (내임선 - 황전면행정복지센터)',
    '38 (내임선 - 황전면행정복지센터)',
    '39 (내임선 - 황전면행정복지센터)',
    '40 (내임선 - 황전면행정복지센터)',
    '41 (내임선 - 황전면행정복지센터)',
    '42 (내임선 - 황전면행정복지센터)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        const Expanded(
            flex: 2,
            child: Center(
                child: DefaultTextStyle(
              style: TextStyle(
                  color: Color(0xff090A0B),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              child: Text('버스'),
            ))),
        const Divider(
          color: Colors.black12,
        ),
        Expanded(
          flex: 8,
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            itemExtent: 28,
            scrollController: FixedExtentScrollController(initialItem: 3),
            children: List.generate(
                _fruitNames.length,
                (index) => Text(
                      _fruitNames[index],
                      style: Theme.of(context).textTheme.labelLarge,
                    )).toList(),
            onSelectedItemChanged: (int value) {
              callback!(_fruitNames[value]);
            },
          ),
        )
      ]),
    );
  }
}

// Vehicle myVehicle = Vehicle();

// class Vehicle {
//   // void moveForward(int meters) {
//   //   // ...
//   // }

//   set contact(int value) {}

//   static hello() {}
// }

// class Car extends Vehicle {
//   @override
//   set contact(num value ) {}

//   // int pada = 4;
//   // void moveForward(int value) {}
// }
