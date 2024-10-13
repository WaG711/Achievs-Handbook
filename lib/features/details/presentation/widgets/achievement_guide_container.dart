import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../domain/entities/achievement_guide.dart';

class AchievementGuideContainer extends StatelessWidget {
  final AchievementGuide achievement;
  const AchievementGuideContainer({super.key, required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
        color: const Color.fromARGB(255, 35, 35, 35),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: achievement.posterUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: const CustomCircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child:
                    const Icon(Icons.image_not_supported, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                collapsedIconColor: Colors.green,
                iconColor: Colors.green,
                childrenPadding: EdgeInsets.zero,
                title: Text(
                  achievement.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SelectableText(achievement.description,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                  if (achievement.screenshotsUrls.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: achievement.screenshotsUrls.length,
                        itemBuilder: (context, index) {
                          final url = achievement.screenshotsUrls[index];
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: InteractiveViewer(
                                        panEnabled: true,
                                        minScale: 0.5,
                                        maxScale: 4.0,
                                        child: Image.network(url),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CachedNetworkImage(
                                imageUrl: url,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey[300],
                                  child:
                                      const CustomCircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
