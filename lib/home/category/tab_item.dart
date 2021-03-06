import 'package:flutter/material.dart';
import 'package:news_app/model/sources_response.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;

  TabItem(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
            color:
                isSelected ? Theme.of(context).primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).primaryColor)),
        child: Text(
          source.name ?? "",
          style: TextStyle(
              color: isSelected ? Colors.white : Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
