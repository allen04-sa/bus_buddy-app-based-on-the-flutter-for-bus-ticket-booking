import 'package:bus_buddy/loginpage.dart';
import 'package:bus_buddy/superbase/superbase_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Page extends StatefulWidget {
  const Page({required Key key}) : super(key: key);
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  Future<void> signOut() async {
    var supabase;
    await Supabase.instance.client.auth.signOut();
    if (!mounted) return;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Loginpage()));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Container(
      child: Center(
        child: Text('Page Content'),
      ),
    );
  }
}
