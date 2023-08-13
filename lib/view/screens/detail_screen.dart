import 'package:flutter/material.dart';
import 'package:test_pragma/domine/entities/cat.dart';
import 'package:test_pragma/view/widgets/appBar_widget.dart';
import 'package:test_pragma/view/widgets/custom_scrollbar.dart';
import 'package:test_pragma/view/widgets/image_sliver_pinned.dart';
import 'package:test_pragma/view/widgets/star_level.dart';

// Detail screen displaying cat information.
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.cat});
  final Cat? cat;

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
      appBar: AppBarCat(title: cat!.breed),
      body: SafeArea(
        child: CustomScrollbar(
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
      ),
    );
  }
  
}
// Widget to display cat information in DetailsScreeens
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
          ListTitleCustom(title: "Origin",data: cat.origin),
          const Divider(),
          ListTitleCustom(title: "Adaptability",data: cat.adaptability),
          const Divider(),
          ListTitleCustom(title: "Life Span",data: "${cat.lifeSpan} years"),
          const Divider(),          
          Row(
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
// Custom list title and data
class ListTitleCustom extends StatelessWidget {
  const ListTitleCustom({super.key, required this.title, required this.data,});
final String title ;
  final String data;
  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context);
    return Row(           
            children: [
            Text(title, style: theme.textTheme.titleLarge),
            const Spacer(),
            Text(data, style: theme.textTheme.headlineSmall,),
            ],
          );
  }
}