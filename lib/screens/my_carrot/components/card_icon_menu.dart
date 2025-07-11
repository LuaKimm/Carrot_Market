import 'package:carrot_market/models/icon_menu.dart';
import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardIconMenu extends StatelessWidget {
  final List<IconMenu> iconMenuList;

  CardIconMenu({required this.iconMenuList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: List.generate(
            iconMenuList.length,
                (index) => _buildRowIconItem(
              iconMenuList[index].title,
              iconMenuList[index].iconData,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowIconItem(String title, IconData iconData) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Icon(iconData, size: 17),
          const SizedBox(width: 20),
          Text(title, style: textTheme().bodyMedium),
        ],
      ),
    );
  }
}
