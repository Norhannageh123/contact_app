import 'package:contact_app/widgets/elevatedbutton.dart';
import 'package:contact_app/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String userName = "User Name";
  String userEmail = "example@gmail.com";
  String userPhone = "+2000000000";

  @override
  void initState() {
    super.initState();
    // هنا يمكن تهيئة أي متغيرات تحتاج إلى تحضير عند بدء الصفحة
    _nameController.text = userName;
    _emailController.text = userEmail;
    _phoneController.text = userPhone;
  }

  @override
  void dispose() {
    // تأكد من تحرير الـ Controllers عند الخروج من الصفحة
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff29384D),
        title: SizedBox(
          height: 70,
          child: Image.asset(
            'assets/images/image.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xff29384D),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/an.png',
              fit: BoxFit.contain,
            ),
            const Text(
              'There is No contacts Added Here',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: const Color(0xff29384D),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2C3E50),
                                borderRadius: BorderRadius.circular(12),
                                image: _selectedImage != null
                                    ? DecorationImage(
                                        image: FileImage(_selectedImage!),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        image: AssetImage('assets/images/gimage.gif'),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
                                Text(
                                  userEmail,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
                                Text(
                                  userPhone,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _nameController,
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },
                        decoration: InputDecoration(hintText: "Enter User Name"),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _emailController,
                        onChanged: (value) {
                          setState(() {
                            userEmail = value;
                          });
                        },
                        decoration: InputDecoration(hintText: "Enter User Email"),
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _phoneController,
                        onChanged: (value) {
                          setState(() {
                            userPhone = value;
                          });
                        },
                        decoration: InputDecoration(hintText: "Enter User Phone"),
                      ),
                      const SizedBox(height: 10),
                      ElevatedbuttonCard(),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Color(0xFF2C3E50),
        ),
      ),
    );
  }
}
