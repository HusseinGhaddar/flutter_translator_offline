// ignore_for_file: equal_keys_in_map

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LanguageTranslatorPage(),
    );
  }
}

class LanguageTranslatorPage extends StatefulWidget {
  const LanguageTranslatorPage({super.key});

  @override
  State<LanguageTranslatorPage> createState() => _LanguageTranslatorPageState();
}

class _LanguageTranslatorPageState extends State<LanguageTranslatorPage> {
  final TextEditingController _controllerPhrase = TextEditingController();

  // Language options
  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'Arabic',
    'Japanese'
  ];

  String? _sourceLanguage;
  String? _targetLanguage;
  String? _translatedText;
  bool _showList = false;

  final Map<String, Map<String, String>> _translations = {
    // Greetings
    'Hello': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },
    'hello': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },
    'Hola': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },
    'hola': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },
    'Bonjour': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },
    'bonjour': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },
    'مرحبا': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },
    'こんにちは': {
      'English': 'Hello',
      'Spanish': 'Hola',
      'French': 'Bonjour',
      'Arabic': 'مرحبا',
      'Japanese': 'こんにちは'
    },

    // Thank You
    'Thank you': {
      'English': 'Thank you',
      'Spanish': 'Gracias',
      'French': 'Merci',
      'Arabic': 'شكرا',
      'Japanese': 'ありがとう'
    },
    'thank you': {
      'English': 'Thank you',
      'Spanish': 'Gracias',
      'French': 'Merci',
      'Arabic': 'شكرا',
      'Japanese': 'ありがとう'
    },
    'gracias': {
      'English': 'Thank you',
      'Spanish': 'Gracias',
      'French': 'Merci',
      'Arabic': 'شكرا',
      'Japanese': 'ありがとう'
    },
    'Gracias': {
      'English': 'Thank you',
      'Spanish': 'Gracias',
      'French': 'Merci',
      'Arabic': 'شكرا',
      'Japanese': 'ありがとう'
    },
    'Merci': {
      'English': 'Thank you',
      'Spanish': 'Gracias',
      'French': 'Merci',
      'Arabic': 'شكرا',
      'Japanese': 'ありがとう'
    },
    'شكرا': {
      'English': 'Thank you',
      'Spanish': 'Gracias',
      'French': 'Merci',
      'Arabic': 'شكرا',
      'Japanese': 'ありがとう'
    },
    'ありがとう': {
      'English': 'Thank you',
      'Spanish': 'Gracias',
      'French': 'Merci',
      'Arabic': 'شكرا',
      'Japanese': 'ありがとう'
    },

    // Goodbye
    'Goodbye': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },
    'goodbye': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },
    'Adiós': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },
    'adiós': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },
    'Au revoir': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },
    'au revoir': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },
    'مع السلامة': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },
    'さようなら': {
      'English': 'Goodbye',
      'Spanish': 'Adiós',
      'French': 'Au revoir',
      'Arabic': 'مع السلامة',
      'Japanese': 'さようなら'
    },

    // Please
    'Please': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaît',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },
    'please': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaít',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },
    'Por favor': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaît',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },
    'por favor': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaít',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },
    'S\'il vous plaît': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaît',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },
    's\'il vous plaît': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaít',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },
    'من فضلك': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaît',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },
    'お願いします': {
      'English': 'Please',
      'Spanish': 'Por favor',
      'French': 'S\'il vous plaît',
      'Arabic': 'من فضلك',
      'Japanese': 'お願いします'
    },

    // Yes
    'Yes': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },
    'yes': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },
    'Sí': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },
    'sí': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },
    'Oui': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },
    'oui': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },
    'نعم': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },
    'はい': {
      'English': 'Yes',
      'Spanish': 'Sí',
      'French': 'Oui',
      'Arabic': 'نعم',
      'Japanese': 'はい'
    },

    // No
    'No': {
      'English': 'No',
      'Spanish': 'No',
      'French': 'Non',
      'Arabic': 'لا',
      'Japanese': 'いいえ'
    },
    'no': {
      'English': 'No',
      'Spanish': 'No',
      'French': 'Non',
      'Arabic': 'لا',
      'Japanese': 'いいえ'
    },
    'Non': {
      'English': 'No',
      'Spanish': 'No',
      'French': 'Non',
      'Arabic': 'لا',
      'Japanese': 'いいえ'
    },
    'non': {
      'English': 'No',
      'Spanish': 'No',
      'French': 'Non',
      'Arabic': 'لا',
      'Japanese': 'いいえ'
    },
    'لا': {
      'English': 'No',
      'Spanish': 'No',
      'French': 'Non',
      'Arabic': 'لا',
      'Japanese': 'いいえ'
    },
    'いいえ': {
      'English': 'No',
      'Spanish': 'No',
      'French': 'Non',
      'Arabic': 'لا',
      'Japanese': 'いいえ'
    },

    // Excuse me
    'Excuse me': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },
    'excuse me': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },
    'Disculpe': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },
    'disculpe': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },
    'Excusez-moi': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },
    'excusez-moi': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },
    'عفوا': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },
    'すみません': {
      'English': 'Excuse me',
      'Spanish': 'Disculpe',
      'French': 'Excusez-moi',
      'Arabic': 'عفوا',
      'Japanese': 'すみません'
    },

    // Prepositions
    'In': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },
    'in': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },
    'En': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },
    'en': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },
    'Dans': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },
    'dans': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },
    'في': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },
    '中に': {
      'English': 'In',
      'Spanish': 'En',
      'French': 'Dans',
      'Arabic': 'في',
      'Japanese': '中に'
    },

    'On': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },
    'on': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },
    'Sobre': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },
    'sobre': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },
    'Sur': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },
    'sur': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },
    'على': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },
    '上に': {
      'English': 'On',
      'Spanish': 'Sobre',
      'French': 'Sur',
      'Arabic': 'على',
      'Japanese': '上に'
    },

    'At': {
      'English': 'At',
      'Spanish': 'En',
      'French': 'À',
      'Arabic': ' عند',
      'Japanese': 'で'
    },
    'at': {
      'English': 'At',
      'Spanish': 'En',
      'French': 'À',
      'Arabic': 'عند',
      'Japanese': 'で'
    },
    'À': {
      'English': 'At',
      'Spanish': 'En',
      'French': 'À',
      'Arabic': 'عند',
      'Japanese': 'で'
    },
    'à': {
      'English': 'At',
      'Spanish': 'En',
      'French': 'À',
      'Arabic': 'عند',
      'Japanese': 'で'
    },
    'عند': {
      'English': 'At',
      'Spanish': 'En',
      'French': 'À',
      'Arabic': 'عند',
      'Japanese': 'で'
    },
    'で': {
      'English': 'At',
      'Spanish': 'En',
      'French': 'À',
      'Arabic': 'عند',
      'Japanese': 'で'
    },

    'With': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },
    'with': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },
    'Con': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },
    'con': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },
    'Avec': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },
    'avec': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },
    'مع': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },
    'と一緒に': {
      'English': 'With',
      'Spanish': 'Con',
      'French': 'Avec',
      'Arabic': 'مع',
      'Japanese': 'と一緒に'
    },

    'For': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },
    'for': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },
    'Para': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },
    'para': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },
    'Pour': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },
    'pour': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },
    'لـ': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },
    'ために': {
      'English': 'For',
      'Spanish': 'Para',
      'French': 'Pour',
      'Arabic': 'لـ',
      'Japanese': 'ために'
    },

    // Articles
    'The': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },
    'the': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },
    'El': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },
    'el': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },
    'Le': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },
    'le': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },
    'ال': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },
    'その': {
      'English': 'The',
      'Spanish': 'El',
      'French': 'Le',
      'Arabic': 'ال',
      'Japanese': 'その'
    },

    'A': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'a': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'Un': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'un': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'Un': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'un': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'واحد': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    '一つ': {
      'English': 'A',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },

    'An': {
      'English': 'An',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'an': {
      'English': 'An',
      'Spanish': 'Un',
      'French': 'Un',
      'Arabic': 'واحد',
      'Japanese': '一つ'
    },
    'Este': {
      'English': 'This',
      'Spanish': 'Este',
      'French': 'Ce',
      'Arabic': 'هذا',
      'Japanese': 'これ'
    },
    'este': {
      'English': 'This',
      'Spanish': 'Este',
      'French': 'Ce',
      'Arabic': 'هذا',
      'Japanese': 'これ'
    },
    'Ce': {
      'English': 'This',
      'Spanish': 'Este',
      'French': 'Ce',
      'Arabic': 'هذا',
      'Japanese': 'これ'
    },
    'ce': {
      'English': 'This',
      'Spanish': 'Este',
      'French': 'Ce',
      'Arabic': 'هذا',
      'Japanese': 'これ'
    },
    'هذا': {
      'English': 'This',
      'Spanish': 'Este',
      'French': 'Ce',
      'Arabic': 'هذا',
      'Japanese': 'これ'
    },
    'これ': {
      'English': 'This',
      'Spanish': 'Este',
      'French': 'Ce',
      'Arabic': 'هذا',
      'Japanese': 'これ'
    },

    'That': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },
    'that': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },
    'Eso': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },
    'eso': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },
    'Cela': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },
    'cela': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },
    'ذلك': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },
    'それ': {
      'English': 'That',
      'Spanish': 'Eso',
      'French': 'Cela',
      'Arabic': 'ذلك',
      'Japanese': 'それ'
    },

    'These': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },
    'these': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },
    'Estos': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },
    'estos': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },
    'Ces': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },
    'ces': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },
    'هؤلاء': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },
    'これら': {
      'English': 'These',
      'Spanish': 'Estos',
      'French': 'Ces',
      'Arabic': 'هؤلاء',
      'Japanese': 'これら'
    },

    'Those': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },
    'those': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },
    'Esos': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },
    'esos': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },
    'Ceux': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },
    'ceux': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },
    'أولئك': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },
    'それら': {
      'English': 'Those',
      'Spanish': 'Esos',
      'French': 'Ceux',
      'Arabic': 'أولئك',
      'Japanese': 'それら'
    },

    // Pronouns
    'I': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'i': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'Yo': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'yo': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'Je': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'je': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'أنا': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    '私': {
      'English': 'I',
      'Spanish': 'Yo',
      'French': 'Je',
      'Arabic': 'أنا',
      'Japanese': '私'
    },

    'You': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },
    'you': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },
    'Tú': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },
    'tú': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },
    'Tu': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },
    'tu': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },
    'أنت': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },
    'あなた': {
      'English': 'You',
      'Spanish': 'Tú',
      'French': 'Tu',
      'Arabic': 'أنت',
      'Japanese': 'あなた'
    },

    'He': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    'he': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    'él': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    'Él': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    'il': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    'Il': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    'é': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    'هو': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },
    '彼': {
      'English': 'He',
      'Spanish': 'Él',
      'French': 'Il',
      'Arabic': 'هو',
      'Japanese': '彼'
    },

    'She': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },
    'she': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },
    'Ella': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },
    'ella': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },
    'Elle': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },
    'elle': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },
    'هي': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },
    '彼女': {
      'English': 'She',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'هي',
      'Japanese': '彼女'
    },

    'We': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'we': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'Nosotros': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'nosotros': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'Nous': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'nous': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'نحن': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    '私たち': {
      'English': 'We',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },

    'They': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'they': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'Ellos': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'ellos': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'Ils': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'ils': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'هم': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    '彼ら': {
      'English': 'They',
      'Spanish': 'Ellos',
      'French': 'Ils',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },

    'Me': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'me': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'Yo': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'yo': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'Moi': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'moi': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    'أنا': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },
    '私': {
      'English': 'Me',
      'Spanish': 'Yo',
      'French': 'Moi',
      'Arabic': 'أنا',
      'Japanese': '私'
    },

    'Him': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },
    'him': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },
    'él': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },
    'Él': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },
    'lui': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },
    'Lui': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },
    'له': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },
    '彼': {
      'English': 'Him',
      'Spanish': 'Él',
      'French': 'Lui',
      'Arabic': 'له',
      'Japanese': '彼'
    },

    'Her': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },
    'her': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },
    'Ella': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },
    'ella': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },
    'Elle': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },
    'elle': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },
    'لها': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },
    '彼女': {
      'English': 'Her',
      'Spanish': 'Ella',
      'French': 'Elle',
      'Arabic': 'لها',
      'Japanese': '彼女'
    },

    'Us': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'us': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'Nosotros': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'nosotros': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'Nous': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'nous': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    'نحن': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },
    '私たち': {
      'English': 'Us',
      'Spanish': 'Nosotros',
      'French': 'Nous',
      'Arabic': 'نحن',
      'Japanese': '私たち'
    },

    'Them': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'them': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'Ellos': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'ellos': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'Eux': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'eux': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    'هم': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },
    '彼ら': {
      'English': 'Them',
      'Spanish': 'Ellos',
      'French': 'Eux',
      'Arabic': 'هم',
      'Japanese': '彼ら'
    },

    'Be': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },
    'be': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },
    'Ser': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },
    'ser': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },
    'Être': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },
    'Être': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },
    'يكون': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },
    'です': {
      'English': 'Be',
      'Spanish': 'Ser',
      'French': 'Être',
      'Arabic': 'يكون',
      'Japanese': 'です'
    },

    'Have': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },
    'have': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },
    'Tener': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },
    'tener': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },
    'Avoir': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },
    'avoir': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },
    'لديك': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },
    '持つ': {
      'English': 'Have',
      'Spanish': 'Tener',
      'French': 'Avoir',
      'Arabic': 'لديك',
      'Japanese': '持つ'
    },

    'Do': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },
    'do': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },
    'Hacer': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },
    'hacer': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },
    'Faire': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },
    'faire': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },
    'يفعل': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },
    'する': {
      'English': 'Do',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يفعل',
      'Japanese': 'する'
    },

    'Say': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },
    'say': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },
    'Decir': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },
    'decir': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },
    'Dire': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },
    'dire': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },
    'يقول': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },
    '言う': {
      'English': 'Say',
      'Spanish': 'Decir',
      'French': 'Dire',
      'Arabic': 'يقول',
      'Japanese': '言う'
    },

    'Get': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },
    'get': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },
    'Conseguir': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },
    'conseguir': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },
    'Obtenir': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },
    'obtenir': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },
    'يحصل على': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },
    '得る': {
      'English': 'Get',
      'Spanish': 'Conseguir',
      'French': 'Obtenir',
      'Arabic': 'يحصل على',
      'Japanese': '得る'
    },

    'Go': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },
    'go': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },
    'Ir': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },
    'ir': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },
    'Aller': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },
    'aller': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },
    'يذهب': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },
    '行く': {
      'English': 'Go',
      'Spanish': 'Ir',
      'French': 'Aller',
      'Arabic': 'يذهب',
      'Japanese': '行く'
    },

    'Come': {
      'English': 'Come',
      'Spanish': 'Venir',
      'French': 'Venir',
      'Arabic': 'يأتي',
      'Japanese': '来る'
    },
    'come': {
      'English': 'Come',
      'Spanish': 'Venir',
      'French': 'Venir',
      'Arabic': 'يأتي',
      'Japanese': '来る'
    },
    'venir': {
      'English': 'Come',
      'Spanish': 'Venir',
      'French': 'Venir',
      'Arabic': 'يأتي',
      'Japanese': '来る'
    },
    'Venir': {
      'English': 'Come',
      'Spanish': 'Venir',
      'French': 'Venir',
      'Arabic': 'يأتي',
      'Japanese': '来る'
    },
    'يأتي': {
      'English': 'Come',
      'Spanish': 'Venir',
      'French': 'Venir',
      'Arabic': 'يأتي',
      'Japanese': '来る'
    },
    '来る': {
      'English': 'Come',
      'Spanish': 'Venir',
      'French': 'Venir',
      'Arabic': 'يأتي',
      'Japanese': '来る'
    },

    'See': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },
    'see': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },
    'Ver': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },
    'ver': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },
    'Voir': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },
    'voir': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },
    'يرى': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },
    '見る': {
      'English': 'See',
      'Spanish': 'Ver',
      'French': 'Voir',
      'Arabic': 'يرى',
      'Japanese': '見る'
    },

    'Want': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },
    'want': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },
    'Querer': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },
    'querer': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },
    'Vouloir': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },
    'vouloir': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },
    'يريد': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },
    '欲しい': {
      'English': 'Want',
      'Spanish': 'Querer',
      'French': 'Vouloir',
      'Arabic': 'يريد',
      'Japanese': '欲しい'
    },

    'Make': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },
    'make': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },
    'Hacer': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },
    'hacer': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },
    'Faire': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },
    'faire': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },
    'يصنع': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },
    '作る': {
      'English': 'Make',
      'Spanish': 'Hacer',
      'French': 'Faire',
      'Arabic': 'يصنع',
      'Japanese': '作る'
    },

    'Take': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },
    'take': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },
    'Tomar': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },
    'tomar': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },
    'Prendre': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },
    'prendre': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },
    'يأخذ': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },
    '取る': {
      'English': 'Take',
      'Spanish': 'Tomar',
      'French': 'Prendre',
      'Arabic': 'يأخذ',
      'Japanese': '取る'
    },

    // Common Nouns
    'Time': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },
    'time': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },
    'Tiempo': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },
    'tiempo': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },
    'Temps': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },
    'temps': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },
    'وقت': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },
    '時間': {
      'English': 'Time',
      'Spanish': 'Tiempo',
      'French': 'Temps',
      'Arabic': 'وقت',
      'Japanese': '時間'
    },

    'Person': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },
    'person': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },
    'Persona': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },
    'persona': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },
    'Personne': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },
    'personne': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },
    'شخص': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },
    '人': {
      'English': 'Person',
      'Spanish': 'Persona',
      'French': 'Personne',
      'Arabic': 'شخص',
      'Japanese': '人'
    },

    'Year': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },
    'year': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },
    'Año': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },
    'ano': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },
    'An': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },
    'an': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },
    'سنة': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },
    '年': {
      'English': 'Year',
      'Spanish': 'Año',
      'French': 'An',
      'Arabic': 'سنة',
      'Japanese': '年'
    },

    'Way': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },
    'way': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },
    'Camino': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },
    'chemin': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },
    'Chemin': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },
    'chemin': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },
    'طريقة': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },
    '道': {
      'English': 'Way',
      'Spanish': 'Camino',
      'French': 'Chemin',
      'Arabic': 'طريقة',
      'Japanese': '道'
    },

    'Man': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },
    'man': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },
    'Hombre': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },
    'hombre': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },
    'Homme': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },
    'homme': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },
    'رجل': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },
    '男': {
      'English': 'Man',
      'Spanish': 'Hombre',
      'French': 'Homme',
      'Arabic': 'رجل',
      'Japanese': '男'
    },

    'Woman': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },
    'woman': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },
    'Mujer': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },
    'mujer': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },
    'Femme': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },
    'femme': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },
    'امرأة': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },
    '女性': {
      'English': 'Woman',
      'Spanish': 'Mujer',
      'French': 'Femme',
      'Arabic': 'امرأة',
      'Japanese': '女性'
    },

    'Child': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },
    'child': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },
    'niño': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },
    'Niño': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },
    'Enfant': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },
    'enfant': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },
    'طفل': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },
    '子供': {
      'English': 'Child',
      'Spanish': 'Niño',
      'French': 'Enfant',
      'Arabic': 'طفل',
      'Japanese': '子供'
    },

    'House': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },
    'house': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },
    'Casa': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },
    'casa': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },
    'Maison': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },
    'maison': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },
    'منزل': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },
    '家': {
      'English': 'House',
      'Spanish': 'Casa',
      'French': 'Maison',
      'Arabic': 'منزل',
      'Japanese': '家'
    },

    'Car': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },
    'car': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },
    'Coche': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },
    'coche': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },
    'Voiture': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },
    'voiture': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },
    'سيارة': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },
    '車': {
      'English': 'Car',
      'Spanish': 'Coche',
      'French': 'Voiture',
      'Arabic': 'سيارة',
      'Japanese': '車'
    },

    'City': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },
    'city': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },
    'Ciudad': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },
    'ciudad': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },
    'Ville': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },
    'ville': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },
    'مدينة': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },
    '都市': {
      'English': 'City',
      'Spanish': 'Ciudad',
      'French': 'Ville',
      'Arabic': 'مدينة',
      'Japanese': '都市'
    },

    // Common Adjectives
    'Good': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },
    'good': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },
    'Bueno': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },
    'bueno': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },
    'Bon': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },
    'bon': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },
    'جيد': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },
    '良い': {
      'English': 'Good',
      'Spanish': 'Bueno',
      'French': 'Bon',
      'Arabic': 'جيد',
      'Japanese': '良い'
    },

    'New': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },
    'new': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },
    'Nuevo': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },
    'nuevo': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },
    'Nouveau': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },
    'nouveau': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },
    'جديد': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },
    '新しい': {
      'English': 'New',
      'Spanish': 'Nuevo',
      'French': 'Nouveau',
      'Arabic': 'جديد',
      'Japanese': '新しい'
    },

    'First': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },
    'first': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },
    'Primero': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },
    'primero': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },
    'Premier': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },
    'premier': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },
    'أول': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },
    '最初': {
      'English': 'First',
      'Spanish': 'Primero',
      'French': 'Premier',
      'Arabic': 'أول',
      'Japanese': '最初'
    },

    'Last': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },
    'last': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },
    'Último': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },
    'último': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },
    'Dernier': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },
    'dernier': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },
    'آخر': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },
    '最後': {
      'English': 'Last',
      'Spanish': 'Último',
      'French': 'Dernier',
      'Arabic': 'آخر',
      'Japanese': '最後'
    },

    'Big': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },
    'big': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },
    'Grande': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },
    'grande': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },
    'Grand': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },
    'grand': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },
    'كبير': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },
    '大きい': {
      'English': 'Big',
      'Spanish': 'Grande',
      'French': 'Grand',
      'Arabic': 'كبير',
      'Japanese': '大きい'
    },

    'Small': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },
    'small': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },
    'Pequeño': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },
    'pequeño': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },
    'Petit': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },
    'petit': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },
    'صغير': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },
    '小さい': {
      'English': 'Small',
      'Spanish': 'Pequeño',
      'French': 'Petit',
      'Arabic': 'صغير',
      'Japanese': '小さい'
    },

    'Happy': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },
    'happy': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },
    'Feliz': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },
    'feliz': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },
    'Heureux': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },
    'heureux': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },
    'سعيد': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },
    '幸せ': {
      'English': 'Happy',
      'Spanish': 'Feliz',
      'French': 'Heureux',
      'Arabic': 'سعيد',
      'Japanese': '幸せ'
    },

    'Sad': {
      'English': 'Sad',
      'Spanish': 'Triste',
      'French': 'Triste',
      'Arabic': 'حزين',
      'Japanese': '悲しい'
    },
    'sad': {
      'English': 'Sad',
      'Spanish': 'Triste',
      'French': 'Triste',
      'Arabic': 'حزين',
      'Japanese': '悲しい'
    },
    'Triste': {
      'English': 'Sad',
      'Spanish': 'Triste',
      'French': 'Triste',
      'Arabic': 'حزين',
      'Japanese': '悲しい'
    },
    'triste': {
      'English': 'Sad',
      'Spanish': 'Triste',
      'French': 'Triste',
      'Arabic': 'حزين',
      'Japanese': '悲しい'
    },
    'حزين': {
      'English': 'Sad',
      'Spanish': 'Triste',
      'French': 'Triste',
      'Arabic': 'حزين',
      'Japanese': '悲しい'
    },
    '悲しい': {
      'English': 'Sad',
      'Spanish': 'Triste',
      'French': 'Triste',
      'Arabic': 'حزين',
      'Japanese': '悲しい'
    },

    'Hot': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },
    'hot': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },
    'Caliente': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },
    'caliente': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },
    'Chaud': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },
    'chaud': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },
    'حار': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },
    '暑い': {
      'English': 'Hot',
      'Spanish': 'Caliente',
      'French': 'Chaud',
      'Arabic': 'حار',
      'Japanese': '暑い'
    },

    'Cold': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },
    'cold': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },
    'Frío': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },
    'frío': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },
    'Froid': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },
    'froid': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },
    'بارد': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },
    '寒い': {
      'English': 'Cold',
      'Spanish': 'Frío',
      'French': 'Froid',
      'Arabic': 'بارد',
      'Japanese': '寒い'
    },

    'Tree': {
      'English': 'Tree',
      'English': 'tree',
      'Spanish': 'Arbol',
      'Spanish': 'tree',
      'French': 'Arbre',
      'French': 'arbre',
      'Arabic': 'شجرة',
      'Japanese': '木',
    },
    'tree': {
      'English': 'Tree',
      'English': 'tree',
      'Spanish': 'Arbol',
      'Spanish': 'tree',
      'French': 'Arbre',
      'French': 'arbre',
      'Arabic': 'شجرة',
      'Japanese': '木',
    },
  };

  @override
  void dispose() {
    _controllerPhrase.dispose();
    super.dispose();
  }

  void _translate() {
    final inputPhrase = _controllerPhrase.text;
    if (_sourceLanguage != null &&
        _targetLanguage != null &&
        _translations.containsKey(inputPhrase)) {
      setState(() {
        _translatedText =
            _translations[inputPhrase]?[_targetLanguage!] ?? 'Not Found';
      });
    } else {
      setState(() {
        _translatedText = 'Translation not available!';
      });
    }
  }

  void _openPage2() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TranslatedListView(
        phrases: _translations.keys.toList(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Word Language Translator',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Set font to Lato
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 71, 192, 166),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _openPage2,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://your-image-url.com/image.jpg'),
            fit:
                BoxFit.cover, // Adjust the image to cover the entire background
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DropdownMenus
              Center(
                child: DropdownButton<String>(
                  alignment: Alignment.center,
                  hint: const Text('From'),
                  value: _sourceLanguage,
                  items: _languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(lang),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _sourceLanguage = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                  child: DropdownButton<String>(
                alignment: Alignment.center,
                hint: const Text('To'),
                value: _targetLanguage,
                items: _languages.map((lang) {
                  return DropdownMenuItem(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _targetLanguage = value;
                  });
                },
              )),
              const SizedBox(height: 20),

              // Input field
              TextField(
                controller: _controllerPhrase,
                decoration: const InputDecoration(
                  labelText: 'Enter Phrase',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // Translation button
              Center(
                child: ElevatedButton(
                  onPressed: _translate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                        71, 192, 166, 1.0), // Set button background color
                  ),
                  child: const Text(
                    'Translate',
                    style: TextStyle(
                      color: Colors.black, // Set text color to black
                      fontWeight: FontWeight.bold, // Make text bold
                      fontFamily:
                          'Lato', // Replace with the font you want to use
                      fontSize: 18, // Optional: adjust the font size
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Checkbox for extra feature
              Row(
                children: [
                  Checkbox(
                    value: _showList,
                    onChanged: (value) {
                      setState(() {
                        _showList = value!;
                      });
                    },
                  ),
                  const Text('Show All Phrases'),
                ],
              ),

              // Display translated text
              if (_translatedText != null) ...[
                const SizedBox(height: 20),
                Text(
                  'Translation: $_translatedText',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],

              // List of phrases (optional)
              if (_showList)
                Expanded(
                  child: ListView.builder(
                    itemCount: _translations.keys.length,
                    itemBuilder: (context, index) {
                      final phrase = _translations.keys.elementAt(index);
                      return ListTile(
                        title: Text(phrase),
                        subtitle: Text(
                            _translations[phrase]![_targetLanguage!] ??
                                'Translation unavailable'),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class TranslatedListView extends StatelessWidget {
  final List<String> phrases;

  const TranslatedListView({super.key, required this.phrases});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Phrases'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(phrases[index]),
          );
        },
      ),
    );
  }
}
