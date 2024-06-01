import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(

        color: Colors.blue,
        shadowColor: Colors.black.withOpacity(0.2),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home, color: Colors.white)),
            Tab(icon: Icon(Icons.chat, color: Colors.white)),
            Tab(icon: Icon(Icons.search, color: Colors.white)),
            Tab(icon: Icon(Icons.group, color: Colors.white)),
            Tab(icon: Icon(Icons.person, color: Colors.white, size: 40)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Center(child: Text('Home')),
          Center(child: Text('Chat')),
          Center(child: Text('Search')),
          Center(child: Text('Group')),
          profileContent(context),
        ],
      ),
    );
  }

  Widget profileContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2 - 80,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 130),
                        child: Container(
                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(65.5),
                          ),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage('assets/mypic.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '@takwabentaleb',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 75),
                    child: Text(
                      'Takwa Bentaleb',
                      style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        iconContainer(Icons.photo_camera, 'Camera', withBorder: false),
                        iconContainer(Icons.fingerprint, 'Security', withBorder: false),
                        iconContainer(Icons.phone, 'Phone', withBorder: false),
                        iconContainer(Icons.settings, 'Settings', withBorder: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 80, right: 34, left: 34),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        iconContainer(Icons.dashboard, 'Dashboard', withBorder: true),
                        iconContainer(Icons.account_balance, 'Balance', withBorder: true),
                        iconContainer(Icons.credit_card, 'CreditCard', withBorder: true),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        iconContainer(Icons.language, 'Language', withBorder: true),
                        iconContainer(Icons.question_answer, 'Questions', withBorder: true),
                        iconContainer(Icons.visibility, 'Visibility', withBorder: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget iconContainer(IconData icon, String label, {required bool withBorder}) {
    return Container(
      height: 60,
      width: withBorder ? 95 : 70,
      decoration: BoxDecoration(
        color: withBorder ? Colors.white : Colors.transparent,
        border: withBorder ? Border.all(color: Colors.black) : null,
        borderRadius: withBorder ? BorderRadius.circular(5) : null,

      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            Icon(icon, color: withBorder ? Colors.black : Colors.white),
            SizedBox(height: 3),
            Text(label, style: TextStyle(color: withBorder ? Colors.black : Colors.white)),
          ],
        ),
      ),
    );
  }
}