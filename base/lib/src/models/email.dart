import 'package:flutter/material.dart';

class Email {
  final String name, subject, body, time, image;
  final bool isAttachmentAvailable, isChecked;
  final Color? tagColor;

  Email({
    required this.name,
    required this.subject,
    required this.body,
    required this.time,
    required this.image,
    required this.isAttachmentAvailable,
    required this.isChecked,
    required this.tagColor,
  });
}

List<Email> emails = List.generate(
    demoData.length,
    (index) => Email(
        name: demoData[index]['name'],
        subject: demoData[index]['subject'],
        body: demoData[index]['body'],
        time: demoData[index]['time'],
        image: demoData[index]['image'],
        isAttachmentAvailable: demoData[index]['isAttachmentAvailable'],
        isChecked: demoData[index]['isChecked'],
        tagColor: demoData[index]['tagColor']));

List demoData = [
  {
    "name": "Apple",
    "image": "assets/images/emails/user_1.png",
    "subject": "iPhone 12 is here",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": null,
    "time": "Now",
    "body": "1. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed"
  },
  {
    "name": "Elvia Atkins",
    "image": "assets/images/emails/user_2.png",
    "subject": "Inspiration for our new home",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "15:32",
    "body": "2. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed"
  },
  {
    "name": "Marvin Kiehn",
    "image": "assets/images/emails/user_3.png",
    "subject": "Business-focused empowering the world",
    "isAttachmentAvailable": true,
    "isChecked": false,
    "tagColor": null,
    "time": "14:27",
    "body": "3. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed",
  },
  {
    "name": "Domenic Bosco",
    "image": "assets/images/emails/user_4.png",
    "subject": "The fastest way to Design",
    "isAttachmentAvailable": false,
    "isChecked": true,
    "tagColor": const Color(0xFF23CF91),
    "time": "10:43",
    "body": "4. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed"
  },
  {
    "name": "Elenor Bauch",
    "image": "assets/images/emails/user_5.png",
    "subject": "New job opportunities",
    "isAttachmentAvailable": false,
    "isChecked": false,
    "tagColor": const Color(0xFF3A6FF7),
    "time": "9:58",
    "body": "5. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed. Corporis illo provident. Sunt omnis neque et aperiam. Nemo ut dolorum fugit eum sed"
  }
];

