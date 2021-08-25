import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:wordpress_blog/constants.dart';

class FetchData {
  wp.WordPress wordPress = wp.WordPress(
    baseUrl: websiteUrl,
  );

  fetchPosts(String query) {
    Stream<List<wp.Post>> posts = wordPress
        .fetchPosts(
          postParams: wp.ParamsPostList(
              context: wp.WordPressContext.view,
              pageNum: 1,
              perPage: 15,
              searchQuery: query),
          fetchCategories: true,
          fetchAuthor: true,
          fetchFeaturedMedia: true,
          fetchAttachments: true,
          fetchComments: true,
        )
        .asStream();

    return posts;
  }

  fetchPostsByCategory(int category, String search) {
    Stream<List<wp.Post>> posts = wordPress
        .fetchPosts(
          postParams: wp.ParamsPostList(
              context: wp.WordPressContext.view,
              pageNum: 1,
              perPage: 50,
              searchQuery: search,
              includeCategories: [category]),
          fetchCategories: true,
          fetchAuthor: true,
          fetchFeaturedMedia: true,
          fetchAttachments: true,
          fetchComments: true,
        )
        .asStream();

    return posts;
  }

  fetchCategories() {
    Stream<List<wp.Category>> categories =
        wordPress.fetchCategories(params: wp.ParamsCategoryList()).asStream();
    return categories;
  }
}
