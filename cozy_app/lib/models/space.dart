import 'dart:convert';

List<Space> postFromJson(String str) => List<Space>.from(json.decode(str).map((x) => Space.fromJson(x)));

String postToJson(List<Space> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Space {
  Space({
    required this.id, 
    required this.name, 
    required this.imageUrl, 
    required this.price,
    required this.city, 
    required this.country, 
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });

  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;


  factory Space.fromJson(Map<String, dynamic> json) => Space(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      country: json['country'],
      price: json['price'],
      imageUrl: json['image_url'],
      rating: json['rating'],
      address: json['address'],
      phone: json['phone'],
      photos: json['photos'],
      mapUrl: json['map_url'],
      numberOfBedrooms: json['number_of_bedrooms'],
      numberOfCupboards: json['number_of_cupboards'],
      numberOfKitchens: json['number_of_kitchens']
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
        "country": country,
        "price": price,
        "image_url": imageUrl,
        "rating": rating,
        "address": address,
        "phone": phone,
        "map_url": mapUrl,
        "photos": photos,
        "number_of_kitchens": numberOfKitchens,
        "number_of_bedrooms": numberOfBedrooms,
        "number_of_cupboards": numberOfCupboards
      };
}