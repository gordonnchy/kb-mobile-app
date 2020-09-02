import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app-state/login_form_state/login_form_state.dart';
import 'package:kb_mobile_app/core/components/form_field_input_icon.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/modules/intervention_selection/intervention_selection.dart';
import 'package:kb_mobile_app/modules/login/components/login_button.dart';
import 'package:kb_mobile_app/core/components/login_form_field_seperator.dart';
import 'package:kb_mobile_app/modules/login/constants/login_style.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  CurrentUser currentUser =
      new CurrentUser(username: 'system-', password: 'System123');
  LoginFormState loginFormState;

  @override
  void initState() {
    super.initState();
    this.loginFormState = Provider.of<LoginFormState>(context, listen: false);
  }

  void updateInputActiveStatus(String activeField) {
    loginFormState.setActiveInput(activeField);
  }

  void updatePasswordVisibilityStatus(bool value) {
    loginFormState.setIsPasswordVisible(value);
  }

  void onFieldValueChanges(String value, String key) {
    currentUser.username = key == 'username' ? value : currentUser.username;
    currentUser.password = key == 'password' ? value : currentUser.password;
  }

  void onFieldSubmitted(String value, String key) {
    onFieldValueChanges(value, key);
    updateInputActiveStatus('');
  }

  void onLogin(bool isLoginProcessActive) async {
    bool status = currentUser.isCUrrentUserSet();
    FocusScope.of(context).unfocus();
    updateInputActiveStatus('');
    if (!isLoginProcessActive && status) {
      loginFormState.setHasLoginErrorStatus(false);
      loginFormState.setIsLoginProcessActive(true);
      CurrentUser user = await UserService()
          .login(currentUser.username.trim(), currentUser.password.trim());
      if (user != null) {
        Timer(Duration(seconds: 2), () {
          setState(() {
            loginFormState.setIsLoginProcessActive(true);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => InterventionSelection()));
          });
        });
      } else {
        loginFormState.setIsLoginProcessActive(false);
        String message = 'Incorrect username or password';
        loginFormState.setHasLoginErrorStatus(true);
        AppUtil.showToastMessage(message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color activeInputColor = Color(0xFF4B9F46);
    Color inActiveInputColor = Color(0xFFD2E7D1);

    return SingleChildScrollView(child: Consumer<LoginFormState>(
      builder: (context, loginFormState, child) {
        String activeInput = loginFormState.activeInput;
        bool hasLoginFormError = loginFormState.hasLoginFormError;
        bool isLoginProcessActive = loginFormState.isLoginProcessActive;
        bool isPasswordVisible = loginFormState.isPasswordVisible;

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    'Username',
                    style: !hasLoginFormError
                        ? LoginPageStyles.formLableStyle
                        : LoginPageStyles.formLableStyle
                            .copyWith(color: Colors.redAccent),
                  )
                ],
              ),
            ),
            Container(
              child: TextFormField(
                  controller:
                      new TextEditingController(text: currentUser.username),
                  onTap: () => updateInputActiveStatus('username'),
                  onChanged: (value) => onFieldValueChanges(value, 'username'),
                  onFieldSubmitted: (value) =>
                      onFieldSubmitted(value, 'username'),
                  readOnly: isLoginProcessActive,
                  autocorrect: false,
                  style: LoginPageStyles.formInputValueStyle,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: FormFieldInputIcon(
                        backGroundColor: Color(0xFFEDF5EC),
                        svgIcon: 'assets/icons/login-user-input.svg',
                      ),
                      prefixIconConstraints:
                          LoginPageStyles.loginBoxConstraints)),
            ),
            LoginFormFieldSeperator(
              color: activeInput == 'username'
                  ? activeInputColor
                  : inActiveInputColor,
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    'Password',
                    style: !hasLoginFormError
                        ? LoginPageStyles.formLableStyle
                        : LoginPageStyles.formLableStyle
                            .copyWith(color: Colors.redAccent),
                  )
                ],
              ),
            ),
            Container(
              child: TextFormField(
                controller:
                    new TextEditingController(text: currentUser.password),
                onTap: () => updateInputActiveStatus('password'),
                onChanged: (value) => onFieldValueChanges(value, 'password'),
                onFieldSubmitted: (value) =>
                    onFieldSubmitted(value, 'password'),
                obscureText: !isPasswordVisible,
                autocorrect: false,
                style: LoginPageStyles.formInputValueStyle,
                readOnly: isLoginProcessActive,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 15),
                    border: InputBorder.none,
                    prefixIcon: FormFieldInputIcon(
                      backGroundColor: Color(0xFFEDF5EC),
                      svgIcon: 'assets/icons/login-lock.svg',
                    ),
                    prefixIconConstraints: LoginPageStyles.loginBoxConstraints,
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          updatePasswordVisibilityStatus(!isPasswordVisible),
                      child: FormFieldInputIcon(
                        backGroundColor: Color(0xFFFFFFFF),
                        svgIcon: isPasswordVisible
                            ? 'assets/icons/login-close-eye.svg'
                            : 'assets/icons/login-open-eye.svg', // show and hide password icon
                      ),
                    ),
                    suffixIconConstraints: LoginPageStyles.loginBoxConstraints),
              ),
            ),
            LoginFormFieldSeperator(
              color: activeInput == 'password'
                  ? activeInputColor
                  : inActiveInputColor,
            ),
            LoginButton(
              isLoginProcessActive: isLoginProcessActive,
              onLogin: () => onLogin(isLoginProcessActive),
            )
          ],
        );
      },
    ));
  }
}
