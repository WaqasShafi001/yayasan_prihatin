class Postcode {
    Postcode({
        this.result,
    });

    List<Result> result;

    factory Postcode.fromJson(Map<String, dynamic> json) => Postcode(
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.postcode,
        this.city,
        this.statecode,
        this.statename,
        this.isactive,
    });

    String id;
    String postcode;
    String city;
    String statecode;
    String statename;
    String isactive;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        postcode: json["postcode"],
        city: json["city"],
        statecode: json["statecode"],
        statename: json["statename"],
        isactive: json["isactive"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "postcode": postcode,
        "city": city,
        "statecode": statecode,
        "statename": statename,
        "isactive": isactive,
    };
}
