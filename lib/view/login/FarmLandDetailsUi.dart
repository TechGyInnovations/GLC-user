import 'package:flutter/material.dart';

class FarmlandDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
    body: Container(
    height: double.infinity,
    decoration: BoxDecoration(
    // color: Colors.grey,
    image: DecorationImage(
    image: AssetImage('assets/background.png'),
    // Replace with your image asset path
    fit: BoxFit.fill, // Makes the image cover the entire screen
    ),
    ),
      child: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Actions
            Stack(
              children: [
                Image.asset(
                  'assets/farmland.jpg', // Replace with your image asset path
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Row(
                    children: List.generate(4, (index) {
                      if (index == 2) {
                        return _Thumbnail(image: 'assets/farmland.jpg', label: '+9');
                      } else if (index == 3) {
                        return _Thumbnail(image: 'assets/farmland.jpg', isVideo: true);
                      } else {
                        return _Thumbnail(image: 'assets/farmland.jpg');
                      }
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Farmland Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "GLCSOS 01",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text("Compare"),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "West Godavari, Andhra Pradesh",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            // Key Features
            _Section(
              title: "Key Feature:",
              content: Column(
                children: const [
                  _FeatureRow(label: "Land Extend", value: "150 Acres"),
                  _FeatureRow(label: "Road Approach", value: "50 Meters"),
                  _FeatureRow(label: "Electricity Connection", value: "3 Phase"),
                  _FeatureRow(label: "Water Facility", value: "Bore (100 Meters)"),
                ],
              ),
            ),
            // Facilities
            _Section(
              title: "Facilities:",
              content: Column(
                children: const [
                  _FacilityRow(label: "Railway Facility", available: true),
                  _FacilityRow(label: "Airport Facility", available: true),
                  _FacilityRow(label: "Hospitals", available: true),
                ],
              ),
            ),
            // Pricing and Land Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "₹2500000.00 per acre",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Land: 110/150 Acres",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    child: const Text("Unlock"),
                  ),
                ],
              ),
            ),
            // Cultivations
            _Section(
              title: "Cultivations:",
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _FeatureRow(label: "Current Cultivation", value: "Rice"),
                  _FeatureRow(label: "Types of Crops can be Grown", value: "Rice, Wheat, Cotton"),
                  _FeatureRow(label: "Future Crops Suggestions", value: "Sugar Cane"),
                  _FeatureRow(label: "Soil Type", value: "Alfisol"),
                ],
              ),
            ),
            // Documents
            _Section(
              title: "Documents:",
              content: Row(
                children: const [
                  _DocumentTile(label: "Land Documents"),
                  SizedBox(width: 16),
                  _DocumentTile(label: "Mutation Book"),
                ],
              ),
            ),
            // Similar Farmlands
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Similar Farmlands",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            // Farmland Cards
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                      (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _FarmlandCard(
                      title: "GLCSOS 0${index + 1}",
                      location: "West Godavari, AP",
                      price: "₹${[2500000, 1600000, 1100000, 3500000][index]}.00",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}

// Components
class _Thumbnail extends StatelessWidget {
  final String image;
  final String? label;
  final bool isVideo;

  const _Thumbnail({required this.image, this.label, this.isVideo = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(4),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: label != null
          ? Center(child: Text(label!, style: const TextStyle(color: Colors.white)))
          : isVideo
          ? const Icon(Icons.play_arrow, color: Colors.white)
          : null,
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget content;

  const _Section({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          content,
        ],
      ),
    );
  }
}

class _FeatureRow extends StatelessWidget {
  final String label;
  final String value;

  const _FeatureRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _FacilityRow extends StatelessWidget {
  final String label;
  final bool available;

  const _FacilityRow({required this.label, required this.available});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            available ? Icons.check_circle : Icons.cancel,
            color: available ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}

class _DocumentTile extends StatelessWidget {
  final String label;

  const _DocumentTile({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.file_copy, color: Colors.grey),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

class _FarmlandCard extends StatelessWidget {
  final String title;
  final String location;
  final String price;

  const _FarmlandCard({required this.title, required this.location, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/farmland.jpg',
            width: double.infinity,
            height: 80,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text(price, style: const TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
