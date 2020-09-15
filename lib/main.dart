import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/posts/post_list.dart';

void main() => runApp(BlogApp());

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple[200],
        accentColor: Colors.deepOrange[100],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepOrange[100],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: PostList(),
    );
  }
}
