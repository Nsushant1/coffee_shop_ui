import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:coffee_shop_app/screens/detail_screen.dart';
import 'package:coffee_shop_app/widgets/coffee_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 250.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: TextStyle(
                        color: const Color(0xFFB7B7B7),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          'Bilzen, Tanjungbalai',
                          style: TextStyle(
                            color: const Color(0xFFDDDDDD),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 48.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2E2C2C),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search coffee',
                                hintStyle: TextStyle(
                                  color: const Color(0xFF989898),
                                  fontSize: 14.sp,
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFC67C4E),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(0, -30.h),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  width: double.infinity,
                  height: 140.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 12.h,
                        left: 12.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFED5151),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Promo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 12.w,
                        bottom: 20.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),

                              child: Text(
                                'Buy one get one \nFREE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 30.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final categories = [
                    'All Coffee',
                    'Machiato',
                    'Latte',
                    'Americano',
                  ];
                  final isSelected = index == 0;
                  return Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFC67C4E)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF2F2D2C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 0.68,
                children: [
                  CoffeeCard(
                    name: 'Caffe Mocha',
                    subtitle: 'Deep Foam',
                    price: '4.53',
                    rating: 4.8,
                    imagePath: 'assets/images/coffee1.png',
                  ),
                  CoffeeCard(
                    name: 'Flat White',
                    subtitle: 'Espresso',
                    price: '3.53',
                    rating: 4.9,
                    imagePath: 'assets/images/coffee2.png',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(context, Icons.home, true),
                  _buildNavItem(context, Icons.favorite_border, false),
                  _buildNavItem(context, Icons.shopping_bag_outlined, false),
                  _buildNavItem(context, Icons.notifications_outlined, false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, bool isActive) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      },
      child: Icon(
        icon,
        color: isActive ? const Color(0xFFC67C4E) : const Color(0xFF8D8D8D),
        size: 28.sp,
      ),
    );
  }
}
