// ignore_for_file: public_member_api_docs, avoid_field_initializers_in_const_classes
// ignore_for_file: member-ordering-extended

import 'package:flutter/material.dart';
import 'package:test_task/generated/l10n.dart';
import 'package:test_task/resourses/fonts.dart';

class ChangeAllButton extends StatelessWidget {
  const ChangeAllButton({
    super.key,
    required this.onPressed,
    required this.backgroundButton,
    required this.buttonText,
  });

  final void Function() onPressed;
  
  final Color backgroundButton;
  final Color buttonText;
  final double _fontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: backgroundButton,
      label: Text(
        S.of(context).changeAll,
        style: TextStyle(
          fontFamily: Fonts.fontFamily,
          fontWeight: Fonts.bold,
          fontSize: _fontSize,
          color: buttonText,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
