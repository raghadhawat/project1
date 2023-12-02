import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/theme_color.dart';
import 'package:pharma_track/widgets/app_bar_text.dart';

class MedicineDetaileView extends StatelessWidget {
  const MedicineDetaileView({super.key});
  static String id = 'MedicineDetaileView';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> details =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var inputDate1 = DateTime.parse(details['createdAt']);
    var outputFormat1 = DateFormat('dd/MM/yyyy');
    var outputDate1 = outputFormat1.format(inputDate1);
    print(outputDate1);

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
                      ' ${details['price']} S.P',
                      style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: Container(
                  child: Text(
                    '${details['tName']} MADE BY ${details['companyName']}',
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Text(
                  details['details'],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
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
      ),
    );
  }
}
