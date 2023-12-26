# Clean Architecture Flutter Template with GetX

[![GitHub stars](https://img.shields.io/github/stars/ssoad/flutter_getx_clean_architecture.svg?style=flat-square)](https://github.com/ssoad/flutter_getx_clean_architecture/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/ssoad/flutter_getx_clean_architecture.svg?style=flat-square)](https://github.com/ssoad/flutter_getx_clean_architecture/network)
[![GitHub license](https://img.shields.io/github/license/ssoad/flutter_getx_clean_architecture.svg?style=flat-square)](https://github.com/ssoad/flutter_getx_clean_architecture/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/ssoad/flutter_getx_clean_architecture.svg?style=flat-square)](https://github.com/ssoad/flutter_getx_clean_architecture/issues)

A clean architecture template for Flutter projects using the GetX state management library.

## About the Project

This project serves as a template for building Flutter applications with a focus on clean architecture principles and utilizing the GetX package for state management. The goal is to provide a structured and maintainable foundation for Flutter developers to kickstart their projects.

### Key Features

- **Clean Architecture:** Separation of concerns with clear divisions between data, domain, and presentation layers.
- **GetX State Management:** Leverage the power of GetX for simple and efficient state management.
- **Project Structure:** Organized directory structure following clean architecture practices.

## Getting Started

Follow these steps to set up and run the project locally.

### Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/ssoad/flutter_getx_clean_architecture.git
    ```

2. Navigate to the project directory:

    ```bash
    cd flutter_getx_clean_architecture
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the application:

    ```bash
    flutter run
    ```

## Project Structure

The project structure follows the principles of clean architecture to ensure maintainability and scalability. Here's an overview:

- **core:** Contains the base configurations.
- **domain:** Contains the business logic and domain entities.
- **data:** Manages data-related operations, including repositories and datasources.
- **presentation:** Handles the UI logic with GetX controllers, bindings, and pages.

<!-- ## Usage

To utilize this template for your project, follow these steps:

1. Replace `your-username` and `your-project` with your GitHub username and project name.
2. Customize the project structure based on your specific requirements.
3. Build your features following clean architecture principles with GetX. -->

## Internationalization (i18n)

This project includes support for internationalization. To add translations, follow these steps:

1. Create en.json and bn.json files in the `assets/lang` directory. 
   ```bash
   assets/
    |-- lang/
    |   |-- en.json
    |   |-- es.json

2. Add the translations in the following format:

    ```json
    {
        "key": "value"
    }
    ```
3. Update pubspec.yaml with the new translations:

    ```yaml
    flutter:
        ...
        assets:
            - assets/lang/en.json
            - assets/lang/bn.json
    ```
    Run the following command to get the assets:
    ```bash
    flutter pub get
    ```
4. Load JSON from assets
   Create a class to load and manage translations from assets. This class will be responsible for reading JSON files and providing translations to GetX:
    ```dart
    // core/presentation/translations_service.dart
    import 'dart:convert';
    import 'package:flutter/services.dart';
    import 'package:get/get.dart';

    class TranslationsService extends Translations {
    static const fallbackLocale = Locale('en');
    static const supportedLocales = [Locale('en'), Locale('es')];

    Map<String, String>? _translations;

    Future<void> loadTranslations(Locale locale) async {
        final jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
        final jsonMap = json.decode(jsonString);
        _translations = jsonMap.cast<String, String>();
    }

    @override
    Map<String, Map<String, String>> get keys => {
            for (var locale in supportedLocales)
            locale.languageCode: _translations ?? {},
        };
    }
    ```
5. Initialize GetX with translations
   Update your main.dart to initialize translations using the TranslationsService:
   ```dart
   // main.dart
    import 'package:flutter/material.dart';
    import 'package:get/get.dart';

    import 'core/presentation/translations_service.dart';

    void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices(); // Initialize translation service
    runApp(MyApp());
    }

    Future<void> initServices() async {
    await Get.putAsync(() => TranslationsService().loadTranslations(Get.deviceLocale ?? TranslationsService.fallbackLocale));
    }

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return GetMaterialApp(
        translations: TranslationsService(),
        locale: Get.deviceLocale ?? TranslationsService.fallbackLocale,
        fallbackLocale: TranslationsService.fallbackLocale,
        supportedLocales: TranslationsService.supportedLocales,
        home: MyHomePage(),
        );
    }
    }
    ```
6. Now, you can use translations in your widgets as before:
   ```dart
   // presentation/pages/home_page.dart
    import 'package:flutter/material.dart';
    import 'package:get/get.dart';

    class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('home'.tr),
        ),
        body: Center(
            child: Text('hello'.tr),
        ),
        );
    }
    }
   ```

   
## Contributing

We welcome contributions! Please follow these guidelines when contributing to the project. Check the [Contribution Guidelines](CONTRIBUTING.md) for more details.

## Testing

Explain how to run tests and provide examples for different types of tests.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For questions or feedback, feel free to reach out:

- Connect with me on 
    - [LinkedIn](https://www.linkedin.com/in/mdsoad/)
    - [Email](mailto:mdsoad@gmail.com)
