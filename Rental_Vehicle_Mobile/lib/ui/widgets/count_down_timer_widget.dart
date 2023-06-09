import 'dart:async';

import 'package:flutter/material.dart';

import '/res/theme/text_theme.dart';
import '/utils/date_time_utils.dart';

class CountDownTimerWidget extends StatefulWidget {
  final int start;
  final int end;
  final ValueNotifier? reload;
  final TextStyle? textStyle;
  final Function? endCountDown;

  CountDownTimerWidget({required this.start, this.end = 0, this.reload, this.textStyle, this.endCountDown});

  @override
  State<StatefulWidget> createState() => _CountDownTimerWidgetState();
}

class _CountDownTimerWidgetState extends State<CountDownTimerWidget> {
  late Timer _timer;
  int _start = 0;

  @override
  void initState() {
    super.initState();
    _start = widget.start;
    widget.reload?.addListener(() {
      startTimer();
    });
    startTimer();
  }

  void startTimer() {
    _start = widget.start;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted)
          setState(
            () {
              if (_start == widget.end) {
                timer.cancel();
                if (widget.endCountDown != null) widget.endCountDown!();
              } else {
                _start = _start - 1;
              }
            },
          );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTimeOfDuration(_start),
      style: widget.textStyle ?? text14.textColorB2B2B2,
    );
  }
}
