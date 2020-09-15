class Post {
  final String name;
  final String postBody;

  Post(
    this.name,
    this.postBody,
  );

  @override
  String toString() {
    return 'Post{name: $name, date: $postBody}';
  }
}
