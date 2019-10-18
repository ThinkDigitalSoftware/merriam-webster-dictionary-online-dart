import 'package:merriam_webster_dictionary_online/src/models/definition.dart';

/// A standard dictionary definition as experienced by the end user
/// containing the different definitions and other elements that make up a dictionary entry.
///
///
/// Formatting symbols used in definitions:
///
/// {b}string{/b}  display text in bold
///
/// {bc}  output a bold colon and a space
///
/// {inf}string{/inf}  display text in subscript
///
/// {it}string{/it}  display text in italics
///
/// {ldquo}  output a left double quote character (U+201C)
///
/// {rdquo}  output a right double quote character (U+201D)
///
/// {sc}string{/sc}  display text in small capitals
///
/// {sup}string{\/sup}  display text in superscript
class DictionaryEntry {
  final String word;
  final String definition;
  final String partOfSpeech;
  final String syllabicRepresentation;
  final List<Pronunciation> pronunciation;

  DictionaryEntry({
    this.word,
    this.definition,
    this.partOfSpeech,
    this.syllabicRepresentation,
    this.pronunciation,
  });
}
