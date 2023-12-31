import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/views/medicine_detail_view.dart';
import 'package:pharma_track/widgets/medicine_buttom_sheet.dart';

class MedicineTile extends StatefulWidget {
  MedicineTile({
    super.key,
    required this.name,
    required this.tName,
    required this.image,
    required this.companyName,
    required this.form,
    required this.expirationAt,
    required this.details,
    required this.createdAt,
    required this.updatedAt,
    this.price,
    this.quantity,
  });
  final String name;
  final String tName;
  String? image;
  final String companyName;

  final String form;
  int? quantity;
  int? price;
  final String expirationAt;
  final String details;
  final String createdAt;
  final String updatedAt;

  @override
  State<MedicineTile> createState() => _MedicineTileState();
}

class _MedicineTileState extends State<MedicineTile> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MedicineDetaileView.id, arguments: {
            'name': widget.name,
            'tName': widget.tName,
            'image': widget.image,
            'companyName': widget.companyName,
            'form': widget.form,
            'quantity': widget.quantity,
            'price': widget.price,
            'expirationAt': widget.expirationAt,
            'details': widget.details,
            'createdAt': widget.createdAt,
            'updatedAt': widget.updatedAt,
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kThirdColor2,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 32,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 12),
                      child: SizedBox(
                        width: 150,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            //image ??
                            "assets/images/images (7).png",
                            height: 90,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8),
                    //   child: Text(
                    //     name,
                    //     maxLines: 2,
                    //     style: const TextStyle(
                    //       color: kPrimaryColor,
                    //       fontSize: 17,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 1,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.tName,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              fav = !fav;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
                Positioned(
                  right: 50,
                  top: 165,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          context: context,
                          builder: (context) {
                            return MedicineButtomSheeet(
                              name: widget.name,
                            );
                          });
                    },
                    child: Center(
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Color(0xff7BD3EA),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          "Buy",
                          style: TextStyle(color: kThirdColor2, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //     right: 4,
                //     top: -190,
                //     child: GestureDetector(
                //         onTap: () {
                //           fav = !fav;
                //           setState(() {});
                //         },
                //         child: fav
                //             ? const Icon(
                //                 Icons.favorite_border_outlined,
                //                 size: 30,
                //                 color: Colors.red,
                //               )
                //             : const Icon(
                //                 Icons.favorite,
                //                 size: 30,
                //                 color: Colors.red,
                //               )))
              ],
            ),
          ),
        ));
  }
}
