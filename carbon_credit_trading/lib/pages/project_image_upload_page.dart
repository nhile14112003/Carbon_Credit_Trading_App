import 'dart:io';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:carbon_credit_trading/widgets/image_upload_section.dart';
import 'package:flutter/material.dart';

class ProjectImageUploadPage extends StatefulWidget {
  final VoidCallback onPrevious; // Callback for the Previous button
  final Function(List<File>) onNext; // Callback for the Next button

  const ProjectImageUploadPage({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  createState() => _ProjectImageUploadPage();
}

class _ProjectImageUploadPage extends State<ProjectImageUploadPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List<File> _imageFiles = [];

  void _addImage(File newImage) {
    setState(() {
      _imageFiles.add(newImage);
    });
  }

  void _removeImage(File image) {
    setState(() {
      _imageFiles.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ImageUploadSection(
                imageFiles: _imageFiles,
                onRemoveImage: _removeImage,
              ),
            ),
            const SizedBox(height: 15),
            ImagePickerButton(
              onImageSelected: _addImage,
              imageFiles: _imageFiles,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green[100], // Background color
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_rounded,
                        color: AppColors.greenButton, size: 35),
                    SizedBox(width: 8),
                    Text(
                      'Đăng tải ảnh dự án',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onPrevious();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenButton,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 28),
                  ),
                  child: const Text(
                    'Trước',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onNext(_imageFiles); // Pass images back to parent
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.greenButton,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 28),
                  ),
                  child: const Text(
                    'Tiếp theo',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
