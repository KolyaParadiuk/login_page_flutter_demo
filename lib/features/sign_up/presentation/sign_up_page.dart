import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_flutter_demo/common/ui/colors.dart';
import 'package:login_page_flutter_demo/common/ui/widgets/page_container.dart';
import 'package:login_page_flutter_demo/common/ui/widgets/pasword_text_field.dart';
import 'package:login_page_flutter_demo/features/sign_up/presentation/sign_up_cubit.dart';
import 'package:login_page_flutter_demo/features/sign_up/presentation/widgets/email_input_field.dart';
import 'package:login_page_flutter_demo/features/sign_up/presentation/widgets/submit_button.dart';
import 'package:login_page_flutter_demo/gen/locale_keys.g.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignUpCubit(),
        child: const PageContainer(
          child: _SignUpBody(),
        ),
      ),
    );
  }
}

class _SignUpBody extends StatelessWidget {
  const _SignUpBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return ListView(
          children: [
            const SizedBox(height: 94),
            Text(
              LocaleKeys.signUpTitle.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 40),
            EmailInputField(
              emailError: state.emailError,
              emailValidatedSuccess: state.emailValidatedSuccess,
            ),
            const SizedBox(height: 20),
            AppPasswordFormField(
              label: LocaleKeys.createPasswordHint.tr(),
              inTimeValidationPasswordErrors:
                  state.inTimeValidationPasswordErrors,
              lateValidationPasswordErrors: state.lateValidationPasswordErrors,
              onChanged: context.read<SignUpCubit>().onPasswordChanged,
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SubmitButton()],
            ),
          ],
        );
      },
    );
  }
}
