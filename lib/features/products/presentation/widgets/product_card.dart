import 'package:ecommerce_app/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Product card widget for grid view
/// Shows product image, name, price, and favorite button
/// Matches screenshot design exactly
/// Follows Single Responsibility Principle
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavoritePressed;

  const ProductCard({
    super.key,
    required this.product,
    this.isFavorite = false,
    required this.onTap,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: _buildImageContainer()),
          SizedBox(height: 8.h),
          _buildProductName(),
          SizedBox(height: 4.h),
          _buildPrice(),
        ],
      ),
    );
  }

  /// Product image container with favorite button
  Widget _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          _buildProductImage(),
          _buildFavoriteButton(),
        ],
      ),
    );
  }

  /// Product image using CachedNetworkImage
  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: CachedNetworkImage(
        imageUrl: product.coverPictureUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: const Color(0xFFF5F6FA),
          child: Center(
            child: CircularProgressIndicator(
              color: const Color(0xFF9747FF),
              strokeWidth: 2.w,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 40.sp,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  /// Favorite button positioned at top right
  Widget _buildFavoriteButton() {
    return Positioned(
      top: 10.h,
      right: 10.w,
      child: GestureDetector(
        onTap: onFavoritePressed,
        child: Container(
          width: 32.w,
          height: 32.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : const Color(0xFF8F959E),
            size: 18.sp,
          ),
        ),
      ),
    );
  }

  /// Product name text
  Widget _buildProductName() {
    return Text(
      product.name,
      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Product price text
  Widget _buildPrice() {
    return Text(
      '\$${product.price}',
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}