import 'package:flutter/material.dart';
import 'package:flutter_app_calimax/User/model/user.dart';

class Pregunta {
  final String uid;
  final String name;
  final String pregunta;



  Pregunta({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.pregunta,

  });

}