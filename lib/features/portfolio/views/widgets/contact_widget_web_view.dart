import 'package:flutter/material.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_info_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_textfield_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/submit_button_widget.dart';

class ContactWidgetWebView extends StatelessWidget {
  final GlobalKey contactKey;
  const ContactWidgetWebView({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      key: contactKey,
      children: [
        Text(
          "Contact",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: size.width,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.primary, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Let's discuss your project",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: colorScheme.onSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ContactTextFieldWidget(
                              hintText: "Enter your name",
                              labelText: "name*",
                            ),
                            const SizedBox(height: 20),
                            ContactTextFieldWidget(
                              hintText: "Enter your email",
                              labelText: "email*",
                            ),
                            const SizedBox(height: 20),
                            ContactTextFieldWidget(
                              hintText: "Enter your location",
                              labelText: "location",
                            ),
                            const SizedBox(height: 20),
                            ContactTextFieldWidget(
                              hintText: "Enter your budget",
                              labelText: "budget*",
                            ),
                            const SizedBox(height: 20),
                            ContactTextFieldWidget(
                              hintText: "Enter your subject",
                              labelText: "subject*",
                            ),
                            const SizedBox(height: 20),
                            ContactTextFieldWidget(
                              hintText: "Enter your message",
                              labelText: "message*",
                            ),
                            const SizedBox(height: 50),
                            SubmitButtonWidget(),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    Column(
                      children: [
                        ContactInfoWidget(
                          title: "address",
                          info: "Egypt, Algharbia, Almahalla Alkobra",
                          icon: Icons.location_on_outlined,
                        ),
                        const SizedBox(height: 20),
                        ContactInfoWidget(
                          title: "email",
                          info: "hamza.says2017@gmail.com",
                          icon: Icons.email_outlined,
                        ),
                        const SizedBox(height: 20),
                        ContactInfoWidget(
                          title: "phone",
                          info: "+201061595158",
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 100),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "in",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(color: colorScheme.onPrimary),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 0.77,
                                heightFactor: 0.77,
                                child: Image.asset(
                                  "assets/images/github_icon.png",
                                  color: colorScheme.onPrimary,
                                  width: 10,
                                  height: 10,
                                  fit: BoxFit.cover,
                                  colorBlendMode: BlendMode.srcIn,
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: FractionallySizedBox(
                                widthFactor: 1,
                                heightFactor: 1,
                                child: Image.asset(
                                  "assets/images/whatsapp_icon.png",
                                  // color: colorScheme.onPrimary,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                  // colorBlendMode: BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
