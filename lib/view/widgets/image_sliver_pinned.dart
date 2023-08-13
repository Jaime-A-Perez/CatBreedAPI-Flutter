import 'package:flutter/material.dart';
import 'package:test_pragma/utils/utils.dart';

class ImageSliverPinned extends StatelessWidget {
  const ImageSliverPinned({
    Key? key, 
    required this.urlImage}) : super(key: key);
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final height = screenSize(context, typeSize: TypeSize.height, size: 1);

    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      expandedHeight: height * 0.5,
      pinned: true,
      collapsedHeight: height * 0.5,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network( 
                      urlImage,
                      fit: BoxFit.cover,
                      width: width,
                      errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
                        return Image.asset("assets/images/notFoundCat.jpg",
                        width: width,
                        fit: BoxFit.cover,
                        );
                      }           
                  ),
            ],
          );
        },
      ),
      shadowColor: Colors.black12,
    );
  }
}