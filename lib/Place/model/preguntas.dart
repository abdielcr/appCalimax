import 'package:flutter/material.dart';
import 'package:flutter_app_calimax/User/model/user.dart';

class Preguntas {

  String id;
  String name;
  String pregunta;
  //String urlImage;
  int likes;
  bool liked;
  //User userOwner;

  Preguntas({
    Key key,
    @required this.name,
    @required this.pregunta,
    //@required this.urlImage,
    @required this.likes,
    this.liked,
    this.id
    //@required this.userOwner
  });
}