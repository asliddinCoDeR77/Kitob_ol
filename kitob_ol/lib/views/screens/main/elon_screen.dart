import 'package:flutter/material.dart';
import 'package:kitob_ol/views/utils/app_icons.dart'; // Assuming you have an AppIcons file for icons

class ElonScreen extends StatefulWidget {
  @override
  _ElonScreenState createState() => _ElonScreenState();
}

class _ElonScreenState extends State<ElonScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _pagesController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _selectedCategory;
  String? _selectedFormat;
  String? _selectedCoverType;
  String? _selectedCondition;

  List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  List<String> formats = ['Format 1', 'Format 2', 'Format 3'];
  List<String> coverTypes = ['Hardcover', 'Paperback'];
  List<String> conditions = ['New', 'Used'];

  List<ImageProvider> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E'lon yaratish"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              "Bizga e'loningiz haqida gapirib bering",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(_nameController, 'Kitob nomini kiriting*'),
            _buildDropdown('Kategoriya', categories, _selectedCategory,
                (value) {
              setState(() {
                _selectedCategory = value;
              });
            }),
            _buildTextField(_authorController, 'Muallifni kiriting*'),
            _buildTextField(_pagesController, 'Kitob sahifasini kiriting*',
                TextInputType.number),
            _buildDropdown('Kitob formati', formats, _selectedFormat, (value) {
              setState(() {
                _selectedFormat = value;
              });
            }),
            _buildDropdown('Muqova turi', coverTypes, _selectedCoverType,
                (value) {
              setState(() {
                _selectedCoverType = value;
              });
            }),
            _buildTextField(_publisherController, 'Nashriyot nomini kiriting*'),
            _buildTextField(_yearController, 'Kitob yilini kiriting*',
                TextInputType.number),
            _buildTextField(_priceController, 'Narx*', TextInputType.number),
            _buildDropdown('Holati', conditions, _selectedCondition, (value) {
              setState(() {
                _selectedCondition = value;
              });
            }),
            SizedBox(height: 10),
            Text(
              'Rasmlar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildImagePicker(),
            SizedBox(height: 20),
            Text(
              'Tavsif',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildTextField(
                _descriptionController,
                'Kitob haqida qisqa tavsif kiriting*',
                TextInputType.multiline,
                5),
            SizedBox(height: 20),
            Text(
              'Manzilni kiriting*',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildTextField(_locationController, 'Manzil'),
            SizedBox(height: 20),
            Text(
              'Aloqa uchun malumotlar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildTextField(
                _phoneController, 'Telefon raqam*', TextInputType.phone),
            _buildTextField(
                _emailController, 'Email manzil*', TextInputType.emailAddress),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit logic
              },
              child: Text('E\'lonni yaratish'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Color(0xff2C3033),
              ),
            ),
            SizedBox(height: 20),
            _buildAppPromotion(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      [TextInputType keyboardType = TextInputType.text, int maxLines = 1]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? selectedValue,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildImagePicker() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Image picker logic here
          },
          child: Text('Rasm qo\'shish'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            minimumSize: Size(double.infinity, 50),
            side: BorderSide(color: Colors.grey),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(Icons.image, color: Colors.grey),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAppPromotion() {
    return Column(
      children: [
        Text(
          'Mobil ilovamizni o\'rnating va xizmatlarimizdan osonroq foydalaning.',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFullImageButton(AppIcons.googleplay),
            SizedBox(width: 20),
            _buildFullImageButton(AppIcons.appstore),
          ],
        ),
      ],
    );
  }

  Widget _buildFullImageButton(String imagePath) {
    return SizedBox(
      width: 150, // Adjust the width as per your design
      height: 50, // Adjust the height as per your design
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          padding:
              EdgeInsets.zero, // Remove padding to ensure full image coverage
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
          ), // Ensure on tap color is transparent
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Ink.image(
            image: AssetImage(imagePath),
            fit: BoxFit.cover, // Cover the entire button with the image
            width: 150, // Ensure the image fills the button's width
            height: 50, // Ensure the image fills the button's height
          ),
        ),
      ),
    );
  }
}