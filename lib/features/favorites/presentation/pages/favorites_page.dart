import 'package:flutter/material.dart';
import '../../../../shared/widgets/property_card.dart';
import '../../../../core/constants/app_colors.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _favoritedProperties = [
      {
        'id': 1,
        'title': 'Luxury Penthouse with Terrace',
        'location': 'Prenzlauer Berg, Berlin',
        'price': 2800,
        'size': 120,
        'rooms': 4,
        'bathrooms': 3,
        'image': 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2',
        'type': 'rent',
        'favorite': true,
        'rating': 4.9,
        'agent': 'Michael Weber',
      },
      {
        'id': 2,
        'title': 'Modern Studio in City Center',
        'location': 'Mitte, Berlin',
        'price': 1200,
        'size': 45,
        'rooms': 1,
        'bathrooms': 1,
        'image': 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
        'type': 'rent',
        'favorite': true,
        'rating': 4.7,
        'agent': 'Sarah Miller',
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
      ),
      body: _favoritedProperties.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: AppColors.textTertiary,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Properties you like will appear here',
                    style: TextStyle(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _favoritedProperties.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PropertyCard(
                    property: _favoritedProperties[index],
                  ),
                );
              },
            ),
    );
  }
}