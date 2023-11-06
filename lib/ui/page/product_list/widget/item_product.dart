import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_images.dart';
import 'package:nws_hieuvm_ecommerce_flutter/common/app_text_styles.dart';

class ItemProduct extends StatelessWidget {
  final int priceProduct;
  final String nameProduct;
  final String imageProduct;

  const ItemProduct({
    super.key,
    required this.nameProduct,
    required this.imageProduct,
    required this.priceProduct,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: imageProduct,
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(AppImages.noImage),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: SvgPicture.asset(
                  AppImages.icLoveBlack,
                  width: 15,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
        Text(
          nameProduct,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.black12Bold,
        ),
        Text(
          nameProduct,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.black12W,
        ),
        Text(
          '\$$priceProduct.00',
          style: AppTextStyle.black12Bold,
        ),
      ],
    );
  }
}
