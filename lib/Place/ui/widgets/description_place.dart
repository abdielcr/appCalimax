import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_app_calimax/Place/model/place.dart';
import 'package:flutter_app_calimax/User/bloc/bloc_user.dart';
import 'package:flutter_app_calimax/widgets/button_purple.dart';



class DescriptionPlace extends StatelessWidget {

  String namePlace;
  int stars;
  String descriptionPlace
  ;
  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final star_half = Container (
      margin: EdgeInsets.only(
          top: 353.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        color:  Color(0xFFf2C611),
      ),
    );

    final star_border = Container (
      margin: EdgeInsets.only(
          top: 353.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        color:  Color(0xFFf2C611),
      ),
    );

    final star = Container (
      margin: EdgeInsets.only(
        top: 353.0,
        right: 3.0
      ),

      child: Icon(
        Icons.star,
        color:  Color(0xFFFF0000),
      ),
    );



    return StreamBuilder<Place>(
      stream: userBloc.placeSelectedStream,
      builder: (BuildContext context, AsyncSnapshot<Place> snapshot){
        if (snapshot.hasData) {
          print("PLACE SELECTED: ${snapshot.data.name}");
          Place place = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleStars(place),
              descriptionWidget(place.description),
            ],
          );
        }else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container (
                margin: EdgeInsets.only(
                    top: 400.0,
                    left: 20.0,
                    right: 20.0
                ),

                child: Text(
                  "Noticias",
                  style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900
                  ),
                  textAlign: TextAlign.left,
                ),

              )

            ],
          );
        }
      },
    );

  }

  Widget titleStars(Place place){
    return Row (
      children: <Widget>[
        Container (
          margin: EdgeInsets.only(
              top: 350.0,
              left: 20.0,
              right: 20.0
          ),

          child: Text(
            place.name,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),

        ),
        Container (
          margin: EdgeInsets.only(
              top: 370.0,
          ),

          child: Text(
            "Megusta: ${place.likes}",
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.red
            ),
            textAlign: TextAlign.left,
          ),

        ),

      ],
    );
  }

  Widget descriptionWidget(String descriptionPlace){
    return Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        descriptionPlace,        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );
  }

}