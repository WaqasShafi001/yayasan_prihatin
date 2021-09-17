import 'dart:convert';

UpdatePrihatin updatePrihatinFromJson(String str) => UpdatePrihatin.fromJson(json.decode(str));

String updatePrihatinToJson(UpdatePrihatin data) => json.encode(data.toJson());

class UpdatePrihatin {
    UpdatePrihatin({
        this.result,
        this.status,
    });

    List<Result> result;
    String status;

    factory UpdatePrihatin.fromJson(Map<String, dynamic> json) => UpdatePrihatin(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "status": status,
    };
}

class Result {
    Result({
        this.id,
        this.author,
        this.articleDate,
        this.blockTitle,
        this.truncatedText,
        this.fullText,
        this.imgUrl,
    });

    String id;
    String author;
    DateTime articleDate;
    String blockTitle;
    String truncatedText;
    String fullText;
    String imgUrl;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        author: json["author"],
        articleDate: DateTime.parse(json["article_date"]),
        blockTitle: json["block_title"],
        truncatedText: json["truncated_text"],
        fullText: json["full_text"],
        imgUrl: json["img_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "article_date": articleDate.toIso8601String(),
        "block_title": blockTitle,
        "truncated_text": truncatedText,
        "full_text": fullText,
        "img_url": imgUrl,
    };
}
