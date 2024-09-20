import 'package:bookapp/model/components/bookcard_widget.dart';
import 'package:bookapp/model/global/global.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class MyRatingScreen extends StatefulWidget {
  MyRatingScreen({super.key});

  @override
  State<MyRatingScreen> createState() => _MyRatingScreenState();
}

class _MyRatingScreenState extends State<MyRatingScreen> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: backgroundColor,
            flexibleSpace: Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Row(
                              children: [
                                Text(
                                  'نقد ها و امتیاز های من',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            SizedBox(height: 20),
            // Wrap ButtonsTabBar with a Container to add a border
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 41,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1, // Border width
                ),
                borderRadius:
                    BorderRadius.circular(5), // Optional: Rounded corners
              ),
              child: Center(
                child: ButtonsTabBar(
                  onTap: (p0) {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  unselectedBackgroundColor: backgroundColor,
                  unselectedLabelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 174, 212),
                      borderRadius: BorderRadius.circular(5)),
                  tabs: [
                    Tab(
                      child: Container(
                        child: Center(
                            child: Text(
                          'منتظر امتیاز من',
                          style: TextStyle(
                              color:
                                  selected != true ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )),
                        width: 148,
                      ),
                    ),
                    Tab(
                      child: Container(
                        child: Center(
                            child: Text(
                          'نقد ها و امتیاز‌های من',
                          style: TextStyle(
                              color: selected != false
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )),
                        width: 148,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Scaffold(
                    backgroundColor: backgroundColor,
                    body: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 75,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image(
                              image: AssetImage('lib/assets/images/myrate.png'),
                              fit: BoxFit.fill,
                              width: 210,
                              height: 180,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'اولین نقد و امتیازت را ثبت کن!',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            height: 30,
                            child: RawMaterialButton(
                              fillColor: Color.fromARGB(255, 0, 174, 212),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    'لیست کتاب های در انتظار',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              onPressed: () async {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: backgroundColor,
                    body: Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => BookCardListWidget(
                          bookId: '',
                          bookWriter: 'دکتر مهران نوربخش',
                          bookRate: 1,
                          bookPrice: '115.000',
                          bookName: "مدیریت چالش ها و پیچیدگی های اندودانتیکس",
                          bookImage: "lib/assets/images/book.png",
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
