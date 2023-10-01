import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/data/source/local/product_entity.dart';
import 'package:wallpaper/utils/utils.dart';

Widget widgetForHomeScreen(BuildContext context, Function() clickHeart, ProductEntity productItem) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(wd(context) * 0.04),
        topLeft: Radius.circular(wd(context) * 0.04)),
    child: Container(
      width: wd(context) * 0.65,
      height: (wd(context) * 0.75) * 2,
      color: Colors.green.withOpacity(0.5),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(wd(context) * 0.04),
                child: CachedNetworkImage(
                  imageUrl: productItem.imageUrl,
                  width: wd(context) * 0.65,
                  height: (wd(context) * 0.65) * 2,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    clickHeart.call();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(wd(context) * 0.04),
                        bottomLeft: Radius.circular(wd(context) * 0.04)),
                    child: Container(
                      width: wd(context) * 0.13,
                      height: wd(context) * 0.13,
                      color: Colors.black.withOpacity(0.3),
                      child: Center(
                        child: Image.asset(
                          productItem.isSaved == true ? "assets/icon/heartred.png" : "assets/icon/heartwhite.png",
                          width: wd(context) * 0.1,
                          height: wd(context) * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            productItem.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFF002D41),
              fontSize: wd(context) * 0.06,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              Text(
                "Category:  ",
                style: TextStyle(
                  color: const Color(0xFF078FCD),
                  fontSize: wd(context) * 0.06,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                productItem.category,
                style: TextStyle(
                  color: const Color(0xFF078FCD),
                  fontSize: wd(context) * 0.06,
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}
