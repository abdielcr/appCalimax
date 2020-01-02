import 'package:flutter/material.dart';

class Review extends StatelessWidget {

  String pathImage = "assets/img/calimax.jpg";
  String name = "Calimax Noticia1";
  String details = "1 review · 5 photos";
  String comment = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

  Review(this.pathImage, this.name, this.details, this.comment);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final userComment = Container(
      margin: EdgeInsets.only(
          left: 20.0
      ),

      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            fontWeight: FontWeight.w900
        ),

      ),

    );

    final userInfo = Container(
      margin: EdgeInsets.only(
        left: 20.0
    ),

      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
          color: Color(0xFFa3a5a7)
        ),

      ),

    );

    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),

      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
            fontSize: 17.0
        ),

      ),

    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        userInfo,
        userComment

      ],
    );

    final photo = Container (
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
      ),

      width: 80.0,
      height: 80.0,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(pathImage)
        )
      ),

    );

    return Row (
      children: <Widget>[
        photo,
        userDetails

      ],
    );

  }

}