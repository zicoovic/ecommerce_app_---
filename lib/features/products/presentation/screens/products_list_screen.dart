import 'package:ecommerce_app/features/products/presentation/bloc/products_cubit.dart';
import 'package:ecommerce_app/features/products/presentation/bloc/products_state.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/greeting_header.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/home_app_bar.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/search_bar_widget.dart';
import 'package:ecommerce_app/features/products/presentation/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Products List Screen - Main home screen
/// Displays products using existing Bloc architecture
/// Matches screenshot design 100%
class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  int _currentNavIndex = 0;
  final Set<String> _favoriteProductIds = {};

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(
        onMenuPressed: _handleMenuPressed,
        onCartPressed: _handleCartPressed,
      ),
      body: _buildBody(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: _handleNavTap,
      ),
    );
  }

  /// Main body with Bloc state management
  Widget _buildBody() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return _buildLoadingState();
        } else if (state is ProductsSuccess) {
          return _buildSuccessState(state);
        } else if (state is ProductsError) {
          return _buildErrorState(state);
        }
        return _buildInitialState();
      },
    );
  }

  /// Loading state
  Widget _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(color: Color(0xFF9747FF)),
    );
  }

  /// Success state with products grid
  Widget _buildSuccessState(ProductsSuccess state) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          const GreetingHeader(),
          SizedBox(height: 24.h),
          _buildSearchSection(),
          SizedBox(height: 24.h),
          _buildProductsSection(state),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  /// Error state
  Widget _buildErrorState(ProductsError state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60.sp, color: const Color(0xFF8F959E)),
          SizedBox(height: 16.h),
          Text(
            state.message,
            style: TextStyle(fontSize: 15.sp, color: const Color(0xFF8F959E)),
          ),
        ],
      ),
    );
  }

  /// Initial state
  Widget _buildInitialState() {
    return const SizedBox.shrink();
  }

  /// Search section
  Widget _buildSearchSection() {
    return SearchBarWidget(
      onVoiceSearch: _handleVoiceSearch,
      onChanged: _handleSearchChanged,
    );
  }

  /// Products section with grid
  Widget _buildProductsSection(ProductsSuccess state) {
    return Column(
      children: [
        SectionHeader(title: 'New Arrival', onViewAllPressed: _handleViewAll),
        SizedBox(height: 16.h),
        _buildProductsGrid(state),
      ],
    );
  }

  /// Products grid
  Widget _buildProductsGrid(ProductsSuccess state) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 15.w,
        childAspectRatio: 0.65,
      ),
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final product = state.products[index];
        return ProductCard(
          product: product,
          isFavorite: _favoriteProductIds.contains(product.id),
          onTap: () => _handleProductTap(product.id),
          onFavoritePressed: () => _handleFavoriteTap(product.id),
        );
      },
    );
  }

  /// Event handlers
  void _handleMenuPressed() {}
  void _handleCartPressed() {}
  void _handleNavTap(int index) => setState(() => _currentNavIndex = index);
  void _handleVoiceSearch() {}
  void _handleSearchChanged(String query) {}
  void _handleViewAll() {}
  void _handleProductTap(String productId) {}

  void _handleFavoriteTap(String productId) {
    setState(() {
      if (_favoriteProductIds.contains(productId)) {
        _favoriteProductIds.remove(productId);
      } else {
        _favoriteProductIds.add(productId);
      }
    });
  }
}