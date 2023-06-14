import 'package:flutter/material.dart';
import 'package:weatherapp_bloc/Widget/weather_screen_widget/citys_list.dart';

class CitySelected extends SearchDelegate<String> {
  final List cityList = CitysListe().citysListe;
  // List<String> cityList = [
  //   'Ankara',
  //   'İstanbul',
  //   'İzmir',
  //   'Adana',
  //   'Adıyaman',
  //   'Afyonkarahisar',
  //   'Ağrı',
  //   'Aksaray',
  //   'Amasya',
  //   'Antalya',
  //   'Ardahan',
  //   'Artvin',
  //   'Aydın',
  //   'Balıkesir',
  //   'Bartın',
  //   'Batman',
  //   'Bayburt',
  //   'Bilecik',
  //   'Bingöl',
  //   'Bitlis',
  //   'Bolu',
  //   'Burdur',
  //   'Bursa',
  //   'Çanakkale',
  //   'Çankırı',
  //   'Denizli',
  //   'Diyarbakır',
  //   'Düzce',
  //   'Edirne',
  //   'Elazığ',
  //   'Afyon',
  //   'Çorum',
  //   'Kayseri',
  //   'Erzincan',
  //   'Erzurum',
  //   'Hakkari',
  //   'Şırnak',
  //   'Hatay',
  //   'Iğdır',
  //   'Isparta',
  //   'Van',
  //   'Kars',
  //   'Muş',
  //   'Mardin',
  //   'Şanlıurfa',
  //   'Kahramanmaraş',
  //   'Karabük',
  //   'Karaman',
  //   'Gaziantep',
  //   'Kilis',
  //   'Osmaniye',
  //   'Kırıkkale',
  //   'Kırklareli',
  //   'Mersin',
  //   'Konya',
  //   'Kütahya',
  //   'Malatya',
  //   'Muğla',
  //   'Manisa',
  //   'Uşak',
  //   'Sakarya',
  //   'Samsun',
  //   'Tekirdağ',
  //   'Tokat',
  //   'Trabzon',
  //   'Tunceli',
  //   'Ordu',
  //   'Rize',
  //   'Sivas',
  //   'Giresun',
  //   'Yozgat',
  //   'Sinop',
  //   'Zonguldak',
  //   'Yalova',
  //   'Nevaşehir',
  //   'Gümüşhane',
  //   'Kırşehir',
  //   'Niğde',
  //   'Siirt',
  //   'Kocaeli',
  //   'Kastamonu',
  // ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isNotEmpty) {
              query = '';
            } else {
              close(context, query);
            }
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, query);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final List allCityList = cityList
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: allCityList.length,
      itemBuilder: (context, index) {
        var result = allCityList[index];
        return ListTile(
            title: Text(result),
            onTap: () {
              query = result;
              close(context, result);
            });
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List locationSuggestions = cityList
        .where((element) => element.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: locationSuggestions.length,
      itemBuilder: (context, index) {
        var result = locationSuggestions[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            query = result;
            close(context, result);
          },
        );
      },
    );
  }
}
