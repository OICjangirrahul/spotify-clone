import 'package:spotify/models/category.dart';

class Categoryoperation{
  Categoryoperation._(){}
  static List<Category> getCategories(){
    return <Category>[
      Category("top song", "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/0e/09/c4/0e09c462-c0cd-0a6c-d748-ea69b70442b7/source/256x256bb.jpg"),
      Category("sonu nigam", "https://c-cl.cdn.smule.com/rs-s57/arr/d1/d2/3e5985c2-f9ca-447e-a761-dbc831836406.jpg"),
      Category("sonu nigam", "https://c-cl.cdn.smule.com/rs-s57/arr/d1/d2/3e5985c2-f9ca-447e-a761-dbc831836406.jpg"),
      Category("top song", "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/0e/09/c4/0e09c462-c0cd-0a6c-d748-ea69b70442b7/source/256x256bb.jpg"),
    ];
  }
}