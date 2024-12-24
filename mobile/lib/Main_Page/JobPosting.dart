import 'dart:convert';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:job_storage/Main_Page/values.dart';
import 'package:job_storage/Main_Page/HttpQuery.dart';

class JobPosting {
  final String name;
  final String description;
  final String employerName;
  final String experienceId;
  final String currency;
  final String area;
  final String sourceName;
  final String sourceLink;
  final List<String> keySkills;
  final double salaryFrom;
  final double salaryTo;

  JobPosting({
    required this.name,
    required this.description,
    required this.employerName,
    required this.experienceId,
    required this.currency,
    required this.area,
    required this.sourceName,
    required this.sourceLink,
    required this.keySkills,
    required this.salaryFrom,
    required this.salaryTo,
  });

  factory JobPosting.fromJson(Map<String, dynamic> json) {
    return JobPosting(
      name: json['name'],
      description: json['description'],
      employerName: json['employer_name'],
      experienceId: json['experience_id'],
      currency: json['currency'],
      area: json['area'],
      sourceName: json['source_name'],
      sourceLink: json['source_link'],
      keySkills: List<String>.from(json['key_skills']),
      salaryFrom: json['salary_from'].toDouble(),
      salaryTo: json['salary_to'].toDouble(),
    );
  }

  void print(String jsonString){
    try {
      final jsonMap = json.decode(jsonString);
      final jobPosting = JobPosting.fromJson(jsonMap);


      print('Название вакансии: ${jobPosting.name}');
      print('Описание: ${jobPosting.description}');
      print('Работодатель: ${jobPosting.employerName}');
      print('Ключевые навыки: ${jobPosting.keySkills}');
      print('Зарплата: от ${jobPosting.salaryFrom} ${jobPosting.currency} до ${jobPosting.salaryTo} ${jobPosting.currency}');
    } catch (e) {
      print('Ошибка при парсинге JSON: $e');
    }
  }
}

void main() {
  HttpQuary().testhttp();
  final jsonString = '''
  {
        "name": "Python-разработчик",
        "description": "Обязанности:  Автоматизация бизнес-процессов через API различных маркетплейсов (OZON, WB, Яндекс Маркет) Поддержка и развитие ETL процессов  Требования:  Владение Python Знание основ Git Знание библиотек pandas, requests Будут плюсом: навыки разработки баз данных Умение находить нетривиальные решения Умение самостоятельно определять сроки выполнения задачи исходя из собственных ресурсов Опыт командной разработки будет плюсом Опыт работы с большим объемом данных будет плюсом  Условия:  Официальное оформление по ТК РФ. График работы 5/2. Стабильная выплата заработной платы 2 раза в месяц. Наставничество более опытного сотрудника поможет легко адаптироваться и интегрироваться в работу. Дресс-код  ",
        "employer_name": "Теропром",
        "experience_id": "noExperience",
        "currency": "RUR",
        "area": "Екатеринбург",
        "source_name": "hh",
        "source_link": "https://hh.ru/vacancy/111866916",
        "key_skills": [
            "Python",
            "GitHub",
            "Оптимизация кода",
            "Рефакторинг кода",
            "Алгоритмы и структуры данных",
            "API",
            "Requests",
            "Git",
            "ETL",
            "E-Commerce",
            "OZON",
            "WildBerries",
            "Яндекс Маркет",
            "pandas"
        ],
        "salary_from": 60000.0,
        "salary_to": 100000.0
    }
  ''';

  try {
    final jsonMap = json.decode(jsonString);
    print(jsonMap);
    final jobPosting = JobPosting.fromJson(jsonMap);


    print('Название вакансии: ${jobPosting.name}');
    print('Описание: ${jobPosting.description}');
    print('Работодатель: ${jobPosting.employerName}');
    print('Ключевые навыки: ${jobPosting.keySkills}');
    print('Зарплата: от ${jobPosting.salaryFrom} ${jobPosting.currency} до ${jobPosting.salaryTo} ${jobPosting.currency}');
  } catch (e) {
    print('Ошибка при парсинге JSON: $e');
  }
}