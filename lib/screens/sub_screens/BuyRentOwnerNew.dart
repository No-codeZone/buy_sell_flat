import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/CustomAppBarFirst.dart';
import '../BuyRentGallery.dart';
import 'BuyRentGalleryNew.dart';

class BuyRentOwnerNew extends StatefulWidget {
  const BuyRentOwnerNew({super.key});

  @override
  State<BuyRentOwnerNew> createState() => _BuyRentOwnerNewState();
}

class _BuyRentOwnerNewState extends State<BuyRentOwnerNew> {
  final List<String> _dropDownFlatList = ['1BHK', '2BHK', '3BHK', '4BHK'];
  String? selectedValue;
  late File _images;

  ImagePicker picker = ImagePicker();
  XFile? image;
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double HeightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CustomAppBarFirst(),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0,top:40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Flat No...',
                      hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffeae9e9), width: 0.5),
                      )),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50.0,
                child: DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                  hint: const Text(
                    'Flat Type',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  items: _dropDownFlatList
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select flat type !';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('value is $value');
                    }
                  },
                  onSaved: (value) {
                    selectedValue = value.toString();
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 50.0,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Carpet Area...',
                      hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffeae9e9), width: 2.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              /*SizedBox(
                height: 50.0,
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Add Images',
                      border: UnderlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffeae9e9), width: 2.0),
                      ),
                  ),
                ),
              ),*/
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.white,
                    border: Border.all(
                      width: 0.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Add Images',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        //put image container here !
                        Container(
                          width: widthScreen * 0.8,
                          height: 0.5,
                          decoration: const BoxDecoration(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff1b2b4f)),
                              shape: const MaterialStatePropertyAll<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50.0))))),
                          onPressed: () async {
                            if (kDebugMode) {
                              print('Image add button clicked !');
                            }
                            image = await picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              if (kDebugMode) {
                                print('Gallery selection is here !\t$image');
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                  const BuyRentGalleryNew()));
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                        //test
                        /*SizedBox(
                          width: 200,
                          height: 200,
                          child: _image != null
                              ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                              : Container(
                            color: Colors.grey[300],
                          ),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          child: const Text(
                            'camera',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _getFromCamera();
                          },
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          child: const Text(
                            'galery',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _getFromGallery();
                          },
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: widthScreen * 0.4,
                    height: 50.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Min Budget',
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffeae9e9), width: 0.5),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                    width: widthScreen * 0.4,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Max Budget',
                          hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffeae9e9), width: 0.5),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Checkbox(
                      value: isCheck,
                      checkColor: Colors.white,
                      activeColor: Colors.lightBlueAccent,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheck = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: widthScreen * 0.7,
                    child: const AutoSizeText(
                        'Disclaimer: I allow society Prime representative to share my details',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 50.0,
                width: widthScreen * 0.7,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xff1b2b4f)),
                      shape: const MaterialStatePropertyAll<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
