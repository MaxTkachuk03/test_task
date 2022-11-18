// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_task/generated/l10n.dart';
import 'package:test_task/resourses/fonts.dart';
import 'package:test_task/widgets/buttons/change_all_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _background = Colors.red;
  Color _buttonText = Colors.amber;
  Color _backgroundButton = Colors.transparent;
  Color _mainText = Colors.cyanAccent;
  final double fontSize = 18.0;
  final int col = 0xFFFFFF;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void changeColor() {
    setState(
      () {
        _background =
            Color((Random().nextDouble() * col).toInt()).withOpacity(1.0);
      },
    );
  }

  void changeAllColors() {
    setState(
      () {
        _background =
            Color((Random().nextDouble() * col).toInt()).withOpacity(1.0);
        _buttonText =
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
        _backgroundButton =
            Color((Random().nextDouble() * col).toInt()).withOpacity(1.0);
        _mainText = Colors.primaries[Random().nextInt(Colors.primaries.length)];

        if (_background == _backgroundButton ||
            _buttonText == _backgroundButton ||
            _mainText == _backgroundButton) {
          _backgroundButton = Color((Random().nextDouble() * col).toInt())
              .withOpacity(1.0);
          if (_buttonText == _mainText || _background == _mainText) {
            _mainText =
                Colors.primaries[Random().nextInt(Colors.primaries.length)];
            if (_background == _buttonText) {
              _buttonText =
                  Colors.primaries[Random().nextInt(Colors.primaries.length)];
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => changeColor(),
      child: Scaffold(
        backgroundColor: _background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 6,
            ),
            Text(
              S.of(context).mainText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _mainText,
                fontFamily: Fonts.fontFamily,
                fontWeight: Fonts.bold,
                fontSize: fontSize,
              ),
            ),
            const Spacer(
              flex: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ChangeAllButton(
                  onPressed: () {
                    setState(
                      () {
                        changeAllColors();
                      },
                    );
                  },
                  backgroundButton: _backgroundButton,
                  buttonText: _buttonText,
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
