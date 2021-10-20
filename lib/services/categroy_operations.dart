import 'package:spotify/models/category.dart';

class Categoryoperation{
  Categoryoperation._(){}
  static List<Category> getCategories(){
    return <Category>[
      Category("arjit singh", "https://m.media-amazon.com/images/I/61yIZVd-eXL._SS500_.jpg"),
      Category("sriya gosal", "https://c-cl.cdn.smule.com/rs-s79/arr/12/98/ec669868-c5e6-485b-b676-5f3cc7202e10.jpg"),
      Category("sonu nigam", "https://c-cl.cdn.smule.com/rs-s57/arr/d1/d2/3e5985c2-f9ca-447e-a761-dbc831836406.jpg"),
      Category("honey singh", "https://pbs.twimg.com/profile_images/604906186899472384/XY6sssJB_400x400.jpg"),
    ];
  }
}