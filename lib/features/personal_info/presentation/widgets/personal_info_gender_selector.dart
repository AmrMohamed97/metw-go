import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metw_go/core/l10n/app_localizations.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_cubit.dart';
import 'package:metw_go/features/personal_info/presentation/manager/personal_info_state.dart';
import 'package:metw_go/features/register/presentation/widgets/field_title.dart';

class PersonalInfoGenderSelector extends StatelessWidget {
  const PersonalInfoGenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        final cubit = context.read<PersonalInfoCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             FieldTitle(title: AppLocalizations.of(context)!.gender),
            SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => cubit.changeGender(true),
                    child: _ChoiceTile(
                      text: AppLocalizations.of(context)!.male,
                      isSelected: cubit.isMale,
                      icon: Icons.male_rounded,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => cubit.changeGender(false),
                    child: _ChoiceTile(
                      text: AppLocalizations.of(context)!.female,
                      icon: Icons.female_rounded,
                      isSelected: !cubit.isMale,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ChoiceTile extends StatelessWidget {
  const _ChoiceTile({required this.text, this.isSelected = false, this.icon});

  final String text;
  final bool isSelected;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.tertiary;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      height: 46,
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFFFFAF5)
            : Theme.of(context).colorScheme.outline,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: color, fontSize: 14)),
          if (icon != null) ...[
            SizedBox(width: 6),
            Icon(icon, color: color, size: 18),
          ],
        ],
      ),
    );
  }
}
