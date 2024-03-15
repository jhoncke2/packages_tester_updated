// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
class WidgetsPackagesPage extends StatelessWidget {
  final _animals = <_Animal>[
    _Animal('d', 'Dog', false),
    _Animal('ca', 'Cat', true),
    _Animal('cr', 'Crocodile', false),
    _Animal('t', 'Turtle', false)
  ];
  final carouselController = CarouselController();
  WidgetsPackagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight * 0.9,
          child: ListView(
            children: [
              Text(
                'Widgets Packages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02
              ),
              SizedBox(
                width: screenWidth * 0.5,
                child: MultiSelectDialogField(
                  items: _animals.map<MultiSelectItem<String>>(
                    (animal) => MultiSelectItem<String>(
                      animal.value,
                      animal.name
                    )
                  ).toList(),
                  onConfirm: (selectedValues){
                    for(int i = 0; i < _animals.length; i++){
                      final animal = _animals[i];
                      if(
                        (selectedValues.contains(animal.value) && !animal.selected)
                        || (!selectedValues.contains(animal.value) && animal.selected)
                      ){
                        _animals[i] = _Animal(
                          animal.value,
                          animal.name,
                          !animal.selected
                        );
                      }
                    }
                    print(_animals.map(
                      (a) => a.selected
                    ).toList());
                  }
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02
              ),
              CarouselSlider(
                carouselController: carouselController,
                items: _animals.map<Widget>(
                  (item) => Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent
                    ),
                    child: Center(
                      child: Text(
                        item.name
                      ),
                    )
                  )
                ).toList(),
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  viewportFraction: 0.6
                )
              )
            ]
          )
        )
      )
    );
  }
}

class _Animal{
  final String value;
  final String name;
  final bool selected;
  const _Animal(this.value, this.name, this.selected);
}