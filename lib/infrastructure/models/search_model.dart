
import 'dart:convert';

import 'package:test_pragma/infrastructure/models/cat_model.dart';

List<Breed> breedFromJson(String str) => List<Breed>.from(json.decode(str).map((x) => Breed.fromJson(x)));

String breedToJson(List<Breed> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Breed {
    List<CatModel>? breeds;
    String? id;
    String? url;
    int? width;
    int? height;

    Breed({
        this.breeds,
        this.id,
        this.url,
        this.width,
        this.height,
    });

    factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        breeds: json["breeds"] == null ? [] : List<CatModel>.from(json["breeds"]!.map((x) => CatModel.fromJson(x))),
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "breeds": breeds == null ? [] : List<dynamic>.from(breeds!.map((x) => x.toJson())),
        "id": id,
        "url": url,
        "width": width,
        "height": height,
    };
}
class Weight {
    String? imperial;
    String? metric;

    Weight({
        this.imperial,
        this.metric,
    });

    factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };
}
