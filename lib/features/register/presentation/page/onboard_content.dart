import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
import 'package:metw_go/core/theme/app_text_style.dart';
import 'package:metw_go/core/theme/my_colors.dart';
import 'package:metw_go/core/widgets/custom_button.dart';
import 'package:metw_go/features/register/presentation/manager/register_cubit.dart';
import 'package:metw_go/features/register/presentation/manager/register_state.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final controller = context.read<RegisterCubit>();
        return ExpandablePageView.builder(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.changePage(value);
          },
          itemCount: onboardingIcons.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .5,
                  child: Center(
                    child: SvgPicture.asset(onboardingIcons[index])
                        .animate(onPlay: (c) => c.repeat(reverse: true))
                        .moveY(
                          begin: 0,
                          end: 10,
                          duration: 2.seconds,
                          curve: Curves.easeInOut,
                        ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    onboardTitle[index],
                    style: AppTextStyle.bold14(
                      context,
                    ).copyWith(fontSize: 28, color: MyColors.secondaryColor),
                  ),
                ),
                if (controller.currentPage == 0)
                  Column(
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        r'تحتاج شرح أكثر؟',
                        style: AppTextStyle.bold18(context),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                Text(
                  onboardText[index],
                  style: AppTextStyle.bold16(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                if (controller.currentPage == 2) ...[
                  CustomButton(
                        isMax: true,
                        onPressed: () {
                          // context.push(PagesKeys.assignUserTypePage);
                        },
                        text: "ادخل الساحة",
                        // backgroundColor: MyColors.secondaryOrangeDark,
                      )
                      .animate()
                      .fadeIn(delay: 700.ms, duration: 700.ms)
                      .slideY(
                        begin: 0.2,
                        end: 0,
                        delay: 700.ms,
                        duration: 600.ms,
                        curve: Curves.easeOut,
                      ),
                  const SizedBox(height: 16),
                  CustomButton(
                        backgroundColor: Colors.white,
                        // textColor: MyColors.purpleNormal,
                        // borderColor: MyColors.purpleNormal,
                        isMax: true,
                        onPressed: () {
                          // context.push(PagesKeys.registerPage);
                        },
                        text: "إنشاء حساب جديد",
                      )
                      .animate()
                      .fadeIn(delay: 900.ms, duration: 700.ms)
                      .slideY(
                        begin: 0.2,
                        end: 0,
                        delay: 900.ms,
                        duration: 600.ms,
                        curve: Curves.easeOut,
                      ),
                  const SizedBox(height: 40),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

const onboardingIcons = [
  'assets/images/metw_go.svg',
  'assets/images/metw_go.svg',
  'assets/images/metw_go.svg',
];

const onboardTitle = [
  'دروس خصوصية على مزاجك',
  "جرّب كلاس واحد وشوف الفرق",
  "باكدج التحدي نبي نبني مستقبلك سوا",
];
const onboardText = [
  "اختر المدرّس اللي يناسبك وخذ جلسة خاصة تراجع فيها على راحتك، بوقتك وبالأسلوب اللي تحبّه",
  "مو لازم تبدأ بكورس كامل، خذ لك كلاس واحد جرّب فيه التفاعل، وبتشوف بنفسك الفرق",
  'خذ باكدج جلسات، تقدّم خطوة كل أسبوع، وخليك مستعد تقول قريب "سويتها أنا!" ',
];
