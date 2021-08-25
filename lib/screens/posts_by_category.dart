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
  String search = '';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onSaved: (value) {
                  setState(() {
                    search = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    search = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for articles',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Releated Posts',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      FetchData().fetchPosts(search);
                    });
                  },
                  child: StreamBuilder(
                    stream: FetchData()
                        .fetchPostsByCategory(widget.category.id, search),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Post>> snapshot) {
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
            ],
          ),
        ));
  }

  postsList(Post post) {
    return PostCellWidget(
      post: post,
    );
  }
}
