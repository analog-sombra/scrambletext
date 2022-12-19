library scrambletext;

import 'dart:math';

import 'package:flutter/material.dart';

class ScrambleText extends StatefulWidget {
  const ScrambleText({
    super.key,
    required this.texts,
    this.loop = true,
    this.style = const TextStyle(),
    this.words = "_________",
    this.duration = const Duration(seconds: 2),
    this.charDuraction = const Duration(milliseconds: 100),
  });
  final List<String> texts;
  final bool loop;
  final TextStyle style;
  final String words;
  final Duration duration;
  final Duration charDuraction;

  @override
  State<ScrambleText> createState() => _ScrambleTextState();
}

class _ScrambleTextState extends State<ScrambleText> {
  List<String> texts = [];
  bool? loop;
  String? words;
  Duration? duration;
  Duration? charDuration;
  int? textsLength;
  int? wordsLength;

  int? currentTextLength;
  int currentIndex = 0;
  List<int> completedValue = [];
  String? showText;

  @override
  void initState() {
    super.initState();
    texts = widget.texts;
    loop = widget.loop;
    words = widget.words;
    duration = widget.duration;
    charDuration = widget.charDuraction;
    textsLength = widget.texts.length;
    currentTextLength = widget.texts[currentIndex].length;
    wordsLength = widget.words.length;
    showText = widget.texts[currentIndex];
    start();
  }

  int genrateRandom(int value) {
    return Random().nextInt(value);
  }

  void start() async {
    do {
      for (int i = 0; i < textsLength!; i++) {
        await Future.delayed(duration!);
        if (loop!) {
          await goNext();
        } else {
          if (currentIndex != textsLength! - 1) await goNext();
        }
      }

      if (!loop!) continue;
      currentIndex = 0;
      currentTextLength = widget.texts[currentIndex].length;
      showText = widget.texts[currentIndex];
      setState(() {});
    } while (loop!);
  }

  Future<void> goNext() async {
    for (int i = 0; i < currentTextLength!; i++) {
      showText =
          showText!.replaceRange(i, i + 1, words![genrateRandom(wordsLength!)]);
      await Future.delayed(charDuration!);
      setState(() {});
    }
    if (currentIndex != textsLength! - 1) {
      currentIndex++;
      currentTextLength = texts[currentIndex].length;
      await incDecText();
    } else {
      currentIndex = 0;
      currentTextLength = texts[currentIndex].length;
      await incDecText();
    }
  }

  Future<void> incDecText() async {
    if (showText!.length > currentTextLength!) {
      showText = showText!.substring(0, currentTextLength);
    } else {
      while (currentTextLength != showText!.length) {
        showText = '$showText${words![genrateRandom(wordsLength!)]}';
        setState(() {});
        await Future.delayed(charDuration!);
      }
    }
    for (int i = 0; i < currentTextLength!; i++) {
      showText = showText!.replaceRange(i, i + 1, texts[currentIndex][i]);
      await Future.delayed(charDuration!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      showText!,
      style: widget.style,
    );
  }
}
