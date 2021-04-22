// To parse this JSON data, do
//
//     final items = itemsFromJson(jsonString);

import 'dart:convert';

List<Items> itemsFromJson(String str) => List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

String itemsToJson(List<Items> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Items {
  Items({
    this.essay,
    this.placeOfPublication,
    this.startYear,
    this.publisher,
    this.county,
    this.edition,
    this.frequency,
    this.url,
    this.id,
    this.subject,
    this.city,
    this.language,
    this.title,
    this.holdingType,
    this.endYear,
    this.altTitle,
    this.note,
    this.lccn,
    this.state,
    this.place,
    this.country,
    this.type,
    this.titleNormal,
    this.oclc,
  });

  List<String> essay;
  String placeOfPublication;
  int startYear;
  String publisher;
  List<String> county;
  dynamic edition;
  String frequency;
  String url;
  String id;
  List<String> subject;
  List<String> city;
  List<Language> language;
  String title;
  List<HoldingType> holdingType;
  int endYear;
  List<String> altTitle;
  List<String> note;
  String lccn;
  List<String> state;
  List<String> place;
  String country;
  Type type;
  String titleNormal;
  String oclc;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    essay: List<String>.from(json["essay"].map((x) => x)),
    placeOfPublication: json["place_of_publication"],
    startYear: json["start_year"],
    publisher: json["publisher"],
    county: List<String>.from(json["county"].map((x) => x)),
    edition: json["edition"],
    frequency: json["frequency"],
    url: json["url"],
    id: json["id"],
    subject: List<String>.from(json["subject"].map((x) => x)),
    city: List<String>.from(json["city"].map((x) => x)),
    language: List<Language>.from(json["language"].map((x) => languageValues.map[x])),
    title: json["title"],
    holdingType: List<HoldingType>.from(json["holding_type"].map((x) => x == null ? null : holdingTypeValues.map[x])),
    endYear: json["end_year"],
    altTitle: List<String>.from(json["alt_title"].map((x) => x)),
    note: List<String>.from(json["note"].map((x) => x)),
    lccn: json["lccn"],
    state: List<String>.from(json["state"].map((x) => x)),
    place: List<String>.from(json["place"].map((x) => x)),
    country: json["country"],
    type: typeValues.map[json["type"]],
    titleNormal: json["title_normal"],
    oclc: json["oclc"],
  );

  Map<String, dynamic> toJson() => {
    "essay": List<dynamic>.from(essay.map((x) => x)),
    "place_of_publication": placeOfPublication,
    "start_year": startYear,
    "publisher": publisher,
    "county": List<dynamic>.from(county.map((x) => x)),
    "edition": edition,
    "frequency": frequency,
    "url": url,
    "id": id,
    "subject": List<dynamic>.from(subject.map((x) => x)),
    "city": List<dynamic>.from(city.map((x) => x)),
    "language": List<dynamic>.from(language.map((x) => languageValues.reverse[x])),
    "title": title,
    "holding_type": List<dynamic>.from(holdingType.map((x) => x == null ? null : holdingTypeValues.reverse[x])),
    "end_year": endYear,
    "alt_title": List<dynamic>.from(altTitle.map((x) => x)),
    "note": List<dynamic>.from(note.map((x) => x)),
    "lccn": lccn,
    "state": List<dynamic>.from(state.map((x) => x)),
    "place": List<dynamic>.from(place.map((x) => x)),
    "country": country,
    "type": typeValues.reverse[type],
    "title_normal": titleNormal,
    "oclc": oclc,
  };
}

enum HoldingType { UNSPECIFIED, ORIGINAL, MICROFILM_SERVICE_COPY, MICROFILM_MASTER, ONLINE_RESOURCE }

final holdingTypeValues = EnumValues({
  "Microfilm Master": HoldingType.MICROFILM_MASTER,
  "Microfilm Service Copy": HoldingType.MICROFILM_SERVICE_COPY,
  "Online Resource": HoldingType.ONLINE_RESOURCE,
  "Original": HoldingType.ORIGINAL,
  "Unspecified": HoldingType.UNSPECIFIED
});

enum Language { ENGLISH }

final languageValues = EnumValues({
  "English": Language.ENGLISH
});

enum Type { TITLE }

final typeValues = EnumValues({
  "title": Type.TITLE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
