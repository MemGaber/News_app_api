import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget(this.category,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(category.colorCode),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomRight: Radius.circular(
              (index%2==0)? 0: 12,),
          bottomLeft: Radius.circular(
              (index%2==0)? 12: 0),
        )
      ),
      child: Column(
        children: [
          Image.asset(category.image,
          height: 140,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Center(
              child: Text(category.title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }
}
