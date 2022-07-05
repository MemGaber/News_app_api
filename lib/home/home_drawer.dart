import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  static const int CATEGORIES = 1;
  Function onSideMenuItemCallBack;
  HomeDrawer(this.onSideMenuItemCallBack);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 64,
          ),
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: const Center(
              child: Text(
            'News App',
            style: TextStyle(color: Colors.white, fontSize: 32,fontWeight: FontWeight.bold),
          )),
        ),
        InkWell(
            onTap: () {
              onSideMenuItemCallBack(CATEGORIES);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Icon(Icons.list),
                  Text('Categories', style: TextStyle(fontSize: 24)),
                ],
              ),
            )),
      ],
    );
  }
}
