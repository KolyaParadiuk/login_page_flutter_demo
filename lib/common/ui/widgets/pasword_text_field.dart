import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page_flutter_demo/common/extensions/context_extension.dart';
import 'package:login_page_flutter_demo/common/ui/assets.dart';
import 'package:login_page_flutter_demo/common/ui/colors.dart';
import 'package:login_page_flutter_demo/common/ui/topography.dart';
import 'package:login_page_flutter_demo/common/utils/password_validator.dart';

class AppPasswordFormField extends StatefulWidget {
  const AppPasswordFormField({
    required this.label,
    required this.onChanged,
    this.controller,
    this.inTimeValidationPasswordErrors,
    this.lateValidationPasswordErrors,
    super.key,
  });

  final String label;
  final ValueSetter<String?> onChanged;
  final List<PasswordRequirements>? inTimeValidationPasswordErrors;
  final List<PasswordRequirements>? lateValidationPasswordErrors;
  final TextEditingController? controller;

  @override
  State<AppPasswordFormField> createState() => _AppPasswordFormFieldState();
}

class _AppPasswordFormFieldState extends State<AppPasswordFormField> {
  bool _obscureText = true;

  bool get hasValidationError =>
      widget.lateValidationPasswordErrors?.isNotEmpty ?? false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(
            color: hasValidationError ? AppColors.error500 : AppColors.primary,
          ),
          controller: widget.controller,
          obscureText: _obscureText,
          onChanged: widget.onChanged,
          maxLength: 64,
          decoration: InputDecoration(
            error: hasValidationError ? const SizedBox.shrink() : null,
            hintText: widget.label,
            hintStyle: context.theme.inputDecorationTheme.hintStyle?.withColor(
              hasValidationError ? AppColors.error500 : AppColors.primary,
            ),
            counter: const SizedBox.shrink(),
            suffixIcon: _ObscureButton(
              hasValidationError: hasValidationError,
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              obscureText: _obscureText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _PasswordHint(
                requirement: PasswordRequirements.lengthMoreThen8,
                colorBuilder: _getPasswordHintCollor,
              ),
              _PasswordHint(
                requirement: PasswordRequirements.upperLowerCase,
                colorBuilder: _getPasswordHintCollor,
              ),
              _PasswordHint(
                requirement: PasswordRequirements.number,
                colorBuilder: _getPasswordHintCollor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getPasswordHintCollor(
    PasswordRequirements requirement,
  ) {
    if (!(widget.inTimeValidationPasswordErrors?.contains(requirement) ??
        false)) {
      return AppColors.success500;
    }
    if (widget.lateValidationPasswordErrors?.contains(requirement) ?? false) {
      return AppColors.error500;
    }

    return AppColors.primary;
  }
}

class _ObscureButton extends StatelessWidget {
  const _ObscureButton({
    required this.hasValidationError,
    required this.onPressed,
    this.obscureText = true,
  });
  final bool hasValidationError;
  final VoidCallback onPressed;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final color = hasValidationError ? AppColors.error500 : AppColors.icon;
    return GestureDetector(
      onTap: onPressed,
      child: obscureText
          ? _ObscureIcon(path: Assets.hidePasswordIcon, color: color)
          : _ObscureIcon(path: Assets.showPasswordIcon, color: color),
    );
  }
}

class _ObscureIcon extends StatelessWidget {
  const _ObscureIcon({required this.path, required this.color});
  final String path;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      fit: BoxFit.scaleDown,
      height: 24,
    );
  }
}

class _PasswordHint extends StatelessWidget {
  const _PasswordHint({required this.colorBuilder, required this.requirement});
  final PasswordRequirements requirement;
  final Color Function(PasswordRequirements) colorBuilder;
  @override
  Widget build(BuildContext context) {
    return Text(
      requirement.name,
      style: AppTextStyles.body13Regular.copyWith(
        color: colorBuilder(requirement),
      ),
    );
  }
}
