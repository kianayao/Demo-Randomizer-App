import 'package:flutter/material.dart';
import 'package:cs4750_final_project/main.dart';
import 'package:cs4750_final_project/random_num.dart';
import 'package:cs4750_final_project/random_custom.dart';
import 'dart:math';
import 'package:page_transition/page_transition.dart';


class pers_page extends StatefulWidget {
  const pers_page({super.key, required this.title});
  final String title;

  @override
  State<pers_page> createState() => _my_pers_page_state();
}

class _my_pers_page_state extends State<pers_page> {
  int selected_index = 2;
  void _onItemTapped(int index) {
    setState(() {
      selected_index = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        PageTransition(type: PageTransitionType.leftToRight, child: num_gen_page(
            title: 'Number Generator')),
      );
    }
    else if (index == 1) {
      Navigator.push(
        context,
        PageTransition(type: PageTransitionType.leftToRight, child: cust_gen_page(
            title: 'Custom Generator')),
      );
    }
  }

  String dropdownvalue = 'blueGrey';

  var items = [
    'blue',
    'green',
    'pink',
    'purple',
    'blueGrey',
  ];

  void change_theme() {
    if (dropdownvalue == items[4])
      theme_c = Colors.blueGrey;
    else if (dropdownvalue == items[0])
      theme_c = Colors.blue;
    else if (dropdownvalue == items[1])
      theme_c = Colors.green;
    else if (dropdownvalue == items[2])
      theme_c = Colors.pink;
    else if (dropdownvalue == items[3])
      theme_c = Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalization'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text('Theme Color', style: TextStyle(fontSize: 20),),
              ),
              DropdownButton(

                // Initial Value
                value: dropdownvalue,
                alignment: Alignment.center,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down), iconSize: 15,

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                  change_theme();
                },
              ),

              Text('After changing the theme color, please restart the app.',
                   style: TextStyle(color: Colors.pink[200]),)
            ]
      ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.numbers_rounded),
              label: 'numbers'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular_rounded),
            label: 'custom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens_outlined),
            label: 'personalization',
          ),
        ],
        currentIndex: selected_index,
        selectedItemColor: Colors.pink[200],
        onTap: _onItemTapped,
      ),
    );
  }
}



