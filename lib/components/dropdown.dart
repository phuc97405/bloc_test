import 'package:flutter/material.dart';

const List<String> list = <String>[
  '예',
  '아니요',
];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    print(this.mounted);
    double widthScreen = MediaQuery.of(context).size.width;

    return DropdownMenu<String>(
      // initialSelection: list.first,
      width: (widthScreen - 48) * (2 / 3),
      hintText: '예',
      textStyle: const TextStyle(
        color: Color(0xff090A0B),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      // requestFocusOnTap: true,
      menuStyle: const MenuStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          elevation: MaterialStatePropertyAll(5),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
          style: MenuItemButton.styleFrom(foregroundColor: Colors.red),
          //  const ButtonStyle(
          //   textStyle: MaterialStatePropertyAll(TextStyle(
          //     fontSize: 12,
          //     fontWeight: FontWeight.w400,
          //   )),
          // )
          // backgroundColor: MaterialStatePropertyAll<Color>(Colors.red))
        );
      }).toList(),
    );
  }
}
