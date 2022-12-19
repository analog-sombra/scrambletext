# TextScramble

A simple and great text scramble plugin in flutter

- Awesome text plugin
- Easy to use and elegant
-  ✨   It's  a true Magic ✨

## Features

- Import a HTML file and watch it magically convert to Markdown
- Define your custom word for scramble
- Multipal text at once
- Autoloop is enable by default

## Installation
```dart
dependencies:
    flutter:
        sdk: flutter
    scrambletext: any
```


# Import
```dart
import 'package:scrambletext/scrambletext.dart';
```

## Basic example
```dart
  ScrambleText(texts:["Scramble Text", "Awesome", "Text Plugin"]);
```
## Advance example

```dart
ScrambleText(
    texts: ["Scramble Text", "Awesome", "Text Plugin"],
    style: TextStyle(
        color: Color(0xffee3b6a),
        fontSize: 30,
    ),
    loop: true,
    words: "##*^(K:LO}}{{{",
    duration: Duration(seconds: 3),
    charDuraction: Duration(milliseconds: 400),
)
```


# social links


| Plugin | README |
| ------ | ------ |
| Discord | https://discord.gg/N6C4UQNuhb |
| GitHub | https://github.com/zexalearn/ |
| yotube | https://www.youtube.com/@zexalearn |
| telegram | https://t.me/zexalearn |



## License
MIT


