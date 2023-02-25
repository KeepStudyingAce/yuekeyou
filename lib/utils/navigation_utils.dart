import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:yuekeyouinterview/routers/application.dart';

class NavigatorUtil {
  static push(
    BuildContext context,
    String path, {
    Map<String, dynamic>? params,
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.native,
  }) {
    FocusScope.of(context).unfocus();
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key] ?? '');
        if (index == 0) {
          path += '?';
        } else {
          path += '&';
        }
        path += "$key=$value";
        index++;
      }
    }
    Application.router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
    );
  }

  static void pop(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }
}
