import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/ui/screens/my_address_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _profileImage;

  // Function to pick an image from the gallery
  Future<void> _selectProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E3932),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF1E3932),
                        width: 4.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: _profileImage != null
                          ? FileImage(_profileImage!)
                          : AssetImage(
                              "assets/images/user.png",
                            ) as ImageProvider,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: InkWell(
                      onTap: _selectProfileImage,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              const Color.fromARGB(255, 45, 106, 79),
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Priyansh Soni',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                children: [
                  _buildListTile(
                    "Address",
                    Icons.location_on,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddressScreen()),
                      );
                    },
                  ),
                  _buildListTile(
                    "Settings",
                    Icons.settings,
                    () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                  _buildListTile(
                    "Logout",
                    Icons.logout,
                    () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable ListTile Widget
  ListTile _buildListTile(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w500,
        ),
      ),
      tileColor: Colors.grey[300],
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }

  // ListTile _buildListTile2(IconData icon, String title, VoidCallback onTap) {
  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       color: Colors.green,
  //     ),
  //     title: Text(
  //       title,
  //       style: TextStyle(
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //     trailing: Icon(
  //       Icons.arrow_forward_ios,
  //       size: 16,
  //       color: Colors.grey,
  //     ),
  //     onTap: onTap,
  //   );
  // }
}
