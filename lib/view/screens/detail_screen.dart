import 'package:flutter/material.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/view/widgets/appBar_widget.dart';
import 'package:test_pragma/view/widgets/image_sliver_pinned.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.cat});
  final Cat? cat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBarCat(title: cat!.breed),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            ImageSliverPinned(urlImage: cat!.urlImage,),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _CatInformation(cat: cat!),
                  childCount: 1))            
          ],
        ),
      ),
    );
  }
  
}

class _CatInformation extends StatelessWidget {
  const _CatInformation({required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Text(cat.description)
      ],
    );
  }
}