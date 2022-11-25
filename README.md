# JSON_TRANSLATOR for Flutter Apps Localization

This is a command line Dart application that reads a JSON file, translates the values to
a specified language and creates a translated JSON file especially useful for localization
in Flutter apps.

[**NOTE**]: You may find ['json_creator'](https://pub.dev/packages/json_creator) package on
pub.dev helpful if you are creating a JSON file for localization of prebuilt Flutter apps.
https://pub.dev/packages/json_creator

This package intends to help Flutter developers who have already developed a Flutter app and
are looking for localizing the project. This package asks for path of the JSON file and
language code for translating the values in the file. It reads the provided JSON file from
the entered path in the terminal and translates the values to specified language using
'translator' package on pub.dev that uses Free Google Translate API for Dart. Output file is
created in the working directory with name as provided language code.

## Usage

This program is published to pub.dev so you can use this package:

1. As an executable by running the following commands:

```ps
dart pub global activate json_translator
```

If the warning is shown, you need to add the highlighted directory to your system's "Path"
environment variable for allowing the executable to run. Run the following command after adding
the directory to path.

```ps
json_translator
```

2. Or, by cloning the source code to your local machine and running the following command:

```ps
dart run
```

## Steps involved while running the program

1. Run the program
2. Enter the path of the JSON file
3. The program detects whether the file exists
4. Enter a valid language code for translating to a specific language (defaults to "en" if
   no language code is provided)
5. The program detects whether the entered language code is valid or supported
6. If the path and the language code are valid, then it will display the translations in the
   terminal along with creating a translated JSON file in the working directory

## Output

The output JSON file is created in the working directory as \*entered_language_code.json.

## Additional Information

Use Prettier extension to format your JSON file. Edit the file whereever necessary. Add this
to settings.json to format JSON files:

```console
"[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
```

Since writing comments within a json is not possible and localization is done using \*.arb files,
you can convert the extension of the JSON file to .arb. There is a syntax for defining comments in
those files. The community suggests using a special syntax, e.g. "@\_LOGIN_PAGE": {}, as a convention
of writing comments, but you can imagine they are not very visible when the file grows. So there's a
way out to highlight those section titles by using a VS Code extension: Highlight.

Just install it, go to settings.json, and add the following entry under highlight.regexes:

```console
"highlight.regexes": {
   "(\"@_.+\": {},)": {
     "filterFileRegex": ".*\\.(arb|json)",
     "decorations": [
       {
         "overviewRulerColor": "#d19a66",
         "backgroundColor": "#d19a66",
         "color": "#282c34",
         "fontWeight": "bold"
       }
     ]
   }
 }
```

Now the comments in the file gets highlighted!

There's an interesting article that can be helpful when working with arb files for localization. You
can check this out:
https://yapb.dev/tips-and-tricks-13-tips-when-working-with-arb-files-for-localization

Use the package and feedback is welcome! :blush::sparkling_heart:
