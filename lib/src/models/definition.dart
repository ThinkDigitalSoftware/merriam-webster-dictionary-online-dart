// To parse this JSON data, do
//
//     final definition = definitionFromJson(jsonString);

import 'dart:convert';

List<Definition> definitionsFromJson(String str) =>
    List<Definition>.from(json.decode(str).map((x) => Definition.fromJson(x)));

String definitionToJson(List<Definition> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Definition {
  final Meta meta;
  final Hwi hwi;

  /// The functional label describes the grammatical function of a headword or
  /// undefined entry word, such as "noun" or "adjective".
  final String functionLabel;

  /// The definition section groups together all the sense sequences and
  /// verb dividers for a headword or defined run-on phrase.
  final List<Def> def;
  final List<Uro> uros;
  final List<List<String>> et;
  final String date;
  final List<String> shortdef;

  Definition({
    this.meta,
    this.hwi,
    this.functionLabel,
    this.def,
    this.uros,
    this.et,
    this.date,
    this.shortdef,
  });

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        meta: Meta.fromJson(json["meta"]),
        hwi: Hwi.fromJson(json["hwi"]),
        functionLabel: json["fl"],
        def: List<Def>.from(json["def"].map((x) => Def.fromJson(x))),
        uros: List<Uro>.from(json["uros"].map((x) => Uro.fromJson(x))),
        et: List<List<String>>.from(
            json["et"].map((x) => List<String>.from(x.map((x) => x)))),
        date: json["date"],
        shortdef: List<String>.from(json["shortdef"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "hwi": hwi.toJson(),
        "fl": functionLabel,
        "def": List<dynamic>.from(def.map((x) => x.toJson())),
        "uros": List<dynamic>.from(uros.map((x) => x.toJson())),
        "et": List<dynamic>.from(
            et.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "date": date,
        "shortdef": List<dynamic>.from(shortdef.map((x) => x)),
      };
}

class Def {
  final List<List<List<dynamic>>> sseq;

  Def({
    this.sseq,
  });

  factory Def.fromJson(Map<String, dynamic> json) => Def(
        sseq: List<List<List<dynamic>>>.from(json["sseq"].map((x) =>
            List<List<dynamic>>.from(
                x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
      );

  Map<String, dynamic> toJson() => {
        "sseq": List<dynamic>.from(sseq.map((x) => List<dynamic>.from(
            x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
      };
}

class SseqClass {
  final String sn;
  final List<List<dynamic>> dt;
  final Sdsense sdsense;

  SseqClass({
    this.sn,
    this.dt,
    this.sdsense,
  });

  factory SseqClass.fromJson(Map<String, dynamic> json) => SseqClass(
        sn: json["sn"],
        dt: List<List<dynamic>>.from(
            json["dt"].map((x) => List<dynamic>.from(x.map((x) => x)))),
        sdsense:
            json["sdsense"] == null ? null : Sdsense.fromJson(json["sdsense"]),
      );

  Map<String, dynamic> toJson() => {
        "sn": sn,
        "dt": List<dynamic>.from(
            dt.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "sdsense": sdsense == null ? null : sdsense.toJson(),
      };
}

class DtClass {
  final String t;

  DtClass({
    this.t,
  });

  factory DtClass.fromJson(Map<String, dynamic> json) => DtClass(
        t: json["t"],
      );

  Map<String, dynamic> toJson() => {
        "t": t,
      };
}

class Sdsense {
  final String sd;
  final List<List<dynamic>> dt;

  Sdsense({
    this.sd,
    this.dt,
  });

  factory Sdsense.fromJson(Map<String, dynamic> json) => Sdsense(
        sd: json["sd"],
        dt: List<List<dynamic>>.from(
            json["dt"].map((x) => List<dynamic>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "sd": sd,
        "dt": List<dynamic>.from(
            dt.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Hwi {
  final String hw;
  final List<Pr> prs;

  Hwi({
    this.hw,
    this.prs,
  });

  factory Hwi.fromJson(Map<String, dynamic> json) => Hwi(
        hw: json["hw"],
        prs: List<Pr>.from(json["prs"].map((x) => Pr.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hw": hw,
        "prs": List<dynamic>.from(prs.map((x) => x.toJson())),
      };
}

class Pr {
  final String mw;
  final Sound sound;

  Pr({
    this.mw,
    this.sound,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
        mw: json["mw"],
        sound: Sound.fromJson(json["sound"]),
      );

  Map<String, dynamic> toJson() => {
        "mw": mw,
        "sound": sound.toJson(),
      };
}

class Sound {
  final String audio;
  final String ref;
  final String stat;

  Sound({
    this.audio,
    this.ref,
    this.stat,
  });

  factory Sound.fromJson(Map<String, dynamic> json) => Sound(
        audio: json["audio"],
        ref: json["ref"],
        stat: json["stat"],
      );

  Map<String, dynamic> toJson() => {
        "audio": audio,
        "ref": ref,
        "stat": stat,
      };
}

class Meta {
  final String id;
  final String uuid;
  final String sort;
  final String src;
  final String section;
  final List<String> stems;
  final bool offensive;

  Meta({
    this.id,
    this.uuid,
    this.sort,
    this.src,
    this.section,
    this.stems,
    this.offensive,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        id: json["id"],
        uuid: json["uuid"],
        sort: json["sort"],
        src: json["src"],
        section: json["section"],
        stems: List<String>.from(json["stems"].map((x) => x)),
        offensive: json["offensive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "sort": sort,
        "src": src,
        "section": section,
        "stems": List<dynamic>.from(stems.map((x) => x)),
        "offensive": offensive,
      };
}

class Uro {
  final String ure;
  final String fl;

  Uro({
    this.ure,
    this.fl,
  });

  factory Uro.fromJson(Map<String, dynamic> json) => Uro(
        ure: json["ure"],
        fl: json["fl"],
      );

  Map<String, dynamic> toJson() => {
        "ure": ure,
        "fl": fl,
      };
}

class Pronunciation {
//  final String syllabic;
  final String vocalPronunciation;
  final String pronunciationURL;
  final Pr pr;

  Pronunciation({this.vocalPronunciation, this.pronunciationURL, this.pr});

  factory Pronunciation.fromPr(Pr pr) {
    return Pronunciation(
      vocalPronunciation: pr.mw,
      pronunciationURL:
          "https://media.merriam-webster.com/sound${pr.sound.ref}${pr.sound.stat}1/${pr.sound.audio[0]}/${pr.sound.audio}.wav",
    );
  }
}
