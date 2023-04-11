import 'package:app/core/routes/app_router.dart';
import 'package:app/features/home/domain/entitites/geofence/geofence.dart';
import 'package:app/features/home/domain/entitites/projects_by_company_daily_request/projects_by_company_daily_request.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/entitites/detail/detail.dart';
import '../../../domain/entitites/request/request.dart';

class ProjectTile extends StatefulWidget {
  final ProjectsByCompanyDailyRequest project;

  const ProjectTile({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<ProjectTile> createState() => _ProjectTileState();
}

class _ProjectTileState extends State<ProjectTile> {
  bool showRequests = false;
  Geofence? geofence;
  List<Request> requests = [];

  List<Detail> details = [];

  @override
  void initState() {
    super.initState();

    geofence = widget.project.project.geofence;
    requests =
        widget.project.request.where((req) => req.details.isNotEmpty).toList();

    // for (var req in requests) {
    //   for (var det in req.details) {
    //     if (det.quantity != "0") details.add(det);
    //   }
    // }
    //
    // debugPrint("Details ${details.length}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// region - Title and maps button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(widget.project.title)),
                const SizedBox(width: 8),
                if (geofence?.center != null && geofence?.data != null)
                  if (geofence!.data!.isNotEmpty)
                    TextButton(
                      onPressed: () {
                        context.router.push(MapsRoute(
                            center: geofence!.center!, data: geofence!.data!));
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        visualDensity: VisualDensity.compact,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('View Map'),
                    )
              ],
            ),

            /// endregion - Title and maps button

            /// region - requests
            if (requests.isNotEmpty) const SizedBox(height: 8),

            if (requests.isNotEmpty)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('${requests.length} Request(s)')),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              showRequests = !showRequests;
                            });
                          },
                          child: Text(showRequests ? 'Hide' : 'Show')),
                    ],
                  ),
                  if (showRequests)
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 8,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text(requests[index].requestType.name),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, detailIndex) {
                                      final details = requests[index].details;

                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.all(4),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                '${details[detailIndex].source.location?.address} - ${details[detailIndex].destination.location?.address}',
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 8),
                                    itemCount: requests[index].details.length),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: requests.length)
                ],
              )

            /// endregion - requests
          ],
        ));
  }
}
