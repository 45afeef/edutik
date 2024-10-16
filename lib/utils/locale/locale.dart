import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'sign_in_content':
              "Hey, Do you know you can easily learn anything now. Faster and Better. That's absolutely for free ",
          'sign_in_button': "SignIn",
        },
        'hi_IN': {
          'hello': 'नमस्ते',
        },
      };
}
