import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  PageController  Controller;
  NavBar({Key? key , required this.Controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primeColor = Theme.of(context).primaryColor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      color: primeColor,
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (){
              Controller.animateToPage(0, duration: const Duration(microseconds: 300),curve:Curves.easeInOut );
              },
              icon: Icon(
              Icons.currency_bitcoin, color: Colors.white,
              size: 25,
              ),
            ),
            IconButton(onPressed: (){
              Controller.animateToPage(1, duration: const Duration(microseconds: 300),curve:Curves.easeInOut );
            },
              icon: Icon(
                Icons.star,color: Colors.amberAccent,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
