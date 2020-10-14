import 'package:eslesmeapp/data/user_repository.dart';
import 'package:eslesmeapp/widgets/appbar.dart';
import 'package:eslesmeapp/widgets/facebook_button.dart';
import 'package:eslesmeapp/widgets/google_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'gonderiSecimi.dart';

class Login extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  UserRepository userRepo;
  @override
  Widget build(BuildContext context) {
    userRepo = Provider.of<UserRepository>(context);

    return Scaffold(
      key: _scaffoldkey,
      appBar: appBarTasarim2(title: 'Login'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFacebookButton(),
            _buildGoogleButton(),
            _buildAnonymousButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFacebookButton() {
    return FacebookSignInButton(
      onPressed: () => {
        // widget?.onFacebookClick(),
      },
    );
  }

  Widget _buildGoogleButton() {
    return GoogleSignInButton(
      onPressed: () => {
        //  widget?.onGoogleClick(),
      },
    );
  }
  Widget _buildAnonymousButton() {
    return GoogleSignInButton(
      logoEnable: false,
      text: 'Anonim Giriş Yap',
      onPressed: () => {
        userRepo.signInAnonymous(),
        //  widget?.onGoogleClick(),
      },
    );
  }
}