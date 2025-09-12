import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/filter_chip_widget.dart';
import '../../../../shared/widgets/property_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _carouselImages = [
    'assets/images/kampala1.jpg',
    'assets/images/kampala2.jpg',
    'assets/images/kampala3.jpg',
  ];

  final TextEditingController _searchController = TextEditingController();
  final List<String> _selectedFilters = [];

  final List<String> _filters = [
    'Apartment',
    'House', 
    'Studio',
    'For Rent',
    'For Sale',
    '1-2 Rooms',
    '3+ Rooms'
  ];

  final List<Map<String, dynamic>> _mockProperties = [
    {
      'id': 1,
      'title': 'Modern 3-Bedroom Apartment',
      'location': 'kitara-kanyanya',
      'price': 200,
      'size': 85,
      'rooms': 3,
      'bathrooms': 2,
      'image': 'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      'type': 'rent',
      'favorite': false,
      'rating': 4.8,
      'agent': 'Sarah Miller',
    },
    {
      'id': 2,
      'title': 'Luxury Penthouse with Terrace',
      'location': 'kyanja',
      'price': 800,
      'size': 120,
      'rooms': 4,
      'bathrooms': 3,
      'image': 'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      'type': 'rent',
      'favorite': true,
      'rating': 4.9,
      'agent': 'Michael Weber',
    },
    {
      'id': 3,
      'title': 'Cozy Studio in Historic Building',
      'location': 'Kisaasi',
      'price': 850,
      'size': 35,
      'rooms': 1,
      'bathrooms': 1,
      'image': 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
      'type': 'rent',
      'favorite': false,
      'rating': 4.6,
      'agent': 'Anna Schmidt',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Start auto-scrolling after a delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _autoScroll();
      }
    });
  }

  void _autoScroll() {
    if (!mounted) return;
    
    final nextPage = (_currentPage + 1) % _carouselImages.length;
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    ).then((_) {
      if (mounted) {
        Future.delayed(const Duration(seconds: 5), _autoScroll);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4, // Make height responsive
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand, // Ensure stack fills available space
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _carouselImages.length,
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: 'carousel_${_carouselImages[index]}',
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight,
                              child: Image.asset(
                                _carouselImages[index],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  print('Error loading image: $error');
                                  return Container(
                                    color: Colors.grey[300],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.image_not_supported,
                                          size: 48,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Failed to load: ${_carouselImages[index]}',
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // Gradient overlay for better text visibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Dot indicators
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _carouselImages.map((image) {
                        int index = _carouselImages.indexOf(image);
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  // Content (Search bar and filters)
                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Find Your Perfect Home',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Search bar
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Enter location, property type, or keywords...',
                                prefixIcon: const Icon(Icons.search, color: AppColors.textTertiary),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.tune, color: AppColors.primary),
                                  onPressed: () => _showFilters(context),
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12, // Reduced padding
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12), // Reduced spacing
                          // Filter chips
                          SizedBox(
                            height: 40, // Increased height slightly
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _filters.length,
                              itemBuilder: (context, index) {
                                final filter = _filters[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: 8,
                                    bottom: index == _filters.length - 1 ? 8 : 0,
                                  ),
                                  child: FilterChipWidget(
                                    label: filter,
                                    isSelected: _selectedFilters.contains(filter),
                                    onSelected: (selected) {
                                      setState(() {
                                        if (selected) {
                                          _selectedFilters.add(filter);
                                        } else {
                                          _selectedFilters.remove(filter);
                                        }
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Results header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_mockProperties.length} Properties Found',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Sort by', style: TextStyle(fontSize: 14)),
                        Icon(Icons.keyboard_arrow_down, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Property list
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: PropertyCard(property: _mockProperties[index]),
                  );
                },
                childCount: _mockProperties.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilters(BuildContext context) {
    // TODO: Implement filter modal
  }
}
