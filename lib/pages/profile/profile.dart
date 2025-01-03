import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
            height: 1.2,
            letterSpacing: 0.5,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey[300],
            height: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Gandara Fathurrahman',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'gandufathurv18@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[50],
              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.history,
                    title: 'Order History',
                  ),
                  _buildMenuItem(
                    icon: Icons.gavel,
                    title: 'Bid History',
                  ),
                  _buildMenuItem(
                    icon: Icons.payment,
                    title: 'Payment',
                  ),
                  _buildMenuItem(
                    icon: Icons.location_on,
                    title: 'Address',
                  ),
                  _buildMenuItem(
                    icon: Icons.settings,
                    title: 'Setting',
                  ),
                  const SizedBox(height: 16),
                  _buildMenuItem(
                    icon: Icons.logout,
                    title: 'Logout',
                    isLogout: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[600], // Color for unselected items
        selectedFontSize: 14,
        elevation: 50,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // Set the initial selected index
        iconSize: 28, // Increased icon size
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          print(index);
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          }
          if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}

Widget _buildMenuItem({
  required IconData icon,
  required String title,
  bool isLogout = false,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : Colors.grey[600],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
        ),
      ),
      trailing: isLogout ? null : const Icon(Icons.chevron_right),
      onTap: () {},
    ),
  );
}
