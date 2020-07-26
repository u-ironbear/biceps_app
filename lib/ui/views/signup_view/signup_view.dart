import 'package:biceps_app/ui/shared/constants.dart';
import 'package:biceps_app/ui/shared/ui_helpers.dart';
import 'package:biceps_app/ui/views/signup_view/signup_viewmodel.dart';
import 'package:biceps_app/ui/widgets/busy_button.dart';
import 'package:biceps_app/ui/widgets/expansion_list.dart';
import 'package:biceps_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final trackRecordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 50.0,
              left: 50,
              top: 50,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Введите свои данные',
                    style: kMediumHeaderDark,
                  ),
                  verticalSpaceSmall,
                  Text('Пожалуйста, вводите корректные данные,'),
                  Text('в противном случае вы не сможете'),
                  Text('нормально работать с приложением'),
                  verticalSpaceMedium,
                  InputField(
                    placeholder: 'Имя',
                    controller: nameController,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Email',
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Пароль',
                    controller: passwordController,
                    password: true,
                    additionalNote: 'Не менее 6 символов',
                  ),
                  verticalSpaceSmall,
                  ExpansionList<String>(
                    items: [
                      'Мужской',
                      'Женский',
                    ],
                    title: model.selectedGender,
                    onItemSelected: model.setSelectedGender,
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Возраст',
                    controller: ageController,
                    textInputType: TextInputType.number,
                    additionalNote: 'Полных лет',
                  ),
                  verticalSpaceSmall,
                  InputField(
                    placeholder: 'Стаж тренинга',
                    controller: trackRecordController,
                    textInputType: TextInputType.number,
                    additionalNote: 'Полных лет',
                  ),
                  verticalSpace(15),
                  BusyButton(
                    title: 'Создать аккаунт',
                    busy: model.isBusy,
                    onPressed: () {
                      model.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        age: ageController.text,
                        trackRecord: trackRecordController.text,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => SignupViewModel(),
    );
  }
}
