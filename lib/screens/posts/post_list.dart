import 'package:flutter/material.dart';
import 'package:hello_flutter/models/post.dart';
import 'package:hello_flutter/screens/posts/post_form.dart';

const _appBarTitle = 'posts';

class PostList extends StatefulWidget {
  final List<Post> _postList = List();

  @override
  State<StatefulWidget> createState() {
    return PostListState();
  }
}

class PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._postList.length,
        itemBuilder: (context, position) {
          final post = widget._postList[position];
          return PostItem(post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PostForm();
          })).then((receivedPost) => _update(receivedPost));
        },
      ),
    );
  }

  void _update(Post receivedPost) {
    if (receivedPost != null) {
      setState(() {
        widget._postList.add(receivedPost);
      });
    }
  }
}

class PostItem extends StatelessWidget {
  final Post _post;

  const PostItem(this._post);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.account_circle),
      title: Text(_post.name.toString()),
      subtitle: Text(_post.postBody.toString()),
    ));
  }
}
