# fe_ezlang_flashcard

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Tests

### Run the integration test
The process of running the integration tests varies depending on the platform you are testing against. You can test against a mobile platform or the web.

#### a. Mobile
To test on a real iOS / Android device, first connect the device and run the following command from the root of the project:

```flutter test integration_test/app_test.dart```

Or, you can specify the directory to run all integration tests:

```flutter test integration_test```

This command runs the app and integration tests on the target device. For more information, see the Integration testing page.


`flutter drive --driver=./tests/test_driver/integration_test.dart --target=tests/integration_tests/app_test.dart -d chrome`

This command runs the app and integration tests on the target device. For more information, see the Integration testing page.

#### b. Web
To get started testing in a web browser, [Download ChromeDriver](https://chromedriver.chromium.org/downloads).

Next, create a new directory named test_driver containing a new file named integration_test.dart:

```
import 'package:integration_test/integration_test_driver.dart';

Future<void> main() => integrationDriver();
```

Launch chromedriver as follows:


`chromedriver --port=4444`
From the root of the project, run the following command:
`
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d chrome
For a headless testing experience, you can also run flutter drive with web-server as the target device identifier as follows:
`
`
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d web-server
`

```
flutter drive --driver=./tests/test_driver/integration_test.dart --target=tests/integration_tests/app_test.dart -d chrome
```

Run this command for generating class for serialization
`flutter pub run build_runner build`