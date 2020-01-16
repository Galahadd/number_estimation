import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
 
  final content;
  final VoidCallback callback;
  final actionText;
  final icon;

  CustomDialog(this.content, this.callback,this.actionText,this.icon);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title:  Icon(
                icon,
                size: 50.0,
                color: Colors.yellowAccent,
                ),
      content: SingleChildScrollView(
        child:  Column(
          children: <Widget>[

             
              Container(
                margin: EdgeInsets.only(top:10.0),
                child:Text(
                content
        
                ),)
            ],
          ),
        ),
      actions: <Widget>[
        new FlatButton(
          onPressed: callback,
          color: Colors.white,
          child: new Text(actionText),
        ),
      ],
    );
  }
}