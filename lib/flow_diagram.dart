import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jsk_app/zoomedFlowDiagram.dart';

class Diagram extends StatefulWidget {
  const Diagram({super.key});

  @override
  State<Diagram> createState() => _DiagramState();
}

class _DiagramState extends State<Diagram> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: const Text(
              "Flow Diagram",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            //leading: Image.asset('assets/images/logo.png'),
          ),
          body: Container(
            // decoration: BoxDecoration(
            //   gradient: LinearGradient(
            //     colors: [Color(0xFFF46B39), Colors.white, Color(0xFF3AB757)],
            //     stops: [0, 0.5, 1],
            //     begin: AlignmentDirectional(0, -1),
            //     end: AlignmentDirectional(0, 1),
            //   ),
            // ),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ZoomedFlow()),
                    );
                  },
                  child: Container(
                    height: 500,
                    child: GlassmorphicFlexContainer(
                      borderRadius: 20,
                      blur: 20,
                      padding: EdgeInsets.all(40),
                      alignment: Alignment.bottomCenter,
                      border: 2,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff151515).withOpacity(0.2),
                            Color(0xff151515).withOpacity(0.25),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Image.asset(
                          "assets/images/flow.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NeumorphicButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: NeumorphicStyle(
                        lightSource: LightSource.bottom,
                        shape: NeumorphicShape.convex,
                        depth: 5,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20.0)),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "પાછા જાવ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    NeumorphicButton(
                      onPressed: () {
                        var url = Uri.parse(
                            "https://www.digitalgujarat.gov.in/LoginApp/CitizenLogin.aspx?ServiceID=76&Cul=en-GB");
                        _launchUrl(url);
                      },
                      style: NeumorphicStyle(
                        lightSource: LightSource.bottom,
                        shape: NeumorphicShape.convex,
                        depth: 5,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20.0)),
                      ),
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text(
                            "અરજી કરો",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ));
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $_url';
  }
}
