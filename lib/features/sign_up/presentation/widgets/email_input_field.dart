import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter_demo/common/extensions/context_extension.dart';
import 'package:login_page_flutter_demo/common/ui/colors.dart';
import 'package:login_page_flutter_demo/common/ui/topography.dart';
import 'package:login_page_flutter_demo/features/sign_up/presentation/sign_up_cubit.dart';
import 'package:login_page_flutter_demo/gen/locale_keys.g.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    required this.emailError,
    required this.emailValidatedSuccess,
    super.key,
  });

  final bool emailError;
  final bool emailValidatedSuccess;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: emailValidatedSuccess
          ? AppColors.success500
          : emailError
              ? AppColors.error500
              : AppColors.primary,
    );
    const successBorderSide = BorderSide(
      color: AppColors.success500,
      width: 1,
    );
    final decoration = InputDecoration(
      enabledBorder: emailValidatedSuccess
          ? context.theme.inputDecorationTheme.enabledBorder?.copyWith(
              borderSide: successBorderSide,
            )
          : null,
      focusedBorder: emailValidatedSuccess
          ? context.theme.inputDecorationTheme.focusedBorder
              ?.copyWith(borderSide: successBorderSide)
          : null,
      hintText: LocaleKeys.enterEmailHint.tr(),
      hintStyle: context.theme.inputDecorationTheme.hintStyle?.withColor(
        emailError ? AppColors.error500 : AppColors.primary,
      ),
      error: emailError
          ? Padding(
              padding: const EdgeInsets.only(top: 12, left: 8),
              child: Text(
                LocaleKeys.invalidEmailMessage.tr(),
                style: AppTextStyles.body13Regular.copyWith(
                  color: AppColors.error500,
                ),
              ),
            )
          : null,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );

    return TextField(
      onChanged: context.read<SignUpCubit>().onEmailChanged,
      style: textStyle,
      decoration: decoration,
    );
  }
}
