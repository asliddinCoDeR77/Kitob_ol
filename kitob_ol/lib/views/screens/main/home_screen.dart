import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kitob_ol/views/utils/app_images.dart';
import 'package:kitob_ol/views/utils/drawer.dart'; // Assuming this is defined elsewhere

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0; // To track the current index of the carousel
  final CarouselController _controller = CarouselController();

  RangeValues _currentRangeValues =
      const RangeValues(16000, 40000); // Initial range values for slider

  final List<String> imgList = [
    AppImages.ad,
    AppImages.ad,
    AppImages.ad,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          AppImages.logo, // Ensure this image path is valid
          height: 40,
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ZoomIn(
                child: Column(
                  children: [
                    // Carousel Slider
                    CarouselSlider(
                      items: imgList
                          .map((item) => Container(
                                margin: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    width: 1000.0,
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Action Buttons
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'See more',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Kitoblar',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffC3C3C3),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Ish',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2C3033),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: const [
                        Text('Filter'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Filter Section (shown in the screenshot)
                    _buildFilterField(label: 'Ish nomini kiriting'),
                    const SizedBox(height: 20),
                    _buildDropdownField('Kimsiz', ['Shaxsiy', 'Korxona']),
                    const SizedBox(height: 20),
                    _buildDropdownField('Ish turi', ['Masofaviy', 'Ofis']),
                    const SizedBox(height: 20),
                    _buildDropdownField(
                        'Mashg\'ulot turi', ['To\'liq', 'Qisman']),
                    const SizedBox(height: 30),
                    const Text(
                      'Narx',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    // Price Range Slider
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 10000,
                      max: 50000,
                      divisions: 40,
                      activeColor: const Color(0xff2C3033),
                      inactiveColor: const Color(0xffE0E0E0),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_currentRangeValues.start.toInt()} uzs',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${_currentRangeValues.end.toInt()} uzs',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    _buildFilterField(label: 'Manzil'),
                    const SizedBox(height: 20),
                    _buildDropdownField(
                        'Ish tarzi', ['To\'liq vaqt', 'Qisman']),
                    const SizedBox(height: 20),
                    // Search Button
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Qidirish',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2C3033),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Example Book Cards
                    _buildBookCard(
                      imageUrl: AppImages.ad,
                      title: 'Milk and Honey',
                      location: 'Namangan shahar',
                      price: 24000,
                    ),
                    const SizedBox(height: 30),
                    _buildBookCard(
                      imageUrl: AppImages.ad,
                      title: 'Milk and Honey',
                      location: 'Namangan shahar',
                      price: 24000,
                    ),
                    const SizedBox(height: 30),
                    _buildBookCard(
                      imageUrl: AppImages.ad,
                      title: 'Milk and Honey',
                      location: 'Namangan shahar',
                      price: 24000,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create input fields
  Widget _buildFilterField({required String label}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // Helper method to create dropdowns
  Widget _buildDropdownField(String label, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}

extension on CarouselController {
  animateToPage(int key) {}
}

// Custom Book Card
Widget _buildBookCard({
  required String imageUrl,
  required String title,
  required String location,
  required int price,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    elevation: 2,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: 180,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$price so\'m',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      // Handle favorite button press
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
