import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
        },
        'bn_BD': {
          'hello': 'হ্যালো',
        }
      };
}
