import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/portfolio/services/contact_services.dart';
import 'package:portfolio/features/portfolio/view_models/contact_cubit/contact_cubit.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_info_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/contact_textfield_widget.dart';
import 'package:portfolio/features/portfolio/views/widgets/submit_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidgetMobileView extends StatefulWidget {
  final GlobalKey<State<StatefulWidget>> contactKey;
  const ContactWidgetMobileView({super.key, required this.contactKey});

  @override
  State<ContactWidgetMobileView> createState() =>
      _ContactWidgetMobileViewState();
}

class _ContactWidgetMobileViewState extends State<ContactWidgetMobileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final ContactCubit contactCubit = BlocProvider.of<ContactCubit>(context);
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      key: widget.contactKey,
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
          height: 1110,
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.primary, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's discuss your project",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: colorScheme.onSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContactTextFieldWidget(
                        hintText: "Enter your name",
                        labelText: "name*",
                        controller: nameController,
                      ),
                      const SizedBox(height: 20),
                      ContactTextFieldWidget(
                        hintText: "Enter your email",
                        labelText: "email*",
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      ContactTextFieldWidget(
                        hintText: "Enter your location",
                        labelText: "location",
                        controller: locationController,
                      ),
                      const SizedBox(height: 20),
                      ContactTextFieldWidget(
                        hintText: "Enter your budget",
                        labelText: "budget*",
                        controller: budgetController,
                      ),
                      const SizedBox(height: 20),
                      ContactTextFieldWidget(
                        hintText: "Enter your subject",
                        labelText: "subject*",
                        controller: subjectController,
                      ),
                      const SizedBox(height: 20),
                      ContactTextFieldWidget(
                        hintText: "Enter your message",
                        labelText: "message*",
                        controller: messageController,
                      ),
                      SizedBox(height: size.height * 0.05),
                      BlocConsumer<ContactCubit, ContactState>(
                        bloc: contactCubit,
                        listenWhen: (previous, current) =>
                            current is ContactError ||
                            current is ContactSuccess,
                        listener: (context, state) {
                          if (state is ContactError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errorMessage),
                                backgroundColor: colorScheme.error,
                              ),
                            );
                          } else if (state is ContactSuccess) {
                            final bool isSent = state.isSent;
                            final String? message = state.message;
                            message == null
                                ? null
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: isSent
                                          ? Text(message)
                                          : Text("Failed to send message"),
                                      backgroundColor: isSent
                                          ? colorScheme.primary
                                          : colorScheme.error,
                                    ),
                                  );
                          }
                        },
                        buildWhen: (previous, current) =>
                            current is ContactLoading ||
                            current is ContactSuccess ||
                            current is ContactError,
                        builder: (context, state) {
                          if (state is ContactLoading) {
                            return SubmitButtonWidget(isLoading: true);
                          }
                          return InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                await contactCubit.sendContactToEmail(
                                  name: nameController.text,
                                  email: emailController.text,
                                  message: messageController.text,
                                  subject: subjectController.text,
                                  budget: budgetController.text,
                                );
                                await contactCubit.sendAutoReplyEmail(
                                  name: nameController.text,
                                  email: emailController.text,
                                  subject: subjectController.text,
                                );
                                await contactCubit.sendContactToTelegram(
                                  name: nameController.text,
                                  email: emailController.text,
                                  message: messageController.text,
                                  budget: budgetController.text,
                                  subject: subjectController.text,
                                );
                              }
                            },
                            child: SubmitButtonWidget(),
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.05),
                      ContactInfoWidget(
                        title: "address",
                        info: "Egypt, Algharbia, Almahalla Alkobra",
                        icon: Icons.location_on_outlined,
                      ),
                      SizedBox(height: size.height * 0.03),
                      ContactInfoWidget(
                        title: "email",
                        info: "hamza.says2017@gmail.com",
                        icon: Icons.email_outlined,
                      ),
                      SizedBox(height: size.height * 0.03),
                      ContactInfoWidget(
                        title: "phone",
                        info: "+201061595158",
                        icon: Icons.phone,
                      ),
                      SizedBox(height: size.height * 0.1),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                "https://www.linkedin.com/in/hamza-hossam-75b4a1288/",
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Container(
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
                          ),
                          const SizedBox(width: 50),
                          InkWell(
                            onTap: () async {
                              final Uri url = Uri.parse(
                                "https://github.com/king7amza",
                              );
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Container(
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
                          ),
                          const SizedBox(width: 50),
                          InkWell(
                            onTap: () async {
                              ContactServices contactServices =
                                  ContactServicesImpl();
                              await contactServices.openWhatsApp(
                                phoneNumber: "201061595158",
                                message:
                                    "Hello, I'm interested in your services.",
                              );
                            },
                            child: Container(
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
                                  color: colorScheme.onPrimary,
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.cover,
                                  // colorBlendMode: BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
