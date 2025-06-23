import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rahul_resume/utils/download_helper.dart';
import '../routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
       // color: isDarkMode ? const Color(0xFF1A1A1A) : Colors.white,
        image: DecorationImage(
          image: AssetImage(
            isDarkMode ? 'assets/homescreen.png' : 'assets/lightMode_homescreen.png'
          ),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(
          //   // isDarkMode ? Colors.black.withOpacity(0.5) : Colors.white.withOpacity(0.9),
          //   isDarkMode ? BlendMode.darken : BlendMode.lighten,
          // ),
        ),
      ),
      child: Stack(
        children: [
          // Accent line
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              width: 4,
              height: 100,
              color: const Color(0xFF0066FF),
            ),
          ),
          // Main content
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.height * 0.3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello! I\'m a',
                  style: GoogleFonts.inter(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    letterSpacing: -0.5,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Flutter Developer',
                  style: GoogleFonts.inter(
                    fontSize: 56,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0066FF),
                    letterSpacing: -1,
                    height: 1.1,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  'Code. Create. Iterate.',
                  style: GoogleFonts.inter(
                    fontSize: 52,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    letterSpacing: -0.5,
                    decoration: TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    DownloadHelper.downloadFile(
                      'assets/resume.pdf',
                      'Rahul_Jallapalli_Resume.pdf',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0066FF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Download Resume',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Let's Rock text
          Positioned(
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 24,
                  color: const Color(0xFF0066FF),
                  margin: const EdgeInsets.only(right: 8),
                ),
                                  const Text(
                    'Let\'s Rock!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                ),
              ],
            ),
          ),
          // Navigation bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rahul Jallapalli',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Row(
                    children: [
                      _buildNavItem('About', isDarkMode: isDarkMode, onTap: () => Get.toNamed(AppRoutes.aboutMe)),
                      _buildNavItem('Projects', isDarkMode: isDarkMode, onTap: () => Get.toNamed(AppRoutes.portfolio)),
                      _buildNavItem('Blog', isDarkMode: isDarkMode, onTap: () => Get.toNamed(AppRoutes.blog)),
                      _buildNavItem('Resume', isDarkMode: isDarkMode, onTap: () => Get.toNamed(AppRoutes.resume)),
                      _buildNavItem('Contact', isDarkMode: isDarkMode, onTap: () => Get.toNamed(AppRoutes.contact)),
                    ],
                  ),
                  Row(
                    children: [
                      _buildSocialIcon(Icons.public, isDarkMode: isDarkMode),
                      _buildSocialIcon(Icons.alternate_email, isDarkMode: isDarkMode),
                      _buildSocialIcon(Icons.business_center, isDarkMode: isDarkMode),
                      _buildSocialIcon(Icons.photo_camera, isDarkMode: isDarkMode),
                      // Theme toggle button
                      Container(
                        margin: const EdgeInsets.only(left: 16),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: (isDarkMode ? Colors.white : Colors.black).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: Icon(
                            isDarkMode ? Icons.light_mode : Icons.dark_mode,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            themeProvider.toggleTheme();
                          },
                          tooltip: isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
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
    );
  }

  Widget _buildNavItem(String text, {required bool isDarkMode, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, {required bool isDarkMode}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        onPressed: () {
          // TODO: Implement social media links
        },
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
} 