import 'package:flutter/material.dart';

class AddEditAddressScreen extends StatelessWidget {
  final bool isEdit;
  final Map<String, String>? addressData;
  final Function(Map<String, String>) onSave;

  AddEditAddressScreen({
    super.key,
    required this.isEdit,
    this.addressData,
    required this.onSave,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _flatController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _locationAsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (isEdit && addressData != null) {
      _nameController.text = addressData!["name"]!;
      _addressController.text = addressData!["address"]!;
      _phoneController.text = addressData!["phone"]!;
      _pincodeController.text = addressData!["pincode"]!;
      _cityController.text = addressData!["city"]!;
      _stateController.text = addressData!["state"]!;
      _flatController.text = addressData!["flat no / building name"]!;
      _landmarkController.text = addressData!["landmark"]!;
      _locationAsController.text = addressData!["locationAs"]!;
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(isEdit ? 'Edit Address' : 'Add Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Contact Info",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // name
              TextField(
                cursorColor: Colors.black,
                selectionControls: materialTextSelectionControls,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                selectionControls: materialTextSelectionControls,
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),

              //
              const Text(
                "Address Info",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      // pincode
                      cursorColor: Colors.black,
                      selectionControls: materialTextSelectionControls,
                      controller: _locationAsController,
                      decoration: InputDecoration(
                        labelText: 'Loaction As',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      // pincode
                      cursorColor: Colors.black,
                      selectionControls: materialTextSelectionControls,
                      controller: _pincodeController,
                      decoration: InputDecoration(
                        labelText: 'Pincode',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      selectionControls: materialTextSelectionControls,
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: 'City',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                selectionControls: materialTextSelectionControls,
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: 'State',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                selectionControls: materialTextSelectionControls,
                controller: _addressController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                selectionControls: materialTextSelectionControls,
                controller: _flatController,
                decoration: InputDecoration(
                  labelText: 'Flat No / Building Name',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                selectionControls: materialTextSelectionControls,
                controller: _landmarkController,
                decoration: InputDecoration(
                  labelText: 'Landmark (Optinal)',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 4.0,
        shadowColor: Colors.black,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: const Color(0xFF1E3932),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Rounded corners
            ),
          ),
          onPressed: () {
            onSave(
              {
                // Name
                "name": _nameController.text,

                // Address
                "address": _addressController.text,

                // Phone
                "phone": _phoneController.text,

                // locationAs
                "locationAs": _locationAsController.text,

                // Pincode
                "pincode": _pincodeController.text,

                // City
                "city": _cityController.text,

                // state
                "state": _stateController.text,

                // Flat No / Building Name
                "flat no / building name": _stateController.text,

                // landmark
                "landmark": _landmarkController.text,
              },
            );

            Navigator.of(context).pop();
            // Go back after saving
          },
          child: Text(
            isEdit ? 'Save Changes' : 'Add Address',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
