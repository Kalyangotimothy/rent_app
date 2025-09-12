import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PropertyCard extends StatelessWidget {
  final Map<String, dynamic> property;

  const PropertyCard({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              property['image'] ?? '',
              fit: BoxFit.cover,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  property['title'] ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Location
                Row(
                  children: [
                    const Icon(Icons.location_on, 
                      size: 16, 
                      color: AppColors.textTertiary
                    ),
                    const SizedBox(width: 4),
                    Text(
                      property['location'] ?? '',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                
                // Price and Details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${property['price']}/month',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    Row(
                      children: [
                        _buildDetail(Icons.bed, '${property['rooms']} Rooms'),
                        const SizedBox(width: 16),
                        _buildDetail(Icons.square_foot, '${property['size']}m²'),
                      ],
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

  Widget _buildDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.textTertiary),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}