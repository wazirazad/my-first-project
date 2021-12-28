import 'package:flutter/material.dart';
class HomeItemWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const HomeItemWidget({
    this.iconData,
    this.title,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this is extract widgets instead of 6 children like below
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              iconData,
              size: 80,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}