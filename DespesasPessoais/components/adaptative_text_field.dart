import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) onSubmited;
  final String label;

  AdaptativeTextField({
    this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onSubmited,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CupertinoTextField(
              placeholder: label,
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: (_) => onSubmited,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
        )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: (_) => onSubmited,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
