import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/primary_button.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F4),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: PrimaryButton(
            label: 'ADD TO CART  |  3,200 MMK',
            onPressed: () {},
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Back',
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.arrow_back, color: AppTheme.ink),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
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
                              const Expanded(
                                child: Text(
                                  'JD022123',
                                  style: TextStyle(
                                    color: Color(0xFF9AA0A6),
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF841F),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Text(
                                  'New',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Coconut Donut',
                            style: TextStyle(
                              color: AppTheme.ink,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            '3200 MMK',
                            style: TextStyle(
                              color: AppTheme.ink,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 218,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/images/onboarding_donut.png',
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 5,
                              ),
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
                            ),
                          ),
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
                        const Expanded(
                          child: Text(
                            'Enjoy our scrumptious donuts – soft, sweet, and satisfying in every bite. Choose from classic glazed, rich chocolate, or fun sprinkles. Dive into deliciousness now!',
                            style: TextStyle(
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
          ],
        ),
      ),
    );
  }
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
