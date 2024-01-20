import 'package:auto_route/auto_route.dart';
import 'package:eco_market/features/about/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'assets/images/network/info.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Эко Маркет',
                      style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Фрукты, овощи, зелень, сухофрукты а так же сделанные из натуральных ЭКО продуктов (варенье, салаты, соления, компоты и т.д.) можете заказать удобно, качественно и по доступной цене. Готовы сотрудничать взаимовыгодно с магазинами. Наши цены как на рынке. Мы заинтересованы в экономии ваших денег и времени. Стоимость доставки 150 сом и ещё добавлен для окраину города. При отказе подтвержденного заказа более  2-х раз Клиент заносится в чёрный список!!',
                      style: TextStyle(
                        color: Color(0xFFABABAD),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                      width: double.infinity,
                    ),
                    SocialButtonWidget(
                      onPressed: () {
                        setState(() {
                          _makePhoneCall();
                        });
                      },
                      text: 'Позвонить',
                      child: SvgPicture.asset('assets/svg/icons/phone.svg'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SocialButtonWidget(
                      onPressed: () {
                        _launchWhatsaPP();
                      },
                      text: 'WhatsApp',
                      child: SvgPicture.asset('assets/svg/icons/whatsapp.svg'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SocialButtonWidget(
                      onPressed: () {
                        _launchInstagram();
                      },
                      text: 'Instagram',
                      child: SvgPicture.asset('assets/svg/icons/instagram.svg'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _launchWhatsaPP() async {
    const url = 'https://wa.me/+79963809658';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchInstagram() async {
    const url = 'https://instagram.com/zarlyk_zhanybekov';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: '+79963809658',
    );
    await launchUrl(launchUri);
  }
}
