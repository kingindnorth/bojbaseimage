import 'package:get/get.dart';
import '../model/footer_section.dart';

class FooterController extends GetxController {
  final sections = <FooterSection>[
    FooterSection('Insurance Plans', [
      'Health Insurance Plans',
      'Individual Health Plans',
      'Family Floater Plans',
      'Critical Illness Insurance',
      'Maternity Health Insurance',
      'Senior Citizen Insurance',
      'Top-Up Health Insurance',
      'Group Health Insurance',
      'OPD & Wellness Add-ons',
    ]),
    FooterSection('Tools & Educational Resources', [
      'Premium Calculator',
      'Tax Savings Calculator',
      'Claims Estimator',
      'Health Insurance Comparison',
      'Hospital Network Finder',
      'Renewal Cost Calculator',
      'Health Blogs',
      'Edu-Bits Videos',
      'FAQs',
      'Glossary of Insurance Terms',
      'Download Brochure',
      'Download Center',
    ]),
    FooterSection('Claims', [
      'File a Claim',
      'Claims status and tracking',
      'Claims Summary',
      'Grievance Redressal',
    ]),
    FooterSection('Legal', [
      'IRDAI Consumer Education',
      'Terms & Conditions',
      'Privacy Policy',
    ]),
    FooterSection('About Prudential', [
      'About Us',
      'Careers',
    ]),
    FooterSection('Login', [
      'Customer Login',
      'Renew Policy',
      'Download Policy Document',
      'Agent / Broker Login',
      'Track My Policy',
      'Contact Us',
    ]),
  ].obs;

  final address = '501, BKC Corporate Tower,\nBandra (E), Mumbai – 400051';
  final phones = '1800 123 4567 | 1860 500 7890';
  final email  = 'prudentialcareforyou@phi.com';

  final disclaimer = [
    'Disclaimer: Health insurance is a subject of solicitation.',
    '1. Pre-authorisation approvals are processed within 30 minutes for valid and active policies.',
    '2. Claims data is considered from the inception of services starting [Year] up to [Recent Month/Year].',
    '3. Premiums shown are indicative and based on a standard plan variant.',
    '4. Never share OTP, CVV, passwords, or bank credentials with unknown individuals.',
  ];
}
