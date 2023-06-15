import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class profilePage extends ConsumerWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.width * 0.35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                      "12.5K",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("Takipçi"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: size.width * 0.22,
                        width:  size.width * 0.22,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height:size.width * 0.2,
                        width: size.width * 0.2,
                        child: Image.network("https://cdn-icons-png.flaticon.com/512/3135/3135715.png")//Hero
                      ),
                      Positioned(
                        bottom: 0.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 17,
                            width: 50,
                            color: Colors.black,
                            child: const Center(
                              child: Text(
                                "Admin",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]
                  ),
                  Text("Name"),
                  Text("Surmane")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                Text(
                  "2.5K",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                  Text("Takip"),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            profilCustomBtn("Mesaj"),
            SizedBox(width: 10),
            profilCustomBtn("Takip Et"),
          ],
        ),
        Row(),
      ],
    );
  }

  Widget profilCustomBtn(String title) {
    return DecoratedBox(decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8)
        ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              title == "Mesaj"
                  ? Icons.mail
                  : Icons.add,
              size: 15,
              color : Colors.white
            ),
            Text(
              "$title",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
