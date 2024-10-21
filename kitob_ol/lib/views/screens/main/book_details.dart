import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String translator;
  final String category;
  final String isbn;
  final String coverType;
  final int pages;
  final String condition;
  final String format;
  final String language;
  final String publisher;
  final String year;
  final int price;
  final int views;
  final String sellerName;
  final String sellerLocation;
  final String sellerPhone;

  BookDetailScreen({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.translator,
    required this.category,
    required this.isbn,
    required this.coverType,
    required this.pages,
    required this.condition,
    required this.format,
    required this.language,
    required this.publisher,
    required this.year,
    required this.price,
    required this.views,
    required this.sellerName,
    required this.sellerLocation,
    required this.sellerPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Image and Price
            Container(
              child: Column(
                children: [
                  Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$price uzs',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Book Details
            _buildSectionTitle('Kitob haqida'),
            _buildDetailRow('Muallif', author),
            _buildDetailRow('Tarjimon', translator),
            _buildDetailRow('Kategoriya', category),
            _buildDetailRow('ISBN(ID)', isbn),
            _buildDetailRow('Muqova', coverType),
            _buildDetailRow('Sahifa', '$pages'),
            _buildDetailRow('Holati', condition),
            _buildDetailRow('Format', format),
            _buildDetailRow('Til', language),
            _buildDetailRow('Nashriyot', publisher),
            _buildDetailRow('Yili', year),
            _buildDetailRow('Ko\'rilgan', '$views'),

            const SizedBox(height: 20),

            // Seller Contact Information
            _buildSectionTitle('Murojaat qilish'),
            _buildSellerContactInfo(),

            const SizedBox(height: 20),
            _buildContactButtons(),
          ],
        ),
      ),
    );
  }

  // Helper Widget to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper Widget to build a row of details
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget for Seller Contact Info
  Widget _buildSellerContactInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.person,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sellerName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              sellerLocation,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              sellerPhone,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Helper Widget for Contact Buttons
  Widget _buildContactButtons() {
    return Column(
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.phone),
          label: const Text('Telefon qilish'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff2C3033),
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            // Call functionality
          },
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          icon: const Icon(Icons.message),
          label: const Text('Izoh yozish'),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            // Write message functionality
          },
        ),
      ],
    );
  }
}
