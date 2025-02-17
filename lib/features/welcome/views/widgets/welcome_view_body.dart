import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/core/cache/cache_keys.dart';
import 'package:quiz_app/core/cache/shared_preferences_helper.dart';
import 'package:quiz_app/core/helpers/assets.dart';
import 'package:quiz_app/core/helpers/extensions.dart';
import 'package:quiz_app/core/routes/routes.dart';
import 'package:quiz_app/core/themes/styles.dart';
import 'package:quiz_app/core/widgets/start_button.dart';
import 'package:quiz_app/features/welcome/views/widgets/username_text_form_field.dart';

class WelcomeViewBody extends StatefulWidget {
  const WelcomeViewBody({
    super.key,
  });

  @override
  State<WelcomeViewBody> createState() => _WelcomeViewBodyState();
}

class _WelcomeViewBodyState extends State<WelcomeViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? username;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.imagesBg,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Let\'s play Quiz,',
                    style: Styles.style32Bold(context: context),
                  ),
                  const Text(
                    'Enter your name below.',
                  ),
                  const Spacer(),
                  UserNameTextFormField(
                    autovalidateMode: autovalidateMode,
                    onValueSaved: (value) {
                      username = value;
                    },
                  ),
                  const Spacer(),
                  StartButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await SharedPreferencesHelper.saveData<String>(
                            key: CacheKeys.usernameKey, value: username!);
                        if (!context.mounted) return;
                        context.pushReplacementNamed(Routes.categorySelection);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    btnText: 'Let\'s start',
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
