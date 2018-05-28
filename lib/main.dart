import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'downloads.dart';


void main() => runApp(new HelloWorld());




class HelloWorld extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
        routes: <String,WidgetBuilder>{
          "/downloads": (BuildContext context) => new Downloads("Downloads")
        },
        title: "Getting Started title",
        home: new HomeWidget()
      );
    }
}


class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          appBar: new AppBar(
            title: new Text("Flutter App"),
            elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
            ),
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text("Daniel Reyes Sánchez"),
                    accountEmail: new Text("danielreyesicc@gmail.com"),
                    currentAccountPicture: new CircleAvatar(
                      backgroundColor: Theme.of(context).platform == TargetPlatform.iOS 
                                              ? Colors.deepPurple
                                              : Colors.white,
                      child: new Text("D")
                    ),
                    otherAccountsPictures: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                                          ? Colors.deepPurple
                                          : Colors.white,
                        child: new Text("M"),
                      )
                    ],
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text("Uploads"),
                    trailing: new Icon(Icons.arrow_upward),
                    onTap: ()=> onListTileTap(context),
                  ),
                  new ListTile(
                    title: new Text("Downloads"),
                    trailing: new Icon(Icons.arrow_downward),
                    onTap: () => Navigator.of(context).pushNamed('/downloads')
                  ),
                  new ListTile(
                    title: new Text("Trending"),
                    trailing: new Icon(Icons.trending_up),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        new PageRouteBuilder(
                          pageBuilder: (BuildContext context, _, __){
                            return new Downloads("Trending");
                          },
                          transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
                            return new FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          }
                        )
                      );
                    }
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text("Close"),
                    trailing: new Icon(Icons.close)
                  )
                  
                ],
              )
            ),
          body: new VideoWidget()
        );
  }



  onListTileTap(BuildContext context) {
		Navigator.of(context).pop();
		showDialog<Null>(
			context: context,
			child: new AlertDialog(
				title: const Text('Not implemented yet :('),
				actions: <Widget>[
					new FlatButton(
						child: const Text('OK'),
						onPressed: () {
							Navigator.of(context).pop();
						},
					),
				],
			),
		);
	}
}

class VideoWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {

      return new ListView.builder(
        itemCount: 20,
        itemBuilder: (context,rowNumber){
          return new Container(padding: new EdgeInsets.all(16.0),
                               child: new Column(children: <Widget>[
                                                new Image.network("https://goo.gl/vFdXGc"),
                                                new Container(height: 8.0),
                                                new Text("Instagram Firebase course: check it out using description link below",
                                                        style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0)),
                                                new Divider(color: Colors.green)
                                                ]
                                  )
                              );
        }
      );
    }
}
