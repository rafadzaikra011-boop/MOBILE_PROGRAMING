import 'package:flutter/material.dart';

class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  static const _plans = [
    _TravelPlan(
      carrier: 'AT&T',
      country: 'Mexico',
      allowance: '2GB / 60min',
      validity: 'VALID FOR 24 DAYS',
      price: r'$32,10',
      color: Color(0xFFE5D7FF),
      icon: Icons.wifi,
    ),
    _TravelPlan(
      carrier: 'Vivo',
      country: 'Brazil',
      allowance: '5GB',
      validity: 'VALID FOR 30 DAYS',
      price: r'$15',
      color: Color(0xFFBDEAF2),
      icon: Icons.spa,
    ),
    _TravelPlan(
      carrier: 'Vodafone',
      country: 'France',
      allowance: '1GB',
      validity: 'VALID FOR 12 DAYS',
      price: r'$104,20',
      color: Color(0xFFFFCECE),
      icon: Icons.circle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F7F4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 19,
                    backgroundImage: AssetImage('gambar/harley.jpg'),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 20),
                    label: const Text('Add new Plan'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF17162F),
                      backgroundColor: const Color(0xFFEDECEF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Always be\nin touch',
                style: TextStyle(
                  color: Color(0xFF111027),
                  fontSize: 54,
                  fontWeight: FontWeight.w400,
                  height: 1.02,
                  letterSpacing: -2.4,
                ),
              ),
              const SizedBox(height: 24),
              for (var index = 0; index < _plans.length; index++) ...[
                _PlanCard(plan: _plans[index]),
                if (index != _plans.length - 1) const SizedBox(height: 8),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TravelPlan {
  const _TravelPlan({
    required this.carrier,
    required this.country,
    required this.allowance,
    required this.validity,
    required this.price,
    required this.color,
    required this.icon,
  });

  final String carrier;
  final String country;
  final String allowance;
  final String validity;
  final String price;
  final Color color;
  final IconData icon;
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.plan});

  final _TravelPlan plan;

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF17162F);

    return Container(
      height: 132,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: plan.color,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Color(0x337F6BAA),
                  shape: BoxShape.circle,
                ),
                child: Icon(plan.icon, size: 13, color: textColor),
              ),
              const SizedBox(width: 9),
              Text(
                plan.carrier,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                plan.country,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plan.allowance,
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    plan.validity,
                    style: TextStyle(
                      color: textColor.withValues(alpha: 0.58),
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                plan.price,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
