import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/reuseable/Widgets/mainTextWidget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text1(
          text: 'Privacy policy',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is an AI Generated Text',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Text2(
              text:
              'Thank you for using this App.\n\n Your privacy and the security of your personal information are important to us. This Privacy Policy outlines how we collect, use, disclose, and manage your information when you use our app.',
            ),

            SizedBox(height: 16.h),
            _buildSectionHeader('Information We Collect'),
            SizedBox(height: 8.h),
            Text3(
              text:
              '•	Personal Information: When you sign up for an account, make a purchase, or interact with our app, we may collect personal information such as your name, email address, shipping address, and payment information.',
            ),
            SizedBox(height: 8.h),
            Text3(
              text:
              "•	Device Information: We may collect information about the device you use to access our app, including the device type, operating system, and unique device identifiers.",
            ),
            Text3(
                text:
                "•	Usage Information: We may collect information about how you use our app, including the products you view, the pages you visit, and your interactions with our features and advertisements."),

            SizedBox(height: 16.h),
            _buildSectionHeader('How We Use Your Information:'),
            SizedBox(height: 8.h),
            Text3(
              text:
              "•	Provide and Improve Our Services: We use your information to process your orders, communicate with you, and improve our app and services.",
            ),
            const SizedBox(height: 8.0),
            Text3(
                text:
                "•	Marketing and Advertising: With your consent, we may send you promotional materials or show you targeted advertisements based on your interests and preferences."),
            const SizedBox(height: 8.0),
            Text3(
                text:
                "•	Personalization: We may use your information to personalize your experience, such as recommending products or offers that may interest you."),

            SizedBox(height: 16.h),
            _buildSectionHeader('Information Sharing:'),
            SizedBox(height: 8.h),
            Text3(
                text:
                "•	Service Providers: We may share your information with third-party service providers who help us operate our app, process payments, or provide other services."),
            const SizedBox(height: 8.0),
            Text3(
              text:
              "•	Legal Compliance: We may disclose your information to comply with applicable laws, regulations, or legal processes, or to protect our rights or the rights of others.",
            ),
            SizedBox(height: 16.h),
            _buildSectionHeader('Data Security:'),
            SizedBox(height: 8.h),
            Text3(
              text:
              "•	We take reasonable measures to protect your information from unauthorized access, disclosure, alteration, or destruction. However, no method of transmission over the internet or electronic storage is 100% secure.",
            ),

            SizedBox(height: 8.h),

            _buildSectionHeader('Your Choices:'),
            SizedBox(height: 8.h),
            Text3(
              text:
              "•	You can access, update, or delete your account information at any time by logging into your account settings.",
            ),
            const SizedBox(height: 8.0),
            Text3(
              text:
              "•	You can opt out of receiving promotional emails by following the instructions provided in the email or contacting us directly.",
            ),

            SizedBox(height: 16.h),

            ///
            _buildSectionHeader('Children’s Privacy:'),
            SizedBox(height: 8.h),
            Text3(
              text:
              "•	Our app is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If you believe we have collected information from a child under 13, please contact us immediately.",
            ),

            SizedBox(height: 16.h),
            //
            _buildSectionHeader('Changes to This Privacy Policy:'),
            SizedBox(height: 8.h),
            Text3(
              text:
              "•	We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.",
            ),

            SizedBox(height: 16.h),
            //
            _buildSectionHeader('Contact Us:'),
            SizedBox(height: 8.h),
            Text3(
              text:
              "•	If you have any questions or concerns about this Privacy Policy or our practices, please contact us at bootiqapp@gmail.com",
            ),
            const SizedBox(height: 8.0),
            Text3(
              text:
              "•	Your use of third-party websites or services is subject to the terms and conditions and privacy policies of the respective third parties.",
            ),

            SizedBox(height: 16.h),
//

            SizedBox(height: 16.h),

            Text3(
              text:
              "By using our app, you agree to the collection and use of your information as described in this Privacy Policy. Thank you for trusting us with your privacy.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
