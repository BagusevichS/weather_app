import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'functions.dart';

class Constants {
  static TextEditingController controller = TextEditingController();
  static String setBackground(int currentPage) {
    if (weatherList.isNotEmpty && currentPage >= 0 && currentPage < weatherList.length) {
      String conditionText = weatherList[currentPage].current.condition.text.toLowerCase();
      List<String> timeParts = weatherList[currentPage].location.localtime!.split(' ')[1].split(':');
      int hours = int.parse(timeParts[0]);

      if (hours >= 22 || hours < 6) {
        return 'lib/assets/background/night_sky.jpg';
      } else if (conditionText.contains('sun')) {
        return 'lib/assets/background/bright-sky.jpg';
      } else if (conditionText.contains('cloud')) {
        return 'lib/assets/background/cloudy1.png';
      } else if (conditionText.contains('snow')|| conditionText.contains('sleet')) {
        return 'lib/assets/background/showy.jpeg';
      } else if (conditionText.contains('rain')|| conditionText.contains('drizzle')) {
        return 'lib/assets/background/rainy.jpeg';
      }else if (conditionText.contains('overcast')) {
        return 'lib/assets/background/overcast.jpg';
      }else if (conditionText.contains('mist') || conditionText.contains('fog')) {
        return 'lib/assets/background/mist.jpg';
      }else if (conditionText.contains('clear')) {
        return 'lib/assets/background/clear.jpg';
      }
    }
    return 'lib/assets/background/night_sky.jpg';
  }

  static String setCondition(int currentPage) {
    String conditionText = weatherList[currentPage].current.condition.text.toLowerCase();
    if (weatherList.isNotEmpty && currentPage >= 0 && currentPage < weatherList.length) {

      if (conditionText.contains('sun')) {
        return 'Солнечно';
      } else if (conditionText.contains('cloud')) {
        return 'Облачно';
      } else if (conditionText.contains('snow')|| conditionText.contains('sleet')) {
        return 'Снег';
      } else if (conditionText.contains('rain')) {
        return 'Дождь';
      }else if (conditionText.contains('overcast')) {
        return 'Пасмурно';
      }else if (conditionText.contains('mist') || conditionText.contains('fog')) {
        return 'Туман';
      }else if (conditionText.contains('clear')) {
        return 'Ясно';
      }
    }
    return conditionText;
  }

  static Object setIcon(int currentPage) {
    if (weatherList.isNotEmpty && currentPage >= 0 && currentPage < weatherList.length) {
      String conditionText = weatherList[currentPage].current.condition.text.toLowerCase();
      List<String> timeParts = weatherList[currentPage].location.localtime!.split(' ')[1].split(':');
      int hours = int.parse(timeParts[0]);

      if (hours >= 22 || hours < 6) {
        return Icons.nightlight_outlined;
      } else if (conditionText.contains('sun')) {
        return Icons.wb_sunny_outlined;
      } else if (conditionText.contains('cloud')) {
        return CupertinoIcons.cloud_sun;
      } else if (conditionText.contains('snow')|| conditionText.contains('sleet')) {
        return Icons.ac_unit_outlined;
      } else if (conditionText.contains('rain')) {
        return CupertinoIcons.cloud_drizzle;
      }else if (conditionText.contains('overcast')) {
        return Icons.cloud;
      }else if (conditionText.contains('mist') || conditionText.contains('fog')) {
        return CupertinoIcons.cloud_fog;
      }else if (conditionText.contains('clear')) {
        return CupertinoIcons.sun_max;
      }
    }
    return CupertinoIcons.cloud;
  }
}
