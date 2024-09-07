import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  final Cityname;
  final ImageLink;
  final Description;
  final Author;
  final BlogContent;
  final BlogHeading;
  final BlogSubheading;
  const BlogScreen(
      {super.key,
      required this.Cityname,
      required this.Author,
      required this.BlogContent,
      required this.BlogHeading,
      required this.BlogSubheading,
      required this.Description,
      required this.ImageLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 255, 214, 1),
        backgroundColor: const Color.fromARGB(50, 0, 0, 0),
        title: Text(
          Cityname,
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(ImageLink), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
              child: Text(
                Cityname,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 0, right: 10),
              child: Text(
                BlogHeading,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15, right: 10),
              child: Text(
                BlogSubheading,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              child: Text(
                BlogContent,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
