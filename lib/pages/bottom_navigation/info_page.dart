import 'package:chums/pages/bottom_navigation/task_page.dart';
import 'package:flutter/material.dart';

import 'add_page.dart';
import 'expenses_page.dart';
import 'home_page.dart';
import '../../models/circle.dart';
import '../../models/item.dart';
import '../../models/user.dart';
import '../../constants.dart' as Constants;

/*
- Display's all data about a Circle's setup
  Notes to self to include:
    Setup:
      - Host:
      - # of members, who are members
      - Circle Code:
      - Circle Name
      - Roles: how many, what are they, what are their tasks, who's assigned to them
      - ChoreCycle: ON or OFF
        - What Roles are cycled through, which are indefinite, etc
        -

   Categories:
   - General:
      - host, room code, circle name, # of members+who they are
   - Roles:
      - enabled?, # of + tasks + who's assigned, whether chorecycle is on:
        - ChoreCycle:
          - enabled?, interval period, random shuffle or specified?,
   - Leave Group?
   -



 */
class InfoPage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
  InfoPage({Key? key, required this.title, required this.circle}) : super(key: key);
  final String title;
  Circle circle;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  List<Item> expenses = <Item>[];

  @override
  Widget build(BuildContext context) {

    //TODO: Set up some setting data in constants.dart
    expenses.add(Item(1, '4 members joined', User("heyBob", "pass", "email", "Po", "Lam", null), null, DateTime(2021, 9, 9)));
    expenses.add(Item(1, 'Roles specified: 3', User("heyBob", "pass", "email", "Po", "Lam", null), null, DateTime(2021, 9, 8)));
    expenses.add(Item(1, 'Roles defaults:  1', User("heyBob", "pass", "email", "Po", "Lam", null), null, DateTime(2021, 9, 8)));
    expenses.add(Item(1, 'Chore Cycles:  OFF', User("heyBob", "pass", "email", "Po", "Lam", null), null, DateTime(2021, 9, 8)));
    expenses.add(Item(1, 'View History of Tasks here', User("heyBob", "pass", "email", "Po", "Lam", null), null, DateTime(2021, 9, 9)));
    //What I'm pasting in:

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 98),
                  child: Text('Settings')),
              Spacer(),
              IconButton(onPressed: (){
                print("You pushed the settings button");
              },
                  icon: Icon(Icons.view_headline_outlined))
            ],
          ),
          backgroundColor: Color(0xFF3C99DC),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios_outlined),
            onPressed: () //TODO: Define a back button function, also this pops off the current screen so yes good stuff - Navigator.of(context).pop(),
            {
              print("hi you pushed the back button");
            }
          )
      ),
        backgroundColor: Color(0xFFD5F3FE),
        bottomNavigationBar: Container(
          height: 50,
          child: BottomAppBar(
              color: Color(0xFF0F5298),
              shape: const CircularNotchedRectangle(),
              child: Row(
                children: [
                  //1.) Home Button: HomePage
                  Expanded(
                    child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomePage(title: widget.title, circle: widget.circle)));
                        },
                        icon: Icon(Icons.home, color: Colors.white)
                    ),
                  ),

                  //2.) Task Icon: TaskPage
                  Expanded(
                    child: IconButton(
                        onPressed: (){
                          {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => TaskPage(title: widget.title, circle: widget.circle)));
                          }
                        },
                        icon: Icon(Icons.list_alt_outlined, color: Colors.white)
                    ),
                  ),

                  //3.) Add Icon: Add Dialog page - TODO
                  Expanded(
                    child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => AddPage(title: widget.title, circle: widget.circle, page_from: Constants.KEY_INFO)));
                        },
                        icon: Icon(Icons.add_circle_outline, color: Colors.white)
                    ),
                  ),

                  //4.) Money Icon: ExpensesPage - TODO: fix overflow
                  Expanded(
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ExpensesPage(title: widget.title, circle: widget.circle)));
                        },
                        icon: Icon(Icons.monetization_on_outlined, color: Colors.white)
                    ),
                  ),

                  //5.) Info Icon: InfoPage
                  Expanded(
                    child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => InfoPage(title: widget.title, circle: widget.circle)));
                        },
                        icon: Icon(Icons.info_outlined, color: Colors.white)
                    ),
                  ),

                ],
              )
          ),
        ),

        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFD5F3FE),
                    //Color(0xFF66D3FA),
                    Color(0xFF3C99DC),
                    Color(0xFF2565AE)
                    //Color(0xFF2565AE),
                  ],
                )
            ),
            child: Column(
                children:[
                SingleChildScrollView(
                    child: Column(
                        children: [
                          /*//Child #1: Title - What are we adding?
                          Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20, top: 50),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Settings',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ),
                              ]
                          ),*/

                          //For General Option:
                          Container(
                          margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                          child: Column(
                              children: [
                                Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 20, bottom:11),
                                        width: 30,
                                        height: 30,
                                        child: IconButton(
                                          icon: Icon(Icons.account_balance),
                                          onPressed: () {  },
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            //margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                                'General',
                                                style: TextStyle(
                                                    fontSize:16
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      IconButton(
                                          onPressed: (){},
                                          icon: Icon(Icons.arrow_forward_ios)
                                      )
                                    ]
                                ),

                                Container(
                                  child: Divider(
                                      height: 2,
                                      thickness: 0.5,
                                      indent:0,
                                      endIndent:0,
                                      color: Color(0xFF3C99DC)
                                  ),
                                )
                              ]
                          )
                      ),


                          //For Roles option:
                          Container(
                              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                              child: Column(
                                  children: [
                                    Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 20, bottom: 11, ),
                                            width: 30,
                                            height: 30,
                                            child:  IconButton(
                                              icon: Icon(Icons.group),
                                              onPressed: () {  },
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                //margin: EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                    'Roles',
                                                    style: TextStyle(
                                                        fontSize:16
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: (){},
                                              icon: Icon(Icons.arrow_forward_ios)
                                          )
                                        ]
                                    ),

                                    Container(
                                      child: Divider(
                                          height: 2,
                                          thickness: 0.5,
                                          indent:0,
                                          endIndent:0,
                                          color: Color(0xFF3C99DC)
                                      ),
                                    )
                                  ]
                              )
                          ),

                          //For Leave Group Option:
                          Container(
                              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                              child: Column(
                                  children: [
                                    Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            width: 30,
                                            height: 30,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Ficon-icons.com%2Ficon%2Fmale-boy-person-people-avatar%2F159358&psig=AOvVaw0ibLF6R8vjZ3SCP9HiVhkg&ust=1637115663031000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjvoZ7pm_QCFQAAAAAdAAAAABAD'),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                //margin: EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                    'Leave Group?',
                                                    style: TextStyle(
                                                        fontSize:16,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.red
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]
                                    ),

                                    Container(
                                      child: Divider(
                                          height: 2,
                                          thickness: 0.5,
                                          indent:0,
                                          endIndent:0,
                                          color: Color(0xFF3C99DC)
                                      ),
                                    )
                                  ]
                              )
                          ),




/*


                          //Child #3: Whole bulk of page:
                          Column(
                              children: [

                                //Child #3a: Announcements - Column
                                Column(
                                    children: [
                                      //Announcement Data:
                                      Container(
                                          width: 370,
                                          height: 500,
                                          decoration: BoxDecoration(
                                              color: Colors.white38,
                                              borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child:
                                          //List based on announcements
                                          ListView.builder(
                                              primary: false,
                                              shrinkWrap: true,
                                              itemCount: expenses.length,
                                              itemBuilder: (BuildContext context, int index){
                                                return Container(
                                                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                                                    child: Column(
                                                        children: [
                                                          Row(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(right: 10),
                                                                  width: 30,
                                                                  height: 30,
                                                                  child: CircleAvatar(
                                                                    backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Ficon-icons.com%2Ficon%2Fmale-boy-person-people-avatar%2F159358&psig=AOvVaw0ibLF6R8vjZ3SCP9HiVhkg&ust=1637115663031000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjvoZ7pm_QCFQAAAAAdAAAAABAD'),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(bottom: 5),
                                                                      child: Text(
                                                                          '${expenses[index].getDescription()}',
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize:14
                                                                          )
                                                                      ),
                                                                    ),
                                                                    Text('Due date: ${expenses[index].getDateString()}',
                                                                      style: TextStyle(
                                                                          fontSize: 12,
                                                                          color: Colors.grey
                                                                      ),
                                                                    )
                                                                  ],
                                                                )
                                                              ]
                                                          ),

                                                          Container(
                                                            margin: EdgeInsets.only(top: 10),
                                                            child: Divider(
                                                                height: 2,
                                                                thickness: 0.5,
                                                                indent:0,
                                                                endIndent:0,
                                                                color: Color(0xFF3C99DC)
                                                            ),
                                                          )
                                                        ]
                                                    )
                                                );
                                              })
                                      ),
                                    ]
                                ),


                              ]
                          ) */
                        ]
                    )
                )
            ])));
  }
}
































//Original commenting out:
   /* return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: BottomAppBar(
            color: Color(0xFFC9E3DA),
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                //1.) Home Button: HomePage
                Expanded(
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePage(title: widget.title, circle: widget.circle)));
                      },
                      icon: Icon(Icons.home_filled)
                  ),
                ),

                //2.) Task Icon: TaskPage
                Expanded(
                  child: IconButton(
                      onPressed: (){
                        {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => TaskPage(title: widget.title, circle: widget.circle)));
                        }
                      },
                      icon: Icon(Icons.list_alt_outlined)
                  ),
                ),

                //3.) Add Icon: Add Dialog page - TODO
                Expanded(
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AddPage(title: widget.title, circle: widget.circle)));
                      },
                      icon: Icon(Icons.add_circle_outline)
                  ),
                ),

                //4.) Money Icon: ExpensesPage - TODO: fix overflow
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ExpensesPage(title: widget.title, circle: widget.circle)));
                      },
                      icon: Icon(Icons.monetization_on_outlined)
                  ),
                ),

                //5.) Info Icon: InfoPage
                Expanded(
                  child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => InfoPage(title: widget.title, circle: widget.circle)));
                      },
                      icon: Icon(Icons.info_outlined)
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}
*/