import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/schemas/post.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  PostDetailsPage({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.open_in_browser,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    launch(post.link);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  icon: Icon(
                    Icons.share_outlined,
                    size: 20,
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    Share.share(post.link, subject: post.title.rendered);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: ListView(
            children: [
              Text(
                post.title.rendered,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                          imageUrl: post.author.avatarUrls.s96),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('${post.author.name},  '),
                  Text(
                    '${post.date.split('T').first} at ${post.date.split('T').last}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              post.categories == null
                  ? Container()
                  : Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 4,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                color: Colors.purple,
                                child: Text(
                                  '${post.categories.first.name}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: post.featuredMedia.link == null
                      ? Icon(Icons.image)
                      : CachedNetworkImage(
                          imageUrl: post.featuredMedia.link,
                          placeholder: (context, string) {
                            return Icon(Icons.image);
                          },
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Html(
                  data: post.content.rendered,
                  onLinkTap: (String url) {
                    launch(url);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
