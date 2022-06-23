
import 'package:flutter/material.dart';

import 'goalstat.dart';
import 'matchstat.dart';
import 'matchtile.dart';
import 'scoremodel.dart';

Widget PageBody(List<SoccerMatch> allmatches) {

  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              teamStat("Local Team", allmatches[0].home.logoUrl,
                  allmatches[0].home.name),
              goalStat(allmatches[0].fixture.status.elapsedTime,
                  allmatches[0].goal.home, allmatches[0].goal.away),
              teamStat("Visitor Team", allmatches[0].away.logoUrl,
                  allmatches[0].away.name),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF4373D9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      return matchTile(allmatches[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
