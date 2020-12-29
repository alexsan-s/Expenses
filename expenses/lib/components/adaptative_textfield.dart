import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final Function(String) fn;
  final TextEditingController text;
  final bool keyBoardType;

  AdaptativeTextField({
    this.label,
    this.fn,
    this.text,
    this.keyBoardType = false,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CupertinoTextField(
              placeholder: label,
              onSubmitted: fn,
              keyboardType: keyBoardType
                  ? TextInputType.text
                  : TextInputType.numberWithOptions(decimal: true),
              controller: text,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            onSubmitted: fn,
            keyboardType: keyBoardType
                ? TextInputType.text
                : TextInputType.numberWithOptions(decimal: true),
            controller: text);
  }
}
