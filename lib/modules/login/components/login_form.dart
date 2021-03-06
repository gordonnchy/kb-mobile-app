import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/current_user_state/current_user_state.dart';
import 'package:kb_mobile_app/app_state/login_form_state/login_form_state.dart';
import 'package:kb_mobile_app/app_state/referral_nofitication_state/referral_nofitication_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/form_field_input_icon.dart';
import 'package:kb_mobile_app/core/constants/custom_color.dart';
import 'package:kb_mobile_app/core/services/implementing_partner_referral_config_service.dart';
import 'package:kb_mobile_app/core/services/program_service.dart';
import 'package:kb_mobile_app/core/services/user_access.dart';
import 'package:kb_mobile_app/core/services/user_service.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/models/current_user.dart';
import 'package:kb_mobile_app/modules/intervention_selection/intervention_selection.dart';
import 'package:kb_mobile_app/modules/login/components/login_button.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/modules/login/constants/login_style.dart';
import 'package:provider/provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key, @required this.currentLanguage}) : super(key: key);

  final String currentLanguage;

  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  CurrentUser currentUser;
  LoginFormState loginFormState;
  TextEditingController usernameController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    this.loginFormState = Provider.of<LoginFormState>(context, listen: false);
    UserService().getCurrentUser().then((CurrentUser user) {
      currentUser = user ??
          new CurrentUser(
            username: '',
            password: '',
          );
      usernameController =
          new TextEditingController(text: currentUser.username);
      passwordController =
          new TextEditingController(text: currentUser.password);
      setState(() {});
    });
  }

  void updateInputActiveStatus(String activeField) {
    loginFormState.setActiveInput(activeField);
  }

  void updatePasswordVisibilityStatus(bool value) {
    loginFormState.setIsPasswordVisible(value);
  }

  void onFieldValueChanges(String value, String key) {
    currentUser.username =
        key == 'username' ? value.trim() : currentUser.username;
    currentUser.password =
        key == 'password' ? value.trim() : currentUser.password;
    setState(() {});
  }

  void onFieldSubmitted(String value, String key) {
    onFieldValueChanges(value, key);
    updateInputActiveStatus('');
  }

  void onLogin(bool isLoginProcessActive) async {
    bool status = currentUser.isCurrentUserSet();
    FocusScope.of(context).unfocus();
    updateInputActiveStatus('');
    if (!isLoginProcessActive && status) {
      loginFormState.setHasLoginErrorStatus(false);
      loginFormState.setIsLoginProcessActive(true);
      try {
        loginFormState.setCurrentLoginProcessMessage('Authenticating user...');
        CurrentUser user = await UserService().login(
          currentUser.username.trim(),
          currentUser.password.trim(),
        );
        if (user != null) {
          var userAccessConfigurations =
              await UserAccess().getUserAccessConfigurationsFromTheServer(
            user.username,
            user.password,
          );
          await UserService().setCurrentUser(user);
          loginFormState.setCurrentLoginProcessMessage('Saving user access...');
          await UserAccess()
              .savingUserAccessConfigurations(userAccessConfigurations);
          Provider.of<CurrentUserState>(context, listen: false)
              .setCurrentUser(user, userAccessConfigurations);
          await Provider.of<ReferralNotificationState>(context, listen: false)
              .setCurrentImplementingPartner(user.implementingPartner);
          await ImplementingPartnerReferralConfigService()
              .addImplementingPartnerReferralServices(
                  user.username, user.password);
          loginFormState.setCurrentLoginProcessMessage(
              "Saving user's assigned locations...");
          await OrganisationUnitService()
              .discoveringOrgananisationUnitsFromTheServer();
          Provider.of<CurrentUserState>(context, listen: false)
              .setCurrentUserCountryLevelReferences();
          loginFormState.setCurrentLoginProcessMessage(
              "Saving assigned access for interventions...");
          List<String> programs = user.programs ?? [];
          for (String program in programs) {
            await ProgramService()
                .discoverProgramOrganisationUnitsFromTheServer(program);
          }
          Timer(Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => InterventionSelection(),
              ),
            ).then(
              (value) => loginFormState.setIsLoginProcessActive(false),
            );
          });
        } else {
          loginFormState.setIsLoginProcessActive(false);
          String message = 'Incorrect username or password';
          loginFormState.setHasLoginErrorStatus(true);
          AppUtil.showToastMessage(message: message);
          loginFormState.setCurrentLoginProcessMessage('');
        }
      } catch (error) {
        loginFormState.setIsLoginProcessActive(false);
        loginFormState.setCurrentLoginProcessMessage('');
        AppUtil.showToastMessage(
          message: error.toString() ?? error,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Color activeInputColor = Color(0xFF4B9F46);
    Color inActiveInputColor = Color(0xFFD2E7D1);
    return SingleChildScrollView(
      child: Consumer<LoginFormState>(
        builder: (context, loginFormState, child) {
          String activeInput = loginFormState.activeInput;
          bool hasLoginFormError = loginFormState.hasLoginFormError;
          bool isLoginProcessActive = loginFormState.isLoginProcessActive;
          bool isPasswordVisible = loginFormState.isPasswordVisible;
          return currentUser == null
              ? Container(
                  child: CircularProcessLoader(
                    color: CustomColor.defaultSecondaryColor,
                    size: 2.0,
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Username',
                            style: !hasLoginFormError
                                ? LoginPageStyles.formLableStyle
                                : LoginPageStyles.formLableStyle.copyWith(
                                    color: Colors.redAccent,
                                  ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: usernameController,
                        onTap: () => updateInputActiveStatus('username'),
                        onChanged: (value) =>
                            onFieldValueChanges(value, 'username'),
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
                              LoginPageStyles.loginBoxConstraints,
                        ),
                      ),
                    ),
                    LineSeperator(
                      color: activeInput == 'username'
                          ? activeInputColor
                          : inActiveInputColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Password',
                            style: !hasLoginFormError
                                ? LoginPageStyles.formLableStyle
                                : LoginPageStyles.formLableStyle.copyWith(
                                    color: Colors.redAccent,
                                  ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: passwordController,
                        onTap: () => updateInputActiveStatus('password'),
                        onChanged: (value) =>
                            onFieldValueChanges(value, 'password'),
                        onFieldSubmitted: (value) =>
                            onFieldSubmitted(value, 'password'),
                        obscureText: !isPasswordVisible,
                        autocorrect: false,
                        style: LoginPageStyles.formInputValueStyle,
                        readOnly: isLoginProcessActive,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                          prefixIcon: FormFieldInputIcon(
                            backGroundColor: Color(0xFFEDF5EC),
                            svgIcon: 'assets/icons/login-lock.svg',
                          ),
                          prefixIconConstraints:
                              LoginPageStyles.loginBoxConstraints,
                          suffixIcon: GestureDetector(
                            onTap: () => updatePasswordVisibilityStatus(
                              !isPasswordVisible,
                            ),
                            child: FormFieldInputIcon(
                              backGroundColor: Color(0xFFFFFFFF),
                              svgIcon: isPasswordVisible
                                  ? 'assets/icons/login-close-eye.svg'
                                  : 'assets/icons/login-open-eye.svg', // show and hide password icon
                            ),
                          ),
                          suffixIconConstraints:
                              LoginPageStyles.loginBoxConstraints,
                        ),
                      ),
                    ),
                    LineSeperator(
                      color: activeInput == 'password'
                          ? activeInputColor
                          : inActiveInputColor,
                    ),
                    LoginButton(
                      currentLanguage: widget.currentLanguage,
                      isLoginProcessActive: isLoginProcessActive,
                      onLogin: () => onLogin(
                        isLoginProcessActive,
                      ),
                    )
                  ],
                );
        },
      ),
    );
  }
}
