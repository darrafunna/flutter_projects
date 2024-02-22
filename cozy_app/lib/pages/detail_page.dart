import 'package:cozy_app/models/space.dart';
import 'package:cozy_app/pages/error_page.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/widgets/facility_item.dart';
import 'package:cozy_app/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {

  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1,2,3,4,5].map((index){
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: RatingItem(
                                    index: index, 
                                    rating: space.rating
                                    ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Main Facilities',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'Kitchen',
                              imageUrl: 'assets/icon_bar_counter.png',
                              total: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'Bedroom',
                              imageUrl: 'assets/icon_double_bed.png',
                              total: space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Big Lemari',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: PHOTOS
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Photos',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:
                            space.photos.map((item){
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 24
                                ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                              ),
                              );
                            }).toList(),
                            //[
                            // const SizedBox(
                            //   width: 24,
                            // ),
                            // Image.asset(
                            //   'assets/photo1.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // const SizedBox(
                            //   width: 18,
                            // ),
                            // Image.asset(
                            //   'assets/photo2.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // const SizedBox(
                            //   width: 18,
                            // ),
                            // Image.asset(
                            //   'assets/photo3.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // const SizedBox(
                            //   width: 18,
                            // ),
                            // Image.asset(
                            //   'assets/photo4.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // const SizedBox(
                            //   width: 18,
                            // ),
                            // Image.asset(
                            //   'assets/photo5.png',
                            //   width: 110,
                            //   height: 88,
                            //   fit: BoxFit.cover,
                            // ),
                            // const SizedBox(
                            //   width: 24,
                            // ),
                          //],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //NOTE: LOCATION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              space.address,
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () async {
                                  // const link = "https://goo.gl/maps/SyZx2yjWB1yR6AeH8";
                                  // // const link = "qwertyuiop";
                                  // const linkError = "qwertyuiop";
                                  String? link = space.mapUrl;
                                  bool _validURL = Uri.parse(link).isAbsolute;

                                  if (link.isNotEmpty && _validURL == true) {
                                    await launchUrl(
                                      Uri.parse(link),
                                      mode: LaunchMode.externalApplication,
                                    );
                                  } else {
                                    // Jika URL tidak valid atau kosong, gunakan Navigator untuk pindah halaman
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ErrorPage()),
                                    );
                                  }
                                },
                              child: Image.asset(
                                'assets/btn_location.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          onPressed: () {
                            launchUrl(
                              Uri(
                                scheme: 'tel',
                                path: space.phone
                              )
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(purpleColor),
                              shape:
                                  MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ))),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                  ),
                ],
              ),
            ),          
          ],
        ),
      ),
    );
  }
}
