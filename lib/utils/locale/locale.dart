import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'sign_in_content':
              "Hey, Do you know you can easily learn anything now. Faster and Better. That's absolutely for free ",
          'sign_in_button': "SignIn",
          'lbl_about': 'About',
          'msg_no_email': 'No email is connected with this profile',
          'msg_no_name': 'Update your Name',
          'lbl_create': 'Create',
          'lbl_toggle_theme': 'Toggle Theme',
          'lbl_logout': 'Logout',
          'lbl_cancel': 'Cancel',
          'lbl_submit': 'Submit',
          'msg_are_you_sure_to_logout': "Are you sure to logout?"
        },
        'hi_IN': {
          'hello': 'नमस्ते',
        },
      };
}
