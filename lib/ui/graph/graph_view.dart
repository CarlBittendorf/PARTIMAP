import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';
import 'package:partimap/components/colors.dart';
import 'package:partimap/models/graph.dart';
import 'package:partimap/widgets/graph_bar.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';
import 'package:partimap/extensions/hover_extensions.dart';

import 'graph_viewmodel.dart';

class GraphView extends StatelessWidget {
  const GraphView({Key? key}) : super(key: key);

  List<Widget> _widgetList(
      BuildContext context, GraphViewModel model, double appbarHeight) {
    var list = <Widget>[];
    var width = MediaQuery.of(context).size.width - 20;
    var height = MediaQuery.of(context).size.height - appbarHeight - 20;

    for (var i = 0; i < model.graph.fadj.length; i++) {
      var radius = model.badj[i].length * 5.0 + 25; //!!!

      list.add(
        AnimatedPositioned(
          duration: model.duration,
          left: width * model.oxs[i] - radius / 2,
          top: height * model.oys[i] - radius / 2,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => model.showDetailsDialog(i),
              onDoubleTap: () => model.addVertex(i),
              onPanUpdate: (details) => model.move(
                  i,
                  details.globalPosition.dx / width,
                  (details.globalPosition.dy - appbarHeight) / height),
              onPanEnd: (details) {},
              child: Tooltip(
                message: model.graph.description[i] ?? '',
                child: Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius),
                    color: Color(model.graph.color[i] ?? Colors.blue.value),
                  ),
                  child: model.graph.icon[i] == 0
                      ? Container()
                      : Icon(
                          IconData(
                            model.graph.icon[i] ?? 0,
                            fontFamily: 'MaterialIcons',
                          ),
                        ),
                ).moveUpOnHover,
              ),
            ),
          ),
        ),
      );

      list.add(
        AnimatedPositioned(
          duration: model.duration,
          left: width * model.oxs[i] - 100,
          top: height * model.oys[i] - (100 + radius / 1.2),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Center(
              child: SelectableText(
                model.graph.title[i] ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: radius / 2),
              ),
            ),
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GraphViewModel>.reactive(
      viewModelBuilder: () => GraphViewModel(),
      builder: (
        BuildContext context,
        GraphViewModel model,
        Widget? child,
      ) {
        return ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(
            context,
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(double.infinity, 66),
                child: GraphBar(
                  name: model.graph.name,
                  navigateToHome: () => model.navigateToHomeView(),
                  navigateToShowcase: () => model.navigateToShowcaseView(),
                  navigateToAbout: () => model.navigateToAboutView(),
                  navigateToImprint: () => model.navigateToImprintView(),
                  addVertex: () => model.addUnconnectedVertex(),
                  copyToClipboard: () => model.copyToClipboard(),
                  showInfo: () => model.showInfoDialog(),
                ),
              ),
              body: model.isBusy
                  ? Center(child: CircularProgressIndicator())
                  : Builder(builder: (context) {
                      return ClipRect(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: border)),
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: CustomPaint(
                            painter: GraphPainter(
                              model.graph,
                              model.oxs,
                              model.oys,
                              model.badj,
                            ),
                            child: Stack(
                              children: _widgetList(
                                context,
                                model,
                                Scaffold.of(context).appBarMaxHeight ?? 0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
            ),
          ),
          defaultScale: true,
          minWidth: 480,
          defaultName: MOBILE,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.resize(600, name: MOBILE),
            ResponsiveBreakpoint.resize(850, name: TABLET),
            ResponsiveBreakpoint.resize(1080, name: DESKTOP),
          ],
          background: Container(color: background),
        );
      },
    );
  }
}

class GraphPainter extends CustomPainter {
  final Graph graph;
  final List<double> oxs;
  final List<double> oys;
  final List<List<int>> badj;

  GraphPainter(this.graph, this.oxs, this.oys, this.badj);

  @override
  void paint(Canvas canvas, Size size) {
    Path path;

    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = 1.0;

    for (var i = 0; i < graph.fadj.length; i++) {
      var ox = size.width * oxs[i];
      var oy = size.height * oys[i];
      var radius = badj[i].length * 5.0 + 25;

      for (var j in graph.fadj[i] ?? <int>[]) {
        if (j != i && !(ox == oxs[j] && oy == oys[j])) {
          var norm = sqrt(
              (ox - size.width * oxs[j]) * (ox - size.width * oxs[j]) +
                  (oy - size.height * oys[j]) * (oy - size.height * oys[j]));
          var jradius = badj[j].length * 5.0 + 25;
          var jnorm = sqrt(
              (size.width * oxs[j] - ox) * (size.width * oxs[j] - ox) +
                  (size.height * oys[j] - oy) * (size.height * oys[j] - oy));
          path = Path();
          var x = ox - radius * 0.6 * ((ox - size.width * oxs[j]) / norm);
          var y = oy - radius * 0.6 * ((oy - size.height * oys[j]) / norm);
          path.moveTo(x, y);
          path.relativeLineTo(
              (size.width * oxs[j] - x) -
                  jradius * 0.6 * ((size.width * oxs[j] - ox) / jnorm),
              (size.height * oys[j] - y) -
                  jradius * 0.6 * ((size.height * oys[j] - oy) / jnorm));
          path = ArrowPath.make(path: path);
          canvas.drawPath(path, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(GraphPainter oldDelegate) => true;
}
