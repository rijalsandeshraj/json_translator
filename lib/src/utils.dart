import 'dart:io';

// Retrieves the current working directory
Directory getCurrentDirectory() => Directory.current;

// Gets file path from the user
String? getFilePath() {
  stdout.write('Enter the path of JSON file: ');
  String? folderPath = stdin.readLineSync();
  return folderPath;
}

// Creates a JSON file in the working directory
File returnFile(String languageCode) {
  Directory currentDirectory = getCurrentDirectory();
  final String path = currentDirectory.path;
  final File file = File('$path/app_$languageCode.json');
  return file;
}

// Returns language code
String getLanguageCode() {
  stdout.write(
      'Enter translation language code (Press [Enter] for default "en"): ');
  String? languageCode = stdin.readLineSync();
  if (languageCode != null && languageCode.isNotEmpty) {
    return languageCode;
  } else {
    return 'en';
  }
}
