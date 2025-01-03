import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:job_storage/Main_Page/JobPosting.dart';
import 'package:job_storage/Main_Page/values.dart';



class HttpQuary{

  void testhttp() async {
    final url = Uri.parse('http://172.27.32.1:8000/parse/hh');
    final body = {
      "limit": 10,
      "text": "Программист",
      "area": "Екатеринбург",
      "salary": 100000,
      "experience_ids": [
        "noExperience"
      ],
      "currency": "RUR"};

    try {
      // Выполняем GET-запрос
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(body));

      if (response.statusCode == 200) {
        final data = jsonDecode(utf8.decode(response.bodyBytes));
        //json_yes = data.toString();
        json_yes = jsonEncode(utf8.decode(response.bodyBytes)).replaceAll("\\\"", "\"");
        json_yes = json_yes.replaceAll("\\\\\"", "");
        json_yes = json_yes.replaceAll("null", "\"\"");
        //debugPrint(json_yes, wrapWidth: 1024);
      } else {
        print('Ошибка: ${response.body}');
      }
    } catch (e) {
      print('Произошла ошибка: $e');
    }
    String json_two = json_yes.substring(2, json_yes.length - 2 );

    try {
      final jsonMap = json.decode(json_two);
      print(jsonMap);
      //final jobPosting = JobPosting.fromJson(jsonMap);
//
//
      //print('Название вакансии: ${jobPosting.name}');
      //print('Описание: ${jobPosting.description}');
      //print('Работодатель: ${jobPosting.employerName}');
      //print('Ключевые навыки: ${jobPosting.keySkills}');
      //print('Зарплата: от ${jobPosting.salaryFrom} ${jobPosting.currency} до ${jobPosting.salaryTo} ${jobPosting.currency}');
    } catch (e) {
      print('Ошибка при парсинге JSON: $e');
    }

    print(json_two);
  }

}


void main(){
  HttpQuary().testhttp();
}
