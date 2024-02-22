import 'package:cozy_app/models/tips.dart';
import 'package:cozy_app/providers/space_provider.dart';
import 'package:cozy_app/widgets/bottom_navbar_item.dart';
import 'package:cozy_app/widgets/city_card.dart';
import 'package:cozy_app/widgets/space_card.dart';
import 'package:cozy_app/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:cozy_app/theme.dart';
import 'package:cozy_app/models/city.dart';
import 'package:cozy_app/models/space.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
        
            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Popular Cities',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city1.png',
                      isPopular: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/city3.png',
                      isPopular: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/city4.png',
                      isPopular: false,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/city5.png',
                      isPopular: true,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/city6.png',
                      isPopular: false,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // NOTE: RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Recommended Space',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: 
              
              FutureBuilder<List<Space>?>(
                future: SpaceProvider().getSpace(),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError){
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Space> spaces = snapshot.data!;
                    // return Text('Number of spaces: ${spaces.length}');
                    int index = 0;
                    return Column(
                      children: spaces.map((space) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                          ),
                          child: SpaceCard(space),
                        );
                      }).toList(),
                    );
                  }
                  // if(snapshot.data is List<dynamic>){

                  //    List<Space> data = (snapshot.data as List<dynamic>)
                  //     .map((item) => Space.fromJson(item as Map<String, dynamic>))
                  //     .toList();

                  //   int index = 0;

                  //   return Column(
                  //     children: data.map((item){
                  //       index++;
                  //       return Container(
                  //         margin: EdgeInsets.only(
                  //           top: index == 1 ? 0 : 30,
                  //         ),
                  //         child: SpaceCard(item),
                  //       );
                  //     }).toList(),
                  //   );
                  // }

                  // return const Center(
                  //   child: CircularProgressIndicator(),
                  // );
                },
              ),

              
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Tips & Guidance',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(children: [
                TipsCard(
                  Tips(
                    id: 1,
                    title: 'City Guidelines',
                    imageUrl: 'assets/tips1.png',
                    updatedAt: '20 Apr',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TipsCard(
                  Tips(
                    id: 2,
                    title: 'Jakarta Fairship',
                    imageUrl: 'assets/tips2.png',
                    updatedAt: '11 Dec',
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 70 + edge,
            ),
            
          ],
        ),
      ),
      floatingActionButton: 
      Container(
                height: 65,
                width: MediaQuery.of(context).size.width - (2 * edge),
                margin: EdgeInsets.symmetric(
                  horizontal: edge,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF6F7F8),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  BottomNavbarItem(
                    imageUrl: 'assets/nav_home_fill.png',
                    isActive: true,
                  ),
                  BottomNavbarItem(
                    imageUrl: 'assets/nav_mail.png',
                    isActive: false,
                  ),
                  BottomNavbarItem(
                    imageUrl: 'assets/nav_card.png',
                    isActive: false,
                  ),
                  BottomNavbarItem(
                    imageUrl: 'assets/nav_love.png',
                    isActive: false,
                  ),
                ]),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
