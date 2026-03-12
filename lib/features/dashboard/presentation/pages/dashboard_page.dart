import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/dashboard_widgets.dart';
import '../../../dosen/presentation/pages/dosen_page.dart';
import '../../../mahasiswa/presentation/pages/mahasiswa_page.dart';
import '../../../mahasiswa_aktif/presentation/pages/mahasiswa_aktif_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  // get icon
  IconData getStatIcon(String title) {
    switch (title) {
      case 'Total Mahasiswa':
        return Icons.school_rounded;
      case 'Mahasiswa Aktif':
        return Icons.person_outline_rounded;
      case 'Mahasiswa Lulus':
        return Icons.workspace_premium_rounded;
      case 'Dosen':
        return Icons.people_outline_rounded;
      default:
        return Icons.analytics_outlined;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch dashboard data dari provider
    final dashboardState = ref.watch(dashboardNotifierProvider);
    final selectedIndex = ref.watch(selectedStatIndexProvider);

    return Scaffold(
      body: dashboardState.when(
        // State: Loading
        loading: () => const LoadingWidget(),

        // State: Error
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data: ${error.toString()}',
          onRetry: () {
            // Refresh data ketika tombol retry ditekan
            ref.read(dashboardNotifierProvider.notifier).refresh();
          },
        ), // CustomErrorWidget

        data: (dashboardData) {
          return RefreshIndicator(
            onRefresh: () async {
              // Pull to refresh
              await ref.read(dashboardNotifierProvider.notifier).refresh();
            },
            child: CustomScrollView(
              slivers: [
                // Header
                SliverToBoxAdapter(
                  child: DashboardHeader(userName: dashboardData.userName),
                ),
                // Stats Section with Modern Cards
                SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Statistics',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {
                                ref.invalidate(dashboardNotifierProvider);
                              },
                              icon: const Icon(Icons.refresh_rounded, size: 18),
                              label: const Text('Refresh'),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.1,
                              ),
                          itemCount: dashboardData.stats.length,
                          itemBuilder: (context, index) {
                            final stat = dashboardData.stats[index];
                            return ModernStatCard(
                              stats: stat,
                              icon: getStatIcon(stat.title),
                              gradientColors:
                                  AppConstants.dashboardGradients[index %
                                      AppConstants.dashboardGradients.length],
                              isSelected: selectedIndex == index,
                              onTap: () {
                                ref
                                        .read(
                                          selectedStatIndexProvider.notifier,
                                        )
                                        .state =
                                    index;

                                final statTitle = stat.title;

                                switch (statTitle) {
                                  case 'Total Mahasiswa':
                                    Navigator.push(
                                      context,
                                      _createRoute(const MahasiswaPage()),
                                    );
                                    return;
                                  case 'Mahasiswa Aktif':
                                    Navigator.push(
                                      context,
                                      _createRoute(const MahasiswaAktifPage()),
                                    );
                                    return;
                                  case 'Dosen':
                                    Navigator.push(
                                      context,
                                      _createRoute(const DosenPage()),
                                    );
                                    return;
                                  case 'Profile':
                                    Navigator.push(
                                      context,
                                      _createRoute(const ProfilePage()),
                                    );
                                    return;
                                  default:
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Halaman tidak tersedia'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                }
                              },
                            ); // ModernStatCard
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
              ],
            ),
          ); // RefreshIndicator
        }, // data
      ), // when
    ); // Scaffold
  } // build
} // DashboardPage

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutCubic;
      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve)); // Tween
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}
