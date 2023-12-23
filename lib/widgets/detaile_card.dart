import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/theme_color.dart';
import 'package:pharma_track/widgets/medicine_buttom_sheet.dart';

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
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/download (2).png'),
                ),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(80)),
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    ' ${details['price']} S.P',
                    style: const TextStyle(
                        color: Color(0xff35bcd7),
                        fontSize: 20,
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
                'Pro : $outputDate1',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 260),
              child: Text(
                'Exp : ${details['expirationAt']}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 55, right: 16, left: 120),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          context: context,
                          builder: (context) {
                            return MedicineButtomSheeet(
                              name: details['name'],
                            );
                          });
                    },
                    child: Container(
                      height: 75,
                      width: 180,
                      decoration: BoxDecoration(
                          color: Color(0xff35bcd7),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          'Buy',
                          style: TextStyle(
                              color: kThirdColor2,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
