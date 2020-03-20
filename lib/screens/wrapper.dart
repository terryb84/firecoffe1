import 'package:firecoffe/models/user.dart';
import 'package:firecoffe/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);
    // return either Home or Authenticate widget
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }//if
  }
}
