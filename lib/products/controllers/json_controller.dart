/*

import 'dart:convert';

import 'package:bear_not_bear/model/beer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

class JsonController extends GetxController {
  var jsonResultBeers;

  bool modo_local = false;

  final Rx<List<Beer>> _beerList = Rx<List<Beer>>([]);
  List<Beer> get beers => _beerList.value.obs;

  @override
  void onReady() {
    loadJson();
  }

  loadJson() async {
    try {
      if (modo_local) {
        String data = await rootBundle.loadString('assets/beers.json');

        //print(jsonDecode(data));

        List jsonResultBeers = jsonDecode(data);

        final listResultBeers =
            jsonResultBeers.map((e) => Beer.fromJson(e)).toList();

        _beerList.value = listResultBeers;

        print(_beerList.value);
      } else {
        var url = Uri.parse("https://api.punkapi.com/v2/beers");

        http.get(url).then((res) {
          try {
            List jsonResultBeers = jsonDecode(res.body);

            _beerList.value =
                jsonResultBeers.map((e) => Beer.fromJson(e)).toList();

            if (_beerList.value[0].method!.mash_temp != null) {
              print(_beerList.value[0].method!.mash_temp![0].duration);
            }
          } catch (e) {
            print(e);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
*/
