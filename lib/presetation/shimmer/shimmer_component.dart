import 'package:flutter/material.dart';
import 'package:wallpaper/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hg(context) * 0.7867,
      width: wd(context),
      color: Colors.blue.withOpacity(0.2),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.only(
              left: i == 0 ? wd(context) * 0.06 : wd(context) * 0.04,
              top: wd(context) * 0.04,
              bottom: wd(context) * 0.04,
            ),
            child: Shimmer.fromColors(
              period: const Duration(milliseconds: 1000),
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.6),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(wd(context) * 0.04),
                    topLeft: Radius.circular(wd(context) * 0.04)),
                child: Container(
                  color: Colors.white,
                  width: wd(context) * 0.65,
                  height: (wd(context) * 0.75) * 2,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
