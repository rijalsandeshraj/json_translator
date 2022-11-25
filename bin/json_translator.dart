/// This is a command line Dart application that reads a JSON file and translates the values to
/// a specified language and creates a translated JSON file especially useful for localization
/// in Flutter apps.
///
/// You may find 'json_creator' package on pub.dev helpful if you are creating a JSON file
/// for localization of prebuilt Flutter apps.
///
/// This package intends to help Flutter developers who have already developed
/// a Flutter app and are looking for localizing the project. This package asks for path of the
/// JSON file and language code for translating the values in the file. It reads the provided
/// JSON file from the entered path in the terminal and translates the values to specified
/// language using 'translator' package on pub.dev that uses Free Google Translate API for Dart.
/// Output file is created in the working directory with name as provided language code.
///
/// Run this command in the terminal for starting the program:
/// > dart run
///
/// Steps involved while running the program:
/// 1. Run the program
/// 2. Enter the path of the JSON file
/// 3. The program detects whether the file exists
/// 4. Enter a valid language code for translating to a specific language (defaults to "en" if
///    no language code is provided)
/// 5. The program detects whether the entered language code is valid or supported
/// 6. If the path and the language code are valid, then it will display the translations in the
///    terminal along with creating a translated JSON file in the working directory

library json_tranlator;

export '../lib/src/json_translator.dart';
