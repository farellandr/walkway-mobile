import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _categories = [
    {'label': 'Running', 'isSelected': false},
    {'label': 'Sneakers', 'isSelected': false},
    {'label': 'Sport', 'isSelected': false},
    {'label': 'Basketball', 'isSelected': false},
    {'label': 'Casual', 'isSelected': false},
    {'label': 'Formal', 'isSelected': false},
  ];

  void _toggleCategorySelection(int index) {
    setState(() {
      _categories[index]['isSelected'] = !_categories[index]['isSelected'];
    });
  }

  Widget _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 16),
          ..._categories.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> category = entry.value;
            return GestureDetector(
              onTap: () => _toggleCategorySelection(index),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: category['isSelected']
                      ? Color(0xff527B77)
                      : Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Text(
                  category['label'],
                  style: TextStyle(
                    color: category['isSelected'] ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildGrid(
      {required int crossAxisCount,
      required int itemCount,
      double borderRadius = 15}) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF7F8F8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Color(0xff939393),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildCategoryList(),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(thickness: 1),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    height: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildGrid(
                        crossAxisCount: 4, itemCount: 8, borderRadius: 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Recommended for you",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Icon(Icons.east),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: _buildGrid(crossAxisCount: 2, itemCount: 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
