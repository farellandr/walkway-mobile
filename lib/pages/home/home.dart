import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<Map<String, dynamic>> _categories = [
  //   {'label': 'Running', 'isSelected': false},
  //   {'label': 'Sneakers', 'isSelected': false},
  //   {'label': 'Sport', 'isSelected': false},
  //   {'label': 'Basketball', 'isSelected': false},
  //   {'label': 'Casual', 'isSelected': false},
  //   {'label': 'Formal', 'isSelected': false},
  // ];

  // void _toggleCategorySelection(int index) {
  //   setState(() {
  //     _categories[index]['isSelected'] = !_categories[index]['isSelected'];
  //   });
  // }

  // Widget _buildCategoryList() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     padding: const EdgeInsets.symmetric(vertical:12),
  //     child: Row(
  //       children: [
  //         SizedBox(width: 16),
  //         ..._categories.asMap().entries.map((entry) {
  //           int index = entry.key;
  //           Map<String, dynamic> category = entry.value;
  //           return GestureDetector(
  //             onTap: () => _toggleCategorySelection(index),
  //             child: Container(
  //               margin: EdgeInsets.only(
  //                 left: index == 0 ? 0 : 8,
  //                 right: index == _categories.length - 1 ? 0 : 8,
  //               ),
  //               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //               decoration: BoxDecoration(
  //                 color: category['isSelected']
  //                     ? Color(0xff527B77)
  //                     : Colors.grey[200],
  //                 borderRadius: BorderRadius.circular(21),
  //               ),
  //               child: Text(
  //                 category['label'],
  //                 style: TextStyle(
  //                   color: category['isSelected'] ? Colors.white : Colors.black,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           );
  //         }),
  //         const SizedBox(width: 16),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildGrid(
  //     {required int crossAxisCount,
  //     required int itemCount,
  //     double borderRadius = 15}) {
  //   return GridView.builder(
  //     physics: const NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: crossAxisCount,
  //       crossAxisSpacing: 16,
  //       mainAxisSpacing: 16,
  //     ),
  //     itemCount: itemCount,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           color: Colors.grey[200],
  //           borderRadius: BorderRadius.circular(borderRadius),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              height: 40,
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
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Container(
                            padding: EdgeInsets.all(12),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/home-banner-1.png'),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset('assets/nike-logo.png'),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Recommended for you",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(Icons.east),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8.0,
                      children: [
                        SizedBox(width: 9),
                        ...List.generate(
                          8,
                          (index) => SizedBox(
                            width: 180,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          width: 160,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                                'assets/nike-sneakers.png'),
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            height: 36,
                                            width: 36,
                                            decoration: BoxDecoration(
                                              color: Colors.white60,
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              icon: Icon(
                                                Icons.favorite_outline,
                                                color: Colors.grey[600],
                                                size: 20,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Nike Dunk Low Vintage Green',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[800],
                                        height: 1.2,
                                        letterSpacing: 0.5,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Rp 1,100,000',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 9),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/home-banner-2.png'),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
