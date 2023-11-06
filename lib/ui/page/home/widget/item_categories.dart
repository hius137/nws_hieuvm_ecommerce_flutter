import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';

class ItemCategories extends StatelessWidget {
  final String nameCategories;
  final String imageCategories;
  final int lengthCategories;

  const ItemCategories(
      {super.key,
      required this.nameCategories,
      required this.imageCategories,
      required this.lengthCategories});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: imageCategories,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      ),
                ),
              ),
              errorWidget: (context, url, error) => const Image(
                image: AssetImage(AppImages.noImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            // height: size.height * 0.065,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(nameCategories, style: AppTextStyle.black16Bold,),
                  Text('$lengthCategories Product', style: AppTextStyle.black16Bold,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
