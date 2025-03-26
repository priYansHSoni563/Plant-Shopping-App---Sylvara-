import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_app/ui/screens/widgets/add_edit_address_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<Map<String, String>> addresses = [
    {
      "name": "Priyansh Soni",
      "address": "Circle, Nehru Nagar Co operative Society Nana Mava",
      "phone": "+91 1234567890",
      "city": "Rajkot",
      "state": "Gujarat",
      "flat no / building name": "Silver Heights, A Wing, Flat No. 101",
      "landmark": "150 feet Ring Road",
      "pincode": "360005",
      "locationAs": "Home",
    },
  ];

  void _deleteAddress(int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 6,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  "Delete Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Are sure to delete this address?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1E3932),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      HapticFeedback.mediumImpact();
                      addresses.removeAt(index);
                    });
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text(
                    "Delete Address",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _editAddress(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditAddressScreen(
          isEdit: true,
          addressData: addresses[index],
          onSave: (updatedAddress) {
            setState(() {
              addresses[index] = updatedAddress;
            });
          },
        ),
      ),
    );
  }

  void _addAddress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditAddressScreen(
          isEdit: false,
          onSave: (newAddress) {
            setState(() {
              addresses.add(newAddress);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back action
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Saved Addresses",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              const SizedBox(height: 8),
              // Text("'${address["flat no / building name"]}",
              //   style: const TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              ...addresses.asMap().entries.map(
                (entry) {
                  int index = entry.key;
                  Map<String, String> address = entry.value;
                  return Card(
                    color: Colors.white,
                    // shadowColor: Colors.black,
                    // surfaceTintColor: Colors.white,

                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                            ],
                          ),
                          // Address
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 25,
                                color: const Color(0xFF1E3932),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                address["locationAs"]!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            address["name"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Address
                          Text(
                            address["address"]!,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87),
                          ),
                          const SizedBox(height: 2),
                          // Flat no / Building Name
                          Text(
                            '${address["flat no / building name"]}, ${address['landmark']}, ${address['city']}, ${address['state']} - ${address['pincode']}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87),
                          ),
                          const SizedBox(height: 2),

                          // Phone
                          Text(
                            'Phone : ${address['phone']}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87),
                          ),
                          const SizedBox(height: 12),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    HapticFeedback.mediumImpact;
                                    _editAddress(index);
                                  },
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    'EDIT',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: TextButton(
                                    onPressed: () {
                                      HapticFeedback.mediumImpact;
                                      _deleteAddress(index);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'DELETE',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                // ignore: unnecessary_to_list_in_spreads
              ).toList(),
              const SizedBox(height: 16),
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
            _addAddress();
          },
          child: Text(
            "Add New Address",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
