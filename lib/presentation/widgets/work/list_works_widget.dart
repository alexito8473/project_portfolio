import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proyect_porfolio/presentation/utils/calculate_size.dart';
import 'package:proyect_porfolio/presentation/widgets/work/works_widget.dart';
import '../../../data/models/work.dart';

class WorkWidget extends StatelessWidget {
  final List<Work> listWork;
  const WorkWidget({super.key, required this.listWork});
  Widget createListWork({required Size size,
      required BuildContext context}) {
    return Wrap(
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .08),
              height: 750,
              constraints: const BoxConstraints(minWidth: 500),
              width: size.width * 0.5,
              child: Column(children: [
                Expanded(
                    child: Row(children: [
                  Container(
                      margin: EdgeInsets.only(right: size.width * 0.03),
                      width: 60,
                      child: Column(children: [
                        const Icon(Icons.home_repair_service, size: 40),
                        Expanded(
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                width: 6))
                      ])),
                  Expanded(child: WorksWidget(work: listWork[0]))
                ])),
                Expanded(
                    child: Row(children: [
                  Container(
                      margin: EdgeInsets.only(right: size.width * 0.03),
                      width: 60,
                      child: const Column(children: [
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Icon(Icons.directions_boat, size: 40))
                      ])),
                      Expanded(child: WorksWidget(work: listWork[1]))
                ]))
              ])),
          Lottie.network(
              "https://lottie.host/f6217d7d-3b90-47fb-b522-d31ee895ff63/1PBguv1ZIv.json",
              fit: BoxFit.contain,
              width: CalculateSize.isMobile(size) ? 250 : 350,
              height: CalculateSize.isMobile(size) ? 250 : 350,
              addRepaintBoundary: true,
              backgroundLoading: true,
              reverse: true,
              animate: true,
              frameRate: const FrameRate(27),
              filterQuality: FilterQuality.none)
        ]);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return SliverToBoxAdapter(
      child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.1),
          child: createListWork(size: size, context: context)),
    );
  }
}
