import 'package:ecommerce_app/core/constants/app_colors.dart';
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
          Expanded(child: _buildImageContainer(context)),
          SizedBox(height: 8.h),
          _buildProductName(context),
          SizedBox(height: 4.h),
          _buildPrice(context),
        ],
      ),
    );
  }

  /// Product image container with favorite button
  Widget _buildImageContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        children: [
          _buildProductImage(context),
          _buildFavoriteButton(),
        ],
      ),
    );
  }

  /// Product image using CachedNetworkImage
  Widget _buildProductImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: CachedNetworkImage(
        imageUrl: product.coverPictureUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        placeholder: (_, url) => Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              strokeWidth: 2.w,
            ),
          ),
        ),
        errorWidget: (_, url, error) => Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 40.sp,
            color: AppColors.textSecondary,
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
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? AppColors.error : AppColors.textSecondary,
            size: 18.sp,
          ),
        ),
      ),
    );
  }

  /// Product name text
  Widget _buildProductName(BuildContext context) {
    return Text(
      product.name,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: 11.sp,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Product price text
  Widget _buildPrice(BuildContext context) {
    return Text(
      '\$${product.price}',
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}