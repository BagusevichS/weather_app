import 'package:flutter/cupertino.dart';

import 'functions.dart';

class Constants {
  static TextEditingController controller = TextEditingController();
  static PageController pageController = PageController();
  static String setBackground(int currentPage) {
    if (weatherList.isNotEmpty && currentPage >= 0 && currentPage < weatherList.length) {
      String conditionText = weatherList[currentPage].current.condition.text.toLowerCase();
      List<String> timeParts = weatherList[currentPage].location.localtime!.split(' ')[1].split(':');
      int hours = int.parse(timeParts[0]);

      if (hours >= 22 || hours < 6) {
        return 'lib/assets/night_sky.jpg';
      } else if (conditionText.contains('sun')) {
        return 'lib/assets/bright-sky.jpg';
      } else if (conditionText.contains('cloud')) {
        return 'lib/assets/cloudy1.png';
      } else if (conditionText.contains('snow')) {
        return 'lib/assets/showy.jpeg';
      } else if (conditionText.contains('rain')) {
        return 'lib/assets/rainy.jpeg';
      }else if (conditionText.contains('overcast')) {
        return 'lib/assets/overcast.jpg';
      }else if (conditionText.contains('mist') || conditionText.contains('fog')) {
        return 'lib/assets/mist.jpg';
      }else if (conditionText.contains('clear')) {
        return 'lib/assets/clear.jpg';
      }
    }
    return 'lib/assets/default.jpg';
  }
}
