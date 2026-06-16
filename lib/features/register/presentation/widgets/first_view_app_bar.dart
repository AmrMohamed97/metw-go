
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metw_go/core/utils/app_images.dart';

class FirstViewAppBar extends StatelessWidget {
  const FirstViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      floating: false,
      pinned: true,
      elevation: 0,
      primary: true,
      shadowColor:  Colors.transparent,
      snap: false,
      stretch: true,
      toolbarHeight: kToolbarHeight,
      collapsedHeight: kToolbarHeight,
      stretchTriggerOffset: 100,
      expandedHeight: MediaQuery.sizeOf(context).height * .25,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: Center(child: SvgPicture.asset(AppImages.logo)),
      ),
    );
  }
}
