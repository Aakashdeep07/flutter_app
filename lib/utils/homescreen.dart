import 'dart:html';

import 'package:bpibs_project/utils/authservice.dart';
import 'package:bpibs_project/utils/upload_operation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? imgUrl;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: Image.asset('assets/ass.png'),
                      height: 100, // set your height
                      width: 100, // and width here
                    ),
                    ElevatedButton(
                        onPressed: () {
                          uploadToStorage();
                        },
                        child: Text('Upload Assignment'))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Assignment"),
                    ElevatedButton(
                        onPressed: () {
                          AuthService().signout();
                        },
                        child: Text('Upload Assignment'))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Logged In Successfully"),
                    ElevatedButton(
                        onPressed: () {
                          AuthService().signout();
                        },
                        child: Text('Sign out'))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Logged In Successfully"),
                    SizedBox(
                      height: 3.0,
                      child: Image.asset(
                        'assets/ass.png',
                        fit: BoxFit.cover,
                        height: 50, // set your height
                        width: 70,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          AuthService().signout();
                        },
                        child: Text('Sign out'))
                  ],
                ),
              ],
            )));
  }

  uploadToStorage() {
    FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('newfile').putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }

//  @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initialization,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Center(
//             child: Text("Something Went wrong"),
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Scaffold(
//               body: Column(
//             children: [
//               imgUrl == null
//                   ? Placeholder(
//                       fallbackHeight: 200,
//                       fallbackWidth: 400,
//                     )
//                   : Container(
//                       height: 300,
//                       width: 300,
//                       child: Image.network(
//                         imgUrl!,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//               SizedBox(
//                 height: 50,
//               ),
//               RaisedButton(
//                 onPressed: () => uploadToStorage(),
//                 color: Colors.red,
//                 child: Text("Upload"),
//               ),
//             ],
//           ));
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }

}
