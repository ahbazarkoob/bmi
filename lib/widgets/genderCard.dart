import 'package:flutter/material.dart';

import '../constants.dart';
import '../main.dart';

class genderCard extends StatelessWidget {
  IconData icon;
  String label;
  genderCard({
    required this.icon,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 80,),
        SizedBox(height: devH*0.02,),
        Text(label,style: klabelStyle),
      ],
    );
  }
}
