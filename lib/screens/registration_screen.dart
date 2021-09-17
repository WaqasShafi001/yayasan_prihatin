import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:yayasan_prihatin/bottom_bar_navigation.dart';
import 'package:yayasan_prihatin/models/form_details.dart';
import 'package:yayasan_prihatin/models/postcode.dart';
import 'package:yayasan_prihatin/models/upload_file.dart';
import 'package:yayasan_prihatin/services/api_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;

final List<String> negeriList = [
  'Selangor',
  'WP Kuala Lumpur',
  'WP Putrajaya',
  'WP Labuan',
  'Johor',
  'Melaka',
  'Negeri Sembilan',
  'Pahang',
  'Terengganu',
  'Kelantan',
  'Perak',
  'Pulau Pinang',
  'Kedah',
  'Perlis',
];
final List<String> pendapatan = [
  'Bawah RM3000',
  'RM3000-RM6000',
  'RM6001-RM9000',
  'RM9001 Ke Atas',
];
final List<String> pekerjaanList = [
  'Kerajaan',
  'Swasta',
  'Pesara',
  'Bekerja Sendiri',
  'Tidak Bekerja',
];
final List<String> keputusanList = [
  'A-/A/A+',
  'B-/B/B+',
  'C',
  'D',
  'E',
  'F',
  'Lain-lain',
];

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  FormDetails formDetails = FormDetails();
  APIService _apiService = APIService();
  GlobalKey<FormFieldState> _postKey = GlobalKey();
  GlobalKey<FormFieldState> _cityKey = GlobalKey();
  bool _setuju = false;
  bool isPostcodes = false;
  bool isCity = false;
  Postcode postcode = Postcode();
  List<String> postcodes = [];
  List<String> cities = [];
  String baseName1 = 'Muat Naik Salinan Kad Pengenalan';
  String baseName2 = 'Muat Naik Salinan Sijil SPM';
  String baseName3 = 'Muat Naik Salinan Sijil Berkaitan';
  File _upFile;
  File _upFile2;
  File _upFile3;
  UploadFile uploadFile1 = UploadFile();
  UploadFile uploadFile2 = UploadFile();
  UploadFile uploadFile3 = UploadFile();
  bool isFile1 = false;
  bool isFile2 = false;
  bool isIC = false;
  bool isUpload = false;

  Future<File> pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path);
      return file;
    } else {
      // User canceled the picker
    }
  }

  Future<File> changeFileNameOnly(File file, String newFileName) {
    var path = file.path;
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peluang Pendidikan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: 50.0,
          ),
          child: Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            elevation: 2.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 22,
                      right: 20,
                    ),
                    child: Text(
                      'MAKLUMAT PERIBADI PELAJAR',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 15,
                      left: 22,
                      right: 20,
                    ),
                    child: Text(
                      'Pendaftaran pelajar lepasan Sijil Pelajaran Malaysia (SPM) tahun 2016-2020.',
                      style: TextStyle(
                        color: Colors.grey[850],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'No Kad Pengenalan',
                    onChange: (value) {
                      setState(() {
                        formDetails.icno = value;
                      });
                    },
                    formatter: [
                      LengthLimitingTextInputFormatter(12),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.name,
                    labelText: 'Nama Penuh',
                    onChange: (value) {
                      setState(() {
                        formDetails.fullname = value;
                      });
                    },
                    formatter: [],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 22,
                      right: 20,
                    ),
                    child: Text(
                      'Seperti di dalam Kad Pengenalan',
                      style: TextStyle(
                        color: Colors.grey[850],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Alamat Emel',
                    onChange: (value) {
                      setState(() {
                        formDetails.email = value;
                      });
                    },
                    formatter: [],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'No Telefon',
                    onChange: (value) {
                      setState(() {
                        formDetails.phoneno = value;
                      });
                    },
                    formatter: [
                      LengthLimitingTextInputFormatter(13),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.streetAddress,
                    labelText: 'Alamat',
                    onChange: (value) {
                      setState(() {
                        formDetails.address1 = value;
                      });
                    },
                    formatter: [],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 22,
                      right: 20,
                    ),
                    child: Text(
                      'Untuk Urusan Rasmi',
                      style: TextStyle(
                        color: Colors.grey[850],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        postcode = await _apiService.getPostcodes();
                        setState(() {
                          _postKey.currentState.reset();
                          _cityKey.currentState.reset();
                          if (postcodes.isNotEmpty) {
                            postcodes.clear();
                            isPostcodes = false;
                            cities.clear();
                            isCity = false;
                          }

                          for (int i = 0; i < postcode.result.length; i++) {
                            if (postcode.result[i].statename == value) {
                              postcodes.add(postcode.result[i].postcode);
                            }
                          }
                          print(postcodes);
                          isPostcodes = true;
                          isCity = true;
                          formDetails.state = value;
                        });
                      },
                      items: negeriList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Negeri',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      key: _postKey,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        setState(() {
                          formDetails.postcode = value;
                          _cityKey.currentState.reset();
                          if (cities.isNotEmpty) {
                            cities.clear();
                            isCity = false;
                          }
                          for (int i = 0; i < postcode.result.length; i++) {
                            if (postcode.result[i].postcode == value) {
                              cities.add(postcode.result[i].city);
                            }
                          }
                          isCity = true;
                        });
                      },
                      items: postcodes.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Poskod',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      key: _cityKey,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        setState(() {
                          formDetails.city = value;
                        });
                      },
                      items: cities.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Bandar',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 22,
                      right: 20,
                      bottom: 15,
                    ),
                    child: Text(
                      'MAKLUMAT KELUARGA PELAJAR',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      // hint: Text('Jumlah Isi Pendapatan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          formDetails.fatheroccup = value;
                        });
                      },
                      items:
                          pekerjaanList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Pekerjaan Bapa',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      // hint: Text('Jumlah Isi Pendapatan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          formDetails.motheroccup = value;
                        });
                      },
                      items:
                          pekerjaanList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Pekerjaan Ibu',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      // hint: Text('Jumlah Isi Pendapatan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          formDetails.householdincome = value;
                        });
                      },
                      items: pendapatan.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Pendapatan Isi Rumah',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Jumlah Tanggungan',
                    onChange: (value) {
                      setState(() {
                        formDetails.dependentno = value;
                      });
                    },
                    formatter: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 22,
                      right: 20,
                      bottom: 15,
                    ),
                    child: Text(
                      'MAKLUMAT AKADEMIK',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.number,
                    labelText: 'Tahun Peperiksaan SPM',
                    onChange: (value) {
                      setState(() {
                        formDetails.spmyear = value;
                      });
                    },
                    formatter: [
                      LengthLimitingTextInputFormatter(4),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.name,
                    labelText: 'Sekolah',
                    onChange: (value) {
                      setState(() {
                        formDetails.school = value;
                      });
                    },
                    formatter: [],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextInputField(
                    keyboardType: TextInputType.name,
                    labelText: 'Keputusan SPM',
                    onChange: (value) {
                      setState(() {
                        formDetails.spmresult = value;
                      });
                    },
                    formatter: [
                      LengthLimitingTextInputFormatter(20),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 22,
                      right: 20,
                    ),
                    child: Text(
                      'Bagi tujuan semakan dan pengesahan. Sila nyatakan. Contoh: 10A,1B,1C',
                      style: TextStyle(
                        color: Colors.grey[850],
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      // hint: Text('Jumlah Isi Pendapatan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          formDetails.bmresult = value;
                        });
                      },
                      items:
                          keputusanList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Bahasa Malaysia',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      // hint: Text('Jumlah Isi Pendapatan'),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          formDetails.biresult = value;
                        });
                      },
                      items:
                          keputusanList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Bahasa Inggeris',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      // hint: Text('Jumlah Isi Pendapatan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          formDetails.mathresult = value;
                        });
                      },
                      items:
                          keputusanList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Matematik',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField<String>(
                      // hint: Text('Jumlah Isi Pendapatan'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sila Pilih';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // _sej = value;
                        setState(() {
                          formDetails.histresult = value;
                        });
                      },
                      items:
                          keputusanList.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo[900]),
                        ),
                        labelText: 'Sejarah',
                        labelStyle: TextStyle(
                            color: Colors.indigo[900],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15.0),
                      ),
                      iconEnabledColor: Colors.indigo[900],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 22,
                      right: 20,
                      bottom: 15,
                    ),
                    child: Text(
                      'DOKUMEN',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      onPressed: () async {
                        uploadFile1.field = 'IC';
                        _upFile = await pickFile();

                        String date = DateFormat("yyyy-MM-dd_HH-mm-ss")
                            .format(DateTime.now());
                        var imageName = 'IC_$date';
                        var newFile =
                            await changeFileNameOnly(_upFile, imageName);
                        print(newFile.path);
                        var newFileName = path.basename(newFile.path);
                        setState(() {
                          baseName1 = path.basename(_upFile.path);

                          uploadFile1.fileName = newFileName;
                          uploadFile1.filePath = newFile.path;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '$baseName1',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child:
                                baseName1 == 'Muat Naik Salinan Kad Pengenalan'
                                    ? Icon(Icons.drive_folder_upload)
                                    : null,
                          ),
                          Text(
                            ' *',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      onPressed: () async {
                        uploadFile2.field = 'SPM';
                        _upFile2 = await pickFile();

                        String date = DateFormat("yyyy-MM-dd_HH-mm-ss")
                            .format(DateTime.now());
                        var imageName = 'SPM_$date';
                        var newFile =
                            await changeFileNameOnly(_upFile2, imageName);
                        print(newFile.path);
                        var newFileName = path.basename(newFile.path);
                        setState(() {
                          baseName2 = path.basename(_upFile2.path);

                          uploadFile2.fileName = newFileName;
                          uploadFile2.filePath = newFile.path;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '$baseName2',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: baseName2 == 'Muat Naik Salinan Sijil SPM'
                                ? Icon(Icons.drive_folder_upload)
                                : null,
                          ),
                          Text(
                            ' *',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextButton(
                      onPressed: () async {
                        uploadFile3.field = 'Lain-lain';
                        _upFile3 = await pickFile();

                        String date = DateFormat("yyyy-MM-dd_HH-mm-ss")
                            .format(DateTime.now());
                        var imageName = 'other_$date';
                        var newFile =
                            await changeFileNameOnly(_upFile3, imageName);
                        print(newFile.path);
                        var newFileName = path.basename(newFile.path);
                        setState(() {
                          baseName3 = path.basename(_upFile3.path);

                          uploadFile3.fileName = newFileName;
                          uploadFile3.filePath = newFile.path;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '$baseName3',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child:
                                baseName3 == 'Muat Naik Salinan Sijil Berkaitan'
                                    ? Icon(Icons.drive_folder_upload)
                                    : null,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '* ',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        Text(
                          'Maximum upload size: 5MB',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text('Muat Naik'),
                      onPressed: (uploadFile1.filePath == '' ||
                              uploadFile2.filePath == '')
                          ? null
                          : () async {
                              if (formDetails.icno == null ||
                                  formDetails.icno == '') {
                                EasyLoading.showToast(
                                    'Sila isi No Kad Pengenalan !');
                              } else {
                                EasyLoading.show(
                                  status: 'Muat naik...',
                                  maskType: EasyLoadingMaskType.black,
                                );

                                var res = await _apiService.uploadFile(
                                  formDetails.icno,
                                  uploadFile1: uploadFile1,
                                  uploadFile2: uploadFile2,
                                  uploadFile3: uploadFile3,
                                );

                                if (res == 'Muat Naik Berjaya') {
                                  isUpload = true;
                                  EasyLoading.showSuccess(res);
                                } else {
                                  isUpload = false;
                                  EasyLoading.showError(res);
                                }
                              }
                            },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 22,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Text(
                      'PENGAKUAN',
                      style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      'Saya mengesahkan bahawa maklumat yang diberikan adalah tepat dan bersetuju untuk pihak Yayasan Prihatin Nasional menggunakan maklumat saya untuk padanan di Institut Pengajian dan Kemahiran Tinggi Malaysia.',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Checkbox(
                            value: _setuju,
                            onChanged: (value) {
                              _setuju = value;
                              setState(() {
                                value
                                    ? formDetails.agreecheck = '1'
                                    : formDetails.agreecheck = '0';
                              });
                              print(formDetails.agreecheck.toString());
                            }),
                        Text('Setuju'),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 50.0,
                      ),
                      width: 200,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: _setuju
                            ? () async {
                                if (isUpload) {
                                  if (_formKey.currentState.validate()) {
                                    EasyLoading.show(
                                      status: 'Mendaftar...',
                                      maskType: EasyLoadingMaskType.black,
                                    );
                                    var msg = await _apiService
                                        .insertForm(formDetails);
                                    print(msg);

                                    Map<String, dynamic> res = jsonDecode(msg);
                                    if (res['message'] ==
                                        'Data Inserted Successfully') {
                                      // Navigator.pop(context);
                                      EasyLoading.showToast(
                                          'Pendaftaran Berjaya');
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BottomBarNavigation(),
                                        ),
                                      );
                                    } else {
                                      EasyLoading.showError(
                                          'Pendaftaran Tidak Berjaya, Sila Cuba Lagi');
                                    }
                                  }
                                } else {
                                  EasyLoading.showError(
                                      'Sila Muat Naik Dokumen!');
                                }
                              }
                            : null,
                        child: Text(
                          'Hantar',
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo[900], // background
                          onPrimary: Colors.white,
                          // foreground
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextInputField extends StatelessWidget {
  TextInputField({
    @required this.keyboardType,
    @required this.labelText,
    @required this.onChange,
    @required this.formatter,
  });
  final TextInputType keyboardType;
  final String labelText;
  final Function(String) onChange;
  final List<TextInputFormatter> formatter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        onChanged: onChange,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Sila Lengkapkan';
          }
          return null;
        },
        style: TextStyle(
          fontSize: 18.0,
        ),
        inputFormatters: formatter,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.indigo[900],
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo[900]),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.indigo[900]),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        ),
      ),
    );
  }
}
