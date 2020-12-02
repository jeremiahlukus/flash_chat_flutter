import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  CardComponent(
      {this.title, this.color, this.screenId, this.imagePath, this.scale});

  final Color color;
  final String title;
  final String screenId;
  final String imagePath;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CupertinoButton(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            image: DecorationImage(
              alignment: FractionalOffset.bottomRight,
              scale: scale,
              image: AssetImage(imagePath),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, screenId);
        },
      ),
    );
  }
}
