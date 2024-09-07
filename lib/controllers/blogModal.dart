// ignore_for_file: public_member_api_docs, sort_constructors_first
class blogModal {
  String Cityname;
  String ImageLink;
  String Description;
  String Author;
  String BlogContent;
  String BlogHeading;
  String BlogSubheading;
  blogModal({
    required this.Cityname,
    required this.ImageLink,
    required this.Description,
    required this.Author,
    required this.BlogContent,
    required this.BlogHeading,
    required this.BlogSubheading,
  });

  Map<String, dynamic> toJson() {
    return {
      'Cityname': Cityname,
      'ImageLink': ImageLink,
      'Description': Description,
      'Author': Author,
      'BlogContent': BlogContent,
      'BlogHeading': BlogHeading,
      'BlogSubheading': BlogSubheading,
    };
  }

  factory blogModal.fromJson(Map<String, dynamic> json) {
    return blogModal(
        Cityname: json['Cityname'],
        ImageLink: json['ImageLink'],
        Description: json['Description'],
        Author: json['Author'],
        BlogContent: json['BlogContent'],
        BlogHeading: json['BlogHeading'],
        BlogSubheading: json['BlogSubheading']);
  }
}
