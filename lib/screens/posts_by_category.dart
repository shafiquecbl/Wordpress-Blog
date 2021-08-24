import 'package:flutter/material.dart';
import 'package:flutter_wordpress/schemas/category.dart';
import 'package:flutter_wordpress/schemas/post.dart';
import 'package:wordpress_blog/Fetch%20Data/fetchData.dart';
import 'package:wordpress_blog/widgets/post_cell_widget.dart';

class PostsByCategory extends StatefulWidget {
  final Category category;
  PostsByCategory({@required this.category});
  @override
  _PostsByCategoryState createState() => _PostsByCategoryState();
}

class _PostsByCategoryState extends State<PostsByCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData.fallback(),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.category.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              FetchData().fetchPostsByCategory(widget.category.id);
            });
          },
          child: StreamBuilder(
            stream: FetchData().fetchPostsByCategory(widget.category.id),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Loading...')
                  ],
                ));
              if (snapshot.data.length == 0)
                return Center(
                  child: Text('No Posts available'),
                );
              return ListView.separated(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Post post = snapshot.data[index];
                  return postsList(post);
                },
                separatorBuilder: (context, index) => Divider(),
              );
            },
          ),
        ),
      ),
    );
  }

  postsList(Post post) {
    return PostCellWidget(
      post: post,
    );
  }
}
