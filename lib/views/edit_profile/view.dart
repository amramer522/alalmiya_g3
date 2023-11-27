import 'dart:io';

import 'package:alalmiya_g3/core/design/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  XFile? image;
  List<XFile>? imageList;
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: "Edit Profile"),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 19, horizontal: 19),
        children: [
          Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Stack(
              fit: StackFit.expand,
              children: [
                image == null
                    ? Image.network(
                        "https://media.licdn.com/dms/image/D4D03AQFHszHTeYFKvw/profile-displayphoto-shrink_800_800/0/1663237154241?e=1704931200&v=beta&t=OgJOo9cyBXbL9NbdLoa9uhPgseTrUel1muDJUwj2KeE",
                      )
                    : Image.file(
                        File(image!.path),
                      ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      pickImage(source: ImageSource.gallery);
                                    },
                                    icon: Icon(Icons.camera)),
                                IconButton(
                                    onPressed: () {
                                      pickImage(source: ImageSource.camera);
                                    },
                                    icon: Icon(Icons.camera_alt)),
                              ],
                            ));
                  },
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.4),
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "Amr Bakr",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          IconButton(
              onPressed: ()async {
                // pickMultiImage();
               result = await showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(100))),
                  builder: (context) => Container(
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Text("اختار مدينه"),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context,"المنصوره");
                            },
                            child: Text("المنصوره")),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context,"الجيزه");
                            },
                            child: Text("الجيزه")),
                      ],
                    ),
                  ),
                );
               setState(() {

               });
               print(result);
              },
              icon: Icon(Icons.ac_unit)),
          if (imageList != null)
            Wrap(
              children: List.generate(
                  imageList!.length,
                  (index) => Image.file(
                        File(imageList![index].path),
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      )),
            ),
          Text(result??"")
          // SizedBox(
          //   height: 25,
          // ),
        ],
      ),
    );
  }

  Future<void> pickImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      Navigator.pop(context);
      print(image!.path);
      setState(() {});
    }
  }

  Future<void> pickMultiImage() async {
    imageList = await ImagePicker().pickMultiImage();
    if (imageList != null) {
      print(imageList);
      setState(() {});
    }
  }
}
