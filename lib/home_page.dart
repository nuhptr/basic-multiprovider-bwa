import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:basic_multiprovider_flutter/height_provider.dart';
import 'package:basic_multiprovider_flutter/weight_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weight (kg)',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Consumer<WeightProvider>(
                builder: (context, weightProvider, _) => Slider(
                  min: 1,
                  max: 100,
                  divisions: 100,
                  label: weightProvider.weight.round().toString(),
                  value: weightProvider.weight,
                  onChanged: (newValue) {
                    newValue = newValue.roundToDouble();
                    print('Weight: $newValue');
                    weightProvider.weight = newValue;
                  },
                  inactiveColor: Colors.blue.withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Height (cm)',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Consumer<HeightProvider>(
                builder: (context, heightProvider, _) => Slider(
                  min: 1,
                  max: 200,
                  divisions: 100,
                  label: heightProvider.height.round().toString(),
                  value: heightProvider.height,
                  onChanged: (newValue) {
                    newValue = newValue.roundToDouble();
                    print('Weight: $newValue');
                    heightProvider.height = newValue;
                  },
                  activeColor: Colors.red,
                  inactiveColor: Colors.red.withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<WeightProvider>(
                builder: (BuildContext context, weightProvider, _) =>
                    Consumer<HeightProvider>(
                  builder: (BuildContext context, heightProvider, _) => Text(
                    // TODO: StringAsFixed digunakan untuk mengecilkan koma
                    'Your BMI:\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Kekurangan Bobot < 18.5'),
              SizedBox(
                height: 10,
              ),
              Text('Sehat 18.5 - 22.9'),
              SizedBox(
                height: 10,
              ),
              Text('Kelebihan Bobot 23 - 24.9'),
              SizedBox(
                height: 10,
              ),
              Text('Obesitas 1 25 - 29.9'),
              SizedBox(
                height: 10,
              ),
              Text('Obesitas 2 30 <')
            ],
          ),
        ),
      ),
    );
  }
}
