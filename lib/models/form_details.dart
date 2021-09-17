import 'dart:convert';

FormDetails formDetailsFromJson(String str) => FormDetails.fromJson(json.decode(str));

String formDetailsToJson(FormDetails data) => json.encode(data.toJson());

class FormDetails {
    FormDetails({
        this.icno,
        this.fullname,
        this.email,
        this.phoneno,
        this.address1,
        this.postcode,
        this.city,
        this.state,
        this.fatheroccup,
        this.motheroccup,
        this.householdincome,
        this.dependentno,
        this.spmyear,
        this.school,
        this.spmresult,
        this.bmresult,
        this.biresult,
        this.mathresult,
        this.histresult,
        this.agreecheck,
    });

    String icno;
    String fullname;
    String email;
    String phoneno;
    String address1;
    String postcode;
    String city;
    String state;
    String fatheroccup;
    String motheroccup;
    String householdincome;
    String dependentno;
    String spmyear;
    String school;
    String spmresult;
    String bmresult;
    String biresult;
    String mathresult;
    String histresult;
    String agreecheck;

    factory FormDetails.fromJson(Map<String, dynamic> json) => FormDetails(
        icno: json["icno"],
        fullname: json["fullname"],
        email: json["email"],
        phoneno: json["phoneno"],
        address1: json["address1"],
        postcode: json["postcode"],
        city: json["city"],
        state: json["state"],
        fatheroccup: json["fatheroccup"],
        motheroccup: json["motheroccup"],
        householdincome: json["householdincome"],
        dependentno: json["dependentno"],
        spmyear: json["spmyear"],
        school: json["school"],
        spmresult: json["spmresult"],
        bmresult: json["bmresult"],
        biresult: json["biresult"],
        mathresult: json["mathresult"],
        histresult: json["histresult"],
        agreecheck: json["agreecheck"],
    );

    Map<String, dynamic> toJson() => {
        "icno": icno,
        "fullname": fullname,
        "email": email,
        "phoneno": phoneno,
        "address1": address1,
        "postcode": postcode,
        "city": city,
        "state": state,
        "fatheroccup": fatheroccup,
        "motheroccup": motheroccup,
        "householdincome": householdincome,
        "dependentno": dependentno,
        "spmyear": spmyear,
        "school": school,
        "spmresult": spmresult,
        "bmresult": bmresult,
        "biresult": biresult,
        "mathresult": mathresult,
        "histresult": histresult,
        "agreecheck": agreecheck,
    };
}
