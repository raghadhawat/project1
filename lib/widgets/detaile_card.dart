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
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              "assets/images/images (8).png",
              height: 200,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 24),
                                    child: Text(
                                      '${widget.details['tName']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      widget.details['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  "Company:${widget.details['companyName']}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  "Form:${widget.details["form"]}",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  widget.details['details'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 230,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        widget.outputDate1,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        widget.details['expirationAt'],
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16,
                                ),
                                child: Text(
                                  ' ${widget.details['price']} S.P',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 24),
                        //   child: GestureDetector(
                        //       onTap: () {
                        //         fav = !fav;
                        //         BlocProvider.of<AllApiCubit>(context)
                        //             .allMedicine(
                        //           context,
                        //         );
                        //         setState(() {});
                        //         BlocProvider.of<AllApiCubit>(context)
                        //             .addFavourit(context,
                        //                 fav: fav, id: widget.details["id"]!);
                        //       },
                        //       child: Icon(
                        //         !fav ? Icons.favorite_outline : Icons.favorite,
                        //         color: Colors.red,
                        //         size: 32,
                        //       )),
                        // ),
                        const SizedBox(
                          height: 240,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xff31a9e3),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(64),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    context: context,
                                    builder: (context) {
                                      return MedicineButtomSheeet(
                                        name: '${widget.details['tName']}',
                                      );
                                    });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(16),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
