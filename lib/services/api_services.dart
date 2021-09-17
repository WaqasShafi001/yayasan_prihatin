import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:yayasan_prihatin/models/form_details.dart';
import 'package:yayasan_prihatin/models/postcode.dart';
import 'package:yayasan_prihatin/models/update_prihatin.dart';
import 'package:yayasan_prihatin/models/upload_file.dart';

class APIService {
  String url = 'yayasanprihatin.com';
  String token = 'f41fdc57-1173-4471-856c-6cc94621613e';
  String username = 'yayasanprihatinadmin';
  String password = 'password12345';

  Future _getData({Uri uri, Map<String, String> headers}) async {
    http.Response response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      log('getData Exception: ' + response.statusCode.toString());
      throw Exception(response.statusCode.toString());
    }
  }

  Future<dynamic> _postData({
    Uri uri,
    Map<String, String> headers,
    Object body,
    Encoding encoding,
  }) async {
    final response =
        await http.post(uri, headers: headers, body: body, encoding: encoding);
    if (response.statusCode == 200) {
      String data = response.body;
      return data;
    } else {
      log(response.statusCode.toString());
      throw Exception(response.statusCode.toString());
    }
  }

  Future<dynamic> insertForm(FormDetails formDetails) async {
    var uri = Uri.http(url, '/yayasan-api/poststudentreg.php');
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);

    var data = await _postData(
        uri: uri,
        headers: <String, String>{
          'content-type': 'application/json',
          'accept': 'application/json',
          'authorization': basicAuth,
        },
        body: formDetailsToJson(formDetails));
    print(data);
    return data;
  }

  Future<Postcode> getPostcodes() async {
    var uri = Uri.http(url, '/yayasan-api/getpostcodes.php');

    var data = await _getData(
      uri: uri,
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    var postcode = Postcode.fromJson(data);
    print(postcode.result.length);
    return postcode;
  }

  Future<UpdatePrihatin> getUpdate() async {
    var uri = Uri.http(url, '/yayasan-api/getupdateatprihatin.php');

    var data = await _getData(
      uri: uri,
      headers: <String, String>{
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': 'Bearer $token',
      },
    );
    var update = UpdatePrihatin.fromJson(data);
    print(data);
    return update;
  }

  Future<String> uploadFile(String icNo,
      {UploadFile uploadFile1,
      UploadFile uploadFile2,
      UploadFile uploadFile3}) async {
    var uri = Uri.http(url, '/yayasan-api/postformimages.php');
    try {
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(
        <String, String>{
          'content-type': 'multipart/form-data',
          'accept': '*/*',
          'authorization': 'Bearer $token',
        },
      );
      request.fields.addAll({'icno': '$icNo'});
      request.files.add(
        await http.MultipartFile.fromPath(
            uploadFile1.field, uploadFile1.filePath,
            filename: uploadFile1.fileName),
      );
      request.files.add(
        await http.MultipartFile.fromPath(
            uploadFile2.field, uploadFile2.filePath,
            filename: uploadFile2.fileName),
      );
      if (uploadFile3.filePath != '') {
        request.files.add(
          await http.MultipartFile.fromPath(
              uploadFile3.field, uploadFile3.filePath,
              filename: uploadFile3.fileName),
        );
      }

      print('file ${request.files.length.toString()}');
      var response = await request.send();
      print(response.statusCode);
      final res = await http.Response.fromStream(response);
      print('body ${res.body}');
    } catch (e) {
      print("Error Upload: " + e.toString());
      return 'Muat Naik Gagal! Sila Cuba Lagi';
    }
    return 'Muat Naik Berjaya';
  }
}
