
import 'package:flutter/material.dart';

import '../main.dart';

class ReusableCard extends StatefulWidget {
  Color colour;
  Widget cardChild;
  Function onpress;
  ReusableCard({required this.onpress,required this.colour, required this.cardChild});

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onpress();
      },
      child: Container(
          margin: EdgeInsets.all(devW*0.01),
          decoration: BoxDecoration(
              color: widget.colour,
              borderRadius: BorderRadius.circular(10)),
          height: devH*0.24,
          width: devW*0.4,
          child: widget.cardChild
      ),
    );
  }
}