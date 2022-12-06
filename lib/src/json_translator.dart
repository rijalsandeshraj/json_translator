import 'dart:convert';
import 'dart:io';

import 'package:translator/translator.dart';

import 'constants.dart';
import 'utils.dart';

final GoogleTranslator translator = GoogleTranslator();

// Translates the input String to specified language
Future<String> translate(
  String sourceText, {
  String to = 'en',
}) async {
  String translation = await translator
      .translate(sourceText, to: to)
      .then((value) => value.text);
  return translation;
}

Future<void> main() async {
  String? filePath = getFilePath();
  if (filePath != null && filePath.isNotEmpty) {
    Directory dir = Directory(filePath);
    // Checks if the the path is valid
    if (dir.path.endsWith('.json')) {
      File srcFile = File(dir.path);
      String languageCode = getLanguageCode();
      if (languageCodes.contains(languageCode)) {
        File translationFile = returnFile(languageCode);
        final Stream<String> contents = srcFile
            .openRead()
            .transform(utf8.decoder)
            .transform(LineSplitter());
        await for (String line in contents) {
          RegExp valueExp = RegExp(r''': ['"].*['"]''');
          RegExp replaceExp = RegExp(r''': ''');
          Iterable<Match> matches = valueExp.allMatches(line);
          if (line.contains(valueExp)) {
            String actualMatch = matches.first[0]!.replaceAll(replaceExp, '');
            String translation = await translate(actualMatch, to: languageCode);
            print('✅ Translated: [$actualMatch] >> [$translation]');
            translationFile.writeAsStringSync(
              '${line.replaceAll(actualMatch, translation)}\n',
              mode: FileMode.append,
            );
          } else {
            translationFile.writeAsStringSync(
              '$line\n',
              mode: FileMode.append,
            );
          }
        }
      } else {
        print('❗ The language code is invalid!');
      }
    } else {
      print('❗ Path is not valid!');
    }
  } else {
    print('❗ You didn\'t enter the path!');
  }
}
