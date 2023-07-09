import 'dart:io';

import 'package:advert/components/custom_text_field.dart';
import 'package:advert/constants/app_sizes.dart';
import 'package:advert/services/date_time_service.dart';
import 'package:advert/services/image_picker_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _name = TextEditingController();
  final _dateTime = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AddProduct'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CustomTextField(
              hintText: 'title',
              controller: _title,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'description',
              controller: _description,
              maxLines: 5,
            ),
            AppSizes.height10,
            ImageContainer(),
            AppSizes.height10,
            CustomTextField(
              hintText: 'name',
              controller: _name,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'dateTime',
              controller: _dateTime,
              focusNode: FocusNode(),
              onTap: () async {
                await DateTimeService.showDateTimePicker(context, (value) {
                  _dateTime.text = DateFormat('d MMM y')
                      .format(DateTime.parse(value.toString()));
                });
              },
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'phoneNumber',
              controller: _phoneNumber,
            ),
            AppSizes.height10,
            CustomTextField(
              hintText: 'address',
              controller: _address,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatefulWidget {
  ImageContainer({
    super.key,
  });
  final List<dynamic> images = [];
  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  List<XFile> images = [];
  final service = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
      ),
      child: widget.images.isNotEmpty
          ? GridView(
            
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10),
              children: images
                  .map(
                    (e) => ItemCard(
                      file: File(e.path),
                    ),
                  )
                  .toList(),
            )
          : IconButton(
              onPressed: () async {
                final value = await service.pickImages();
                if (value != null) {
                  images = value;
                  setState(() {});
                }
              },
              icon: const Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.black,
              )),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.file,
  });
  final File file;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.file(
        file,
      ),
    );
  }
}
