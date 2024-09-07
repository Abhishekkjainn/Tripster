import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tripster/controllers/blogModal.dart';

class BlogsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<blogModal?> fetchBlog(String documentId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await _firestore.collection('blogs').doc(documentId).get();

      if (doc.exists && doc.data() != null) {
        return blogModal.fromJson(doc.data()!);
      } else {
        print('Document does not exist or has no data');
        return null;
      }
    } catch (e) {
      print('Error fetching blog: $e');
      return null;
    }
  }
}
