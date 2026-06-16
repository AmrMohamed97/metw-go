import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metw_go/core/utils/app_images.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
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
            background: SvgPicture.asset(AppImages.logo),
          ),
        ),
        SliverFillRemaining(
          child:
              Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(100),
                      ),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Column(
                      children: [
                        Row(),

                        SizedBox(height: 100, width: double.infinity),
                      ],
                    ),
                  )
                  .animate()
                  .fade(delay: 500.ms, duration: 600.ms)
                  .slide(
                    begin: Offset(Directionality.of(context) == TextDirection.rtl ? -0.1 : 0.1, 0.1),
                    end: Offset.zero,
                    delay: 500.ms,
                    duration: 600.ms,
                  ),
        ),
      ],
    );
  }
}
