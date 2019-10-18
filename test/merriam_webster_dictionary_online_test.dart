import 'dart:convert';
import 'dart:io';

import 'package:merriam_webster_dictionary_online/merriam_webster_dictionary_online.dart';
import 'package:merriam_webster_dictionary_online/src/models/definition.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Dictionary dictionary;
    final String demoApiKey = "8624555d-d304-9344-9093-a0b2c5f20161";
    var json;
    Definition definition;

    setUp(() {
      dictionary = Dictionary(apiKey: demoApiKey);
      var rawJson =
          File('${Directory.current.path}/test/sample_definition.json')
              .readAsStringSync();
      definition = definitionsFromJson(rawJson).first;
    });

    test('First Test', () {});
  });
}
