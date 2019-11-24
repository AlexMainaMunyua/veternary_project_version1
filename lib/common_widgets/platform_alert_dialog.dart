
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veternary_project_version1/common_widgets/platform_widget.dart';
import 'package:veternary_project_version1/constants/keys.dart';

class PlatformAlertDialog extends PlatformWidget{
  PlatformAlertDialog({
@required this.title,
@required this.content,
this.cancelActionText,
@required this.defaultActionText,
  }): assert(title != null),
  assert(content!= null),
  assert(defaultActionText != null);

  final String title;
  final String content;
  final String cancelActionText;
  final String defaultActionText;
  Future<bool> show(BuildContext context) async{
    return Platform.isIOS
    ? await showCupertinoDialog<bool>(
      context: context,
      builder: (_)=> this

    ): await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_)=> this
    );
  }
  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
          );
        }
      
      List<Widget>  _buildActions(context) {
          final List<Widget> actions = <Widget>[];
          if(cancelActionText != null){
            actions.add(
              PlatformAlertDialogAction(
                              child: Text(
                                cancelActionText,
                                key: Key(Keys.alertCancel),
                              ),
                              onPressed: () => Navigator.of(context).pop(true),
              
                            ),
                          );
                          return actions;
                        }
                      }
                
              }
              
              class PlatformAlertDialogAction extends PlatformWidget{
                PlatformAlertDialogAction({this.child, this.onPressed});
              
              final Widget child;
              final VoidCallback onPressed;
  @override
  Widget buildCupertinoWidget(_) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(_) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }
}