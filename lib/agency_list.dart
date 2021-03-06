import 'package:angel/category.dart';
import 'package:flutter/material.dart';
import 'agency_list/detail_page.dart';
import 'agency_list/lesson.dart';
import 'loginpage.dart';

class AgencyListPage extends StatefulWidget {
  AgencyListPage({Key key, this.title,this.detailsUser}) : super(key: key);

  final String title;
  final UserDetails detailsUser;

  @override
  _AgencyListPageState createState() => _AgencyListPageState();
}

class _AgencyListPageState extends State<AgencyListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        height: 300.0,
        width: 130.0,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(lesson.photo)
            )),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.level,
                    style: TextStyle(color: Colors.black))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        height: 100,
        //decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    return Scaffold(
      drawer: Drawer(
        child: Category(widget.detailsUser),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '기관 목록',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
      ),
      body: makeBody,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Save the Children",
        level: "Save",
        content: "기부 내용",
        photo: 'http://blogfiles.naver.net/20111005_244/qufwhd23_1317820011524joyvX_JPEG/main_banner1.jpg',
        homepageurl: 'www.sc.or.kr'),
    Lesson(
        title: "Observation at Junctions",
        level: "Beginner",
        content: "기부 내용",
        photo: 'http://blogfiles.naver.net/20140429_229/lllllkhc_1398743947569e7SF1_PNG/%B1%C2%B3%D7%C0%CC%B9%F6%BD%BA_%B7%CE%B0%ED.png'),
    Lesson(
        title: "Reverse parallel Parking",
        level: "Intermidiate",
        content: "기부 내용",
        photo: 'http://blogfiles.naver.net/20111005_244/qufwhd23_1317820011524joyvX_JPEG/main_banner1.jpg'),
    Lesson(
        title: "Reversing around the corner",
        level: "Intermidiate",
        content:
        "Start by taking a couple of minutes to read the info in this section.",
        photo: 'http://blogfiles.naver.net/20140429_229/lllllkhc_1398743947569e7SF1_PNG/%B1%C2%B3%D7%C0%CC%B9%F6%BD%BA_%B7%CE%B0%ED.png'),
    Lesson(
        title: "Incorrect Use of Signal",
        level: "Advanced",
        content:
        "Start by taking a couple of minutes to read the info in this section. ",
        photo: 'http://blogfiles.naver.net/20111005_244/qufwhd23_1317820011524joyvX_JPEG/main_banner1.jpg'),

    Lesson(
        title: "Engine Challenges",
        level: "Advanced",
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button. ",
        photo: 'http://blogfiles.naver.net/20111005_244/qufwhd23_1317820011524joyvX_JPEG/main_banner1.jpg'),
    Lesson(
        title: "Self Driving Car",
        level: "Advanced",
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  ",
        photo: 'http://blogfiles.naver.net/20140429_229/lllllkhc_1398743947569e7SF1_PNG/%B1%C2%B3%D7%C0%CC%B9%F6%BD%BA_%B7%CE%B0%ED.png')
  ];
}
