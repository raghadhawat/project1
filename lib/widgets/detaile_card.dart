import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/theme_color.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    super.key,
    required this.details,
    required this.outputDate1,
  });

  final Map<String, dynamic> details;
  final String outputDate1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: ThemeColor(),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/images/medicine-typography-word-art-background-of-drugstore-pharmacy-pill-tablet-bottle-glass-snake-with-outline-style-vector-design-illustration-2E35TBG.jpg'),
                ),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(46)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    color: kPrimaryColor.withOpacity(.05),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                children: [
                  Text(
                    details['name'],
                    style: const TextStyle(
                        color: Color(0xff35bcd7),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    ' ${details['price']} S.P',
                    style: const TextStyle(
                        color: Color(0xff35bcd7),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Text(
                '${details['tName']}',
                style: const TextStyle(
                  fontSize: 20,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                "FORM : ${details['form']}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "QUANTITY : ${details['quantity']}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                details['details'],
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 260),
              child: Text(
                'Pro : ${outputDate1}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 260),
              child: Text(
                'Exp : ${details['expirationAt']}',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
