import 'package:flutter/material.dart';
import 'package:flutter_app_calimax/User/model/user.dart';
import 'package:flutter_app_calimax/widgets/gradient_back.dart';
import 'package:flutter_app_calimax/widgets/button_green.dart';
import 'package:flutter_app_calimax/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_calimax/platzi_trips_cupertino.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInScreen extends StatefulWidget {

  @override
  State createState() {
    return _SignInScreen();
  }
}


class _SignInScreen extends State<SignInScreen> {

  UserBloc userBloc;
  double screenWidht;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }
 /* final photo = Container (
    margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0
    ),

    width: 300.0,
    height: 300.0,

    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/calimaxLogo.jpg')
        )
    ),

  );
*/
  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if(!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );

  }


  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(

        //   <--- image he
        alignment: Alignment.center,
        children: <Widget>[

          GradientBack(height: null),
          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/img/calimaxLogos.png'),
              Center(

                child: Container(

                  padding: EdgeInsets.all(19.0),//Entre boton y Bienvenida...
                  child: Text("Bienvenido Calimax",
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold


                    ),
                  ),
                ),
              ),


              /*ButtonGreen(text: "Inicia con Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((FirebaseUser user) {
                    userBloc.updateUserData(User(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoURL: user.photoUrl

                    ));
                  });

                },
                width: 300.0,
                height: 50.0,
              )*/
              SignInButton(
                Buttons.Google,
                text: "Inicia con Google",
                onPressed: () { userBloc.signOut();
    userBloc.signIn().then((FirebaseUser user) {
    userBloc.updateUserData(User(
    uid: user.uid,
    name: user.displayName,
    email: user.email,
    photoURL: user.photoUrl

    ));
    });

    },

              )
            ],
          )
        ],
      ),
    );
  }


}