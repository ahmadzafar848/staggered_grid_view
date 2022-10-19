import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return QuiltedWidget();
  }
}

//masonry style
class MasonryWidget extends StatelessWidget {
  const MasonryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      itemCount: 10,
      gridDelegate:
          SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network('https://source.unsplash.com/random?sig=$index'),
        );
      },
    );
  }
}

//aligned style
class AlignedWidget extends StatelessWidget {
  const AlignedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      itemCount: 10,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network('https://source.unsplash.com/random?sig=$index'),
        );
      },
      crossAxisCount: 2,
    );
  }
}

//quilted style
class QuiltedWidget extends StatelessWidget {
  const QuiltedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            pattern: [
              QuiltedGridTile(2, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 2),
              //QuiltedGridTile(2, 2),
            ]),
        childrenDelegate:
            SliverChildBuilderDelegate(childCount: 10, (context, index) {
          return Image.network('https://source.unsplash.com/random?sig=$index');
        }));
  }
}
