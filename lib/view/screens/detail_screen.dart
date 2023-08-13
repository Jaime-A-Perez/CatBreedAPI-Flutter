import 'package:flutter/material.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/view/widgets/appBar_widget.dart';
import 'package:test_pragma/view/widgets/image_sliver_pinned.dart';
import 'package:test_pragma/view/widgets/star_level.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.cat});
  final Cat? cat;

  @override
  Widget build(BuildContext context) {   
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cat.description, style: theme.textTheme.bodyLarge,),
          const Divider(),
          Row(
            
            children: [
            Text("Origin", style: theme.textTheme.titleLarge),
            const Spacer(),
            Text(cat.origin, style: theme.textTheme.headlineSmall,),
            ],
          ),
          const Divider(),
          Row(
           
            children: [
            Text("Adaptability", style: theme.textTheme.titleLarge),
            const Spacer(),
            Text(cat.adaptability, style: theme.textTheme.headlineSmall,),
            ],
          ),
          const Divider(),
          Row(
           
            children: [
            Text("Life Span", style: theme.textTheme.titleLarge),
            const Spacer(),
            Text("${cat.lifeSpan} years", style: theme.textTheme.headlineSmall,),
            ],
          ),
          const Divider(),
          
          Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [  
                      Text("Inteligence", style: theme.textTheme.titleLarge),
                      const Spacer(),
                          StartLevel(stars: int.parse(cat. intelligence))                   
            ],
          ),          
        ],
      ),
    );
  }
}