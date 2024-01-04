import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma_track/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:pharma_track/widgets/medicine_buttom_sheet.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key,
    required this.details,
    required this.outputDate1,
  });

  final Map<String, dynamic> details;
  final String outputDate1;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    fav = widget.details['favourite'] == 0 ? false : true;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Container(
            height: 180,
            width: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              "assets/images/images (8).png",
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.details['tName']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.details['name'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Company: ${widget.details['companyName']}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Form: ${widget.details["form"]}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Details: ${widget.details['details']}",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.outputDate1,
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            widget.details['expirationAt'],
                            style: const TextStyle(fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 225),
                            child: Text(
                              ' ${widget.details['price']} S.P',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
                // GestureDetector(
                //   onTap: () {
                //     showModalBottomSheet(
                //         isScrollControlled: true,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(16)),
                //         context: context,
                //         builder: (context) {
                //           return MedicineButtomSheeet(
                //             name: '${widget.details['tName']}',
                //           );
                //         });
                //   },
                //   child: Container(
                //     height: 50,
                //     width: 50,
                //     decoration: const BoxDecoration(
                //       color: Color(0xff31a9e3),
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(64),
                //       ),
                //     ),
                //     child: Icon(
                //       Icons.add,
                //       color: Colors.white,
                //       size: 30,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
