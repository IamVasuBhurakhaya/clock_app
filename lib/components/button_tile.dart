import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ButtonTile({required title, required Widget child}) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title Button",
          style: TextStyle(fontSize: 16, color: Colors.purple),
        ),
        child,
      ],
    ),
  );
}
