import 'package:flutter/material.dart';
import 'package:portfolio/core/themes/app_colors.dart';
import 'package:portfolio/features/portfolio/views/widgets/nav_bar_widget.dart';

class PrtfolioStack extends StatelessWidget {
  const PrtfolioStack({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(height: 2000, width: double.infinity),
            Positioned(
              top: 50,
              right: 0,
              width: 400,
              height: 400,
              child: ClipRect(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 1,
                    height: 1,
                    decoration: BoxDecoration(
                      color: AppColors.pinkShadow,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.pinkShadow,
                          blurRadius: 200,
                          spreadRadius: 200,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 300,
              right: 0,
              child: Container(
                width: 1,
                height: 1,
                decoration: BoxDecoration(
                  color: AppColors.pinkShadow,
                  borderRadius: BorderRadius.circular(size.width),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greenShadow,
                      blurRadius: 200,
                      spreadRadius: 200,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.08,
                right: size.width * 0.08,
                top: size.height * 0.028,
                bottom: size.height * 0.09,
              ),
              child: Column(
                children: [
                  NavBarWidget(),
                  const SizedBox(height: 40),
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Projects",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.white,
                                                ),
                                          ),
                                          const SizedBox(width: 5),
                                          const Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: AppColors.white,
                                            size: 15,
                                          ),
                                        ],
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
                                        "assets/images/profile_image.jpeg",
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
                                        "assets/images/profile_image.jpeg",
                                        width: 300,
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
            Positioned(
              top: 600,
              left: 100,
              right: 100,
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.9,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(150),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                size.width * 0.05,
                              ),
                              child: Image.asset(
                                "assets/images/profile_image.jpeg",
                                width: 300,
                                height: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: size.width * 0.1),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello, I'm\nHamza Hossam \nFlutter Developer",
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.black,
                                  ),
                            ),
                            Text(
                              'i am a flutter developer Loream ipsum dolor\nsit amet consectetur adipiscing elit.\nUt elit tellus luctus nec ullamcorper mattis pulvinar dui. ',
                              style: Theme.of(context).textTheme.headlineSmall!
                                  .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey,
                                  ),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Get In Touch",
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
                                const SizedBox(width: 40),
                                Container(
                                  width: 110,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Download CV",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.primaryColor,
                                              ),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.download_outlined,
                                          color: AppColors.primaryColor,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
