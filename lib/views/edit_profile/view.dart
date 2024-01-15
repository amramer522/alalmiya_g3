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
      appBar: const MyAppBar(text: "Edit Profile"),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
        children: [
          Container(
            height: 100,
            width: 100,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(shape: BoxShape.circle),
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
                                    icon: const Icon(Icons.camera)),
                                IconButton(
                                    onPressed: () {
                                      pickImage(source: ImageSource.camera);
                                    },
                                    icon: const Icon(Icons.camera_alt)),
                              ],
                            ));
                  },
                  child: Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(.4),
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
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
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(100))),
                  builder: (context) => Column(
                    children: [
                      const Text("اختار مدينه"),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context,"المنصوره");
                          },
                          child: const Text("المنصوره")),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context,"الجيزه");
                          },
                          child: const Text("الجيزه")),
                    ],
                  ),
                );
               setState(() {

               });
               debugPrint(result);
              },
              icon: const Icon(Icons.ac_unit)),
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
    image = await ImagePicker().pickImage(source: source).then((value) {
      if (image != null) {
        Navigator.pop(context);
        debugPrint(image!.path);
        setState(() {});
      }
    });

  }

  Future<void> pickMultiImage() async {
    imageList = await ImagePicker().pickMultiImage();
    if (imageList != null) {
      debugPrint(imageList.toString());
      setState(() {});
    }
  }
}
