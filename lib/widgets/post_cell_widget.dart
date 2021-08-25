import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wordpress/schemas/post.dart';
import 'package:wordpress_blog/constants.dart';
import 'package:wordpress_blog/screens/post_details_page.dart';

class PostCellWidget extends StatelessWidget {
  final Post post;
  PostCellWidget({@required this.post});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => PostDetailsPage(post: post),
          ),
        );
      },
      child: Container(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: greyColor,
                width: 120,
                height: 75,
                child: post.featuredMedia == null
                    ? Icon(Icons.image)
                    : CachedNetworkImage(
                        imageUrl:
                            '${baseUrl + post.featuredMedia.mediaDetails.file}',
                        fit: BoxFit.cover,
                        placeholder: (context, string) {
                          return Icon(Icons.image);
                        },
                        errorWidget: (context, string, dynamic) {
                          return Icon(Icons.image);
                        },
                      ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title.rendered,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width / 3.8,
                            ),
                            height: 28,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            color: Colors.purple,
                            child: Text(
                              '${post.categories.first.name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        // Spacer(),
                        Text(
                          '${post.date.split('T').first} at ${post.date.split('T').last}',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getLink(String str) {
    if (str != null && str.length > 0) {
      str = str.substring(0, str.length - 1);
      str = str + '.png';
    }
    return str;
  }
}
