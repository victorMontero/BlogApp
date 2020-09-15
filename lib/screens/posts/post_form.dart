import 'package:flutter/material.dart';
import 'package:hello_flutter/components/editor.dart';
import 'package:hello_flutter/models/post.dart';

const _appBarTitle = 'new post';

const _hintNameField = 'first name';
const _labelNameField = 'what is your name?';

const _hintPostBodyField = 'your post goes here';
const _labelPostBodyField = 'what are you thinking? : )';

const _textButtonPost = 'post';

class PostForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostFormState();
  }
}

class PostFormState extends State<PostForm> {
  final TextEditingController _controllerFieldName = TextEditingController();
  final TextEditingController _controllerFieldPostBody =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _controllerFieldName,
              hint: _hintNameField,
              label: _labelNameField,
            ),
            Editor(
              controller: _controllerFieldPostBody,
              hint: _hintPostBodyField,
              label: _labelPostBodyField,
            ),
            RaisedButton(
              child: Text(_textButtonPost),
              onPressed: () => _createsPost(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createsPost(BuildContext context) {
    final String postOwner = _controllerFieldName.text;
    final String postBody = _controllerFieldPostBody.text;

    if (postOwner != null && postBody != null) {
      final createdPost = Post(
        postOwner,
        postBody,
      );
      Navigator.pop(context, createdPost);
    }
  }
}
