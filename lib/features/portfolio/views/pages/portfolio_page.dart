import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/features/portfolio/views/widgets/nav_bar_widget.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.08,
            right: size.width * 0.08,
            top: size.height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBarWidget(),
              const SizedBox(height: 40),
              // Positioned(
              //   top: 0,
              //   right: 0,
              //   child: Container(
              //     width: 1,
              //     height: 1,
              //     decoration: BoxDecoration(
              //       color: AppColors.pinkShadow,
              //       borderRadius: BorderRadius.circular(size.width),
              //       boxShadow: [
              //         BoxShadow(
              //           color: AppColors.pinkShadow,
              //           blurRadius: 200,
              //           spreadRadius: 200,
              //           offset: Offset(0, 1),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: 50,
              //   right: 0,
              //   child: Container(
              //     width: 1,
              //     height: 1,
              //     decoration: BoxDecoration(
              //       color: AppColors.pinkShadow,
              //       borderRadius: BorderRadius.circular(size.width),
              //       boxShadow: [
              //         BoxShadow(
              //           color: AppColors.pinkShadow,
              //           blurRadius: 200,
              //           spreadRadius: 200,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, I'm\nHamza Hossam",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.black,
                                    ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Flutter Developer",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  "I'm a Flutter developer from Egypt. I have a passion for Flutter and I'm always learning new things. I'm also a self-taught developer and I'm always looking for new challenges.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "Contact me",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          size.width < 600
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    size.width * 0.5,
                                  ),
                                  child: Image.asset(
                                    "assets/images/profile_image.jpg",
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    size.width * 0.05,
                                  ),
                                  child: Image.asset(
                                    "assets/images/profile_image.jpg",
                                    width: 350,
                                    height: 400,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
