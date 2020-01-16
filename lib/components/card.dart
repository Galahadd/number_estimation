import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.color, @required this.cardChild});

  final Color color;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
	return GestureDetector(
	  child: Container(
	    child: this.cardChild,
	    margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(15.0),
	    height: 150.0,
	    decoration: BoxDecoration(
	  	borderRadius: BorderRadius.circular(10.0),
	  	color: this.color,
	    ),
	  ),
	);
  }
}