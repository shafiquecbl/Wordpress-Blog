import 'package:flutter/material.dart';
import 'package:flutter_wordpress/schemas/category.dart';
import 'package:wordpress_blog/Fetch%20Data/fetchData.dart';
import 'package:wordpress_blog/widgets/category_cell.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Categories',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
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
                  FetchData().fetchCategories();
                });
              },
              child: StreamBuilder(
                stream: FetchData().fetchCategories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Category>> snapshot) {
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
                  return GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 1.5),
                    itemBuilder: (BuildContext context, int index) {
                      Category category = snapshot.data[index];
                      return CategoryCell(category: category);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
