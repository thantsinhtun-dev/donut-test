import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/number_format_utils.dart';
import '../../../../features/home/domain/entities/home_content.dart';
import '../../../../features/home/presentation/cubit/home_cubit.dart';
import '../../../../features/home/presentation/cubit/home_state.dart';
import '../../../../features/home/presentation/widgets/home_data_image.dart';
import '../../../../features/home/presentation/widgets/home_loading_skeleton.dart';
import '../../../../features/home/presentation/widgets/home_offline_banner.dart';
import '../../../../shared/widgets/primary_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.product});

  final HomeProduct? product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final selectedProduct = _currentProduct(state.content) ?? product;
        if (selectedProduct == null) {
          return const Scaffold(body: HomeLoadingSkeleton());
        }
        return _productPage(context, state, selectedProduct);
      },
    );
  }

  HomeProduct? _currentProduct(HomeContent? content) {
    if (content == null) return null;
    if (product != null) {
      for (final section in content.sections) {
        for (final item in section.products) {
          if (item.id == product!.id) return item;
        }
      }
    }
    return _firstProduct(content);
  }

  HomeProduct? _firstProduct(HomeContent? content) {
    if (content == null) return null;
    for (final section in content.sections) {
      if (section.products.isNotEmpty) return section.products.first;
    }
    return null;
  }

  Widget _productPage(
    BuildContext context,
    HomeState state,
    HomeProduct product,
  ) => Scaffold(
    backgroundColor: const Color(0xFFF1F3F4),
    bottomNavigationBar: SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: PrimaryButton(
          label: 'ADD TO CART  |  ${formatPoints(product.priceMmk)} MMK',
          onPressed: () {},
        ),
      ),
    ),
    body: SafeArea(
      child: Column(
        children: [
          if (state.isOffline) const HomeOfflineBanner(),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              tooltip: 'Back',
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back, color: AppTheme.ink),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: context.read<HomeCubit>().refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  product.code,
                                  style: const TextStyle(
                                    color: Color(0xFF9AA0A6),
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              if (product.isNew ||
                                  product.discountPercent != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFF841F),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Text(
                                    product.discountPercent == null
                                        ? 'New'
                                        : '${product.discountPercent}% off',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.name,
                            style: const TextStyle(
                              color: AppTheme.ink,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '${formatPoints(product.priceMmk)} MMK',
                            style: const TextStyle(
                              color: AppTheme.ink,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 218,
                            width: double.infinity,
                            child: HomeDataImage(
                              imageUrl: product.imageUrl,
                              fallbackAsset: product.fallbackAsset,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Center(child: _QuantityControl()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 62,
                          child: Row(
                            children: [
                              Icon(
                                Icons.help,
                                color: Color(0xFF91C544),
                                size: 15,
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  'What’s\nthis?',
                                  style: TextStyle(
                                    color: AppTheme.ink,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            product.description,
                            style: const TextStyle(
                              color: Color(0xFF838990),
                              fontSize: 10,
                              height: 1.45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _QuantityControl extends StatelessWidget {
  const _QuantityControl();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
    decoration: BoxDecoration(
      color: const Color(0xFFF1F3F4),
      borderRadius: BorderRadius.circular(24),
    ),
    child: const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _QuantityButton(icon: Icons.remove),
        SizedBox(width: 16),
        Text(
          '1',
          style: TextStyle(
            color: AppTheme.ink,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 16),
        _QuantityButton(icon: Icons.add),
      ],
    ),
  );
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
    width: 21,
    height: 21,
    decoration: const BoxDecoration(
      color: AppTheme.primary,
      shape: BoxShape.circle,
    ),
    child: Icon(icon, color: Colors.white, size: 15),
  );
}
