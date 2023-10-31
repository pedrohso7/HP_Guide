import 'package:flutter/material.dart';
import '../../../../../core/constants/theme/colors.dart';
import '../../../../../core/constants/theme/sizes.dart';
import '../../../../../core/constants/theme/text_style.dart';
import '../../../../../core/extensions/sized_box_extension.dart';

class SectionCard extends StatelessWidget {
  const SectionCard(
      {super.key,
      required this.title,
      required this.body,
      this.image,
      this.actions,
      this.isImageVisible = false});

  final String title;
  final Widget body;
  final String? image;
  final List<Widget>? actions;
  final bool isImageVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.s16),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.s16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.14),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 5,
            offset: const Offset(0, 3),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: title,
            image: image ?? '',
            actions: actions ?? [],
            isImageVisible: isImageVisible,
          ),
          body,
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.image,
    required this.actions,
    required this.isImageVisible,
  });

  final String title;
  final String image;
  final List<Widget> actions;
  final bool isImageVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitleWidget(
              title: title,
              image: image,
              isImageVisible: isImageVisible,
            ),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: AppSizes.s8,
                runSpacing: AppSizes.s16,
                children: List.generate(
                  actions.length,
                  (index) => actions[index],
                ),
              ),
            ),
          ],
        ),
        VerticalSpace.s8,
        const Divider(),
      ],
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
    required this.image,
    required this.isImageVisible,
  });

  final String title;
  final String image;
  final bool isImageVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: isImageVisible,
          child: SizedBox(
            width: AppSizes.s40,
            height: AppSizes.s40,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        HorizontalSpace.s16,
        Text(
          title,
          style: AppTextStyles.subtitle,
        ),
        HorizontalSpace.s16,
      ],
    );
  }
}


// class SectionHeader extends StatelessWidget {
//   const SectionHeader({
//     super.key,
//     required this.title,
//     required this.image,
//   });

//   final String title;
//   final String image;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               width: AppSizes.s40,
//               height: AppSizes.s40,
//               child: Image.asset(
//                 image,
//                 fit: BoxFit.contain,
//               ),
//             ),
//             HorizontalSpace.s16,
//             Text(
//               title,
//               style: AppTextStyles.title,
//             ),
//           ],
//         ),
//         VerticalSpace.s8,
//         const Divider(),
//       ],
//     );
//   }
// }
