import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Alert_Dialog{

  alertDialogBox(context,int score){
    String displayWord;
    AlertType displayIcon;
    if(score >= 7){
      displayWord = 'CONGRATULATIONS!';
      displayIcon = AlertType.success ;
    }else{
      displayWord = 'FAILED!';
      displayIcon = AlertType.error ;
    }

    Alert(
      context: context,
      type: displayIcon,
      title: displayWord,
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