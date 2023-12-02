import 'package:flutter/material.dart';
import 'package:pharma_track/constants.dart';
import 'package:pharma_track/views/medicine_detail_view.dart';

class MedicineTile extends StatelessWidget {
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
  final String image;
  final String companyName;

  final String form;
  int? quantity;
  int? price;
  final String expirationAt;
  final String details;
  final String createdAt;
  final String updatedAt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, MedicineDetaileView.id, arguments: {
            'name': name,
            'tName': tName,
            'image': image,
            'companyName': companyName,
            'form': form,
            'quantity': quantity,
            'price': price,
            'expirationAt': expirationAt,
            'details': details,
            'createdAt': createdAt,
            'updatedAt': updatedAt,
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kThirdColor2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    image ?? "",
                    height: 90,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    name,
                    maxLines: 2,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    tName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
