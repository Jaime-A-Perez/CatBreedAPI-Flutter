import 'package:flutter/material.dart';
import 'package:test_pragma/utils/utils.dart';

class CardCustom extends StatelessWidget {
  final String breed;
  final String countryOfOrigin;
  final String intelligence;
  final String image;
  final VoidCallback? onTap;

  const CardCustom(
      {Key? key,
      required this.breed,
      required this.countryOfOrigin,
      required this.intelligence,
      required this.image,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = screenSize(context, typeSize: TypeSize.width, size: 1);
    final height = screenSize(context, typeSize: TypeSize.height, size: 1);
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        shadowColor: Colors.pink.shade100,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.01),
            width: width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(breed, style: theme.textTheme.titleMedium),
                          const Icon(Icons.add)
                        ],
                      ),
                      Text(countryOfOrigin, style: theme.textTheme.bodySmall),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: SizedBox(
                    height: height * 0.3,
                    child: Image.network( 
                      image ,
                      fit: BoxFit.fitWidth,
                      width: width,
                      errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
                        return Image.asset("assets/images/notFoundCat.jpg",
                        width: width,
                        fit: BoxFit.fitWidth,
                        );
                      }           
                  ),
                ),
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("intelligence: $intelligence",
                          style: theme.textTheme.bodyLarge),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}