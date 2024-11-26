import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter_demo/common/ui/colors.dart';
import 'package:login_page_flutter_demo/common/ui/gradients.dart';
import 'package:login_page_flutter_demo/features/sign_up/presentation/sign_up_cubit.dart';
import 'package:login_page_flutter_demo/gen/locale_keys.g.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onPress(context),
      child: Container(
        width: 240,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
          gradient: AppGradients.button,
        ),
        alignment: Alignment.center,
        child: Text(
          LocaleKeys.singUpButtonLabel.tr(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
        ),
      ),
    );
  }

  Future<void> _onPress(BuildContext context) async {
    final isValidData = await context.read<SignUpCubit>().signUp();

    if (isValidData && context.mounted) {
      unawaited(
        showDialog<void>(
          context: context,
          builder: (c) => const _SuccessDialog(),
        ),
      );
    }
  }
}

class _SuccessDialog extends StatelessWidget {
  const _SuccessDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          LocaleKeys.successSignUpMessage.tr(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
