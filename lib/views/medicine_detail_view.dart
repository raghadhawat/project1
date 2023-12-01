import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/theme_color.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';
import 'package:pharma_track/widgets/detaile_card.dart';

class MedicineDetaileView extends StatelessWidget {
  const MedicineDetaileView({super.key});
  static String id = 'MedicineDetaileView';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> details =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const AppBarText(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: ThemeColor(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                kLogo,
                height: 350,
                width: MediaQuery.of(context).size.width,
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
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      r'$' ' ${details['price']}',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Container(
                  child: Text(
                    '${details['tName']} MADE BY ${details['companyName']}',
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Row(
                  children: [
                    Text(
                      "FORM : ${details['form']}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text("QUANTITY : ${details['quantity']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Text(
                  details['details'],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text('${details['created_at']}')
            ],
          ),
        ),
      ),
    );
  }
}
