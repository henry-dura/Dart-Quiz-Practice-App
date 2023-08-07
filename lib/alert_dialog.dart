import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Alert_Dialog{

  alertDialogBox(context,int score){
    Alert(
      context: context,
      type: score >= 7? AlertType.success:AlertType.error,
      title: score >= 7?'CONGRATULATIONS!':'FAILED!',
      desc: "DART KNOWLEDGE: ${(score/10)*100} %",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
  }