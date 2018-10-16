import 'package:flutter/material.dart';
import 'main.dart';

class Message extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  const Message({Key key, this.text, this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
      CurvedAnimation(parent: animationController, curve: Curves.bounceOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                child: Text(defaultUserName[0]),
              ),
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      defaultUserName,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      child: Text(text),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}