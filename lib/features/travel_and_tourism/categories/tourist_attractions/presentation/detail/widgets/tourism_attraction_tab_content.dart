import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TourismAttractionTabContent extends StatelessWidget {
  const TourismAttractionTabContent({
    super.key,
    required this.gioiThieu,
    required this.mappedFields,
  });

  final String? gioiThieu;
  final Map<String, String?> mappedFields;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Colors.orangeAccent,
            tabs: [Tab(text: 'Giới thiệu'), Tab(text: 'Thông tin')],
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 16),
                  child: Html(
                    data: gioiThieu ?? '<p>Chưa có nội dung giới thiệu.</p>',
                    style: {
                      "body": Style(
                        color: colorScheme.onSurface,
                        fontSize: FontSize(16),
                        lineHeight: LineHeight(1.5),
                        fontFamily: 'Arial',
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                      ),
                      "p": Style(margin: Margins.only(bottom: 12)),
                    },
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        mappedFields.entries
                            .where((e) => e.key != 'Giới thiệu')
                            .map(
                              (entry) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${entry.key}: ',
                                      style: TextStyle(
                                        color: colorScheme.onSurface,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        entry.value ?? '—',
                                        style: TextStyle(
                                          color: colorScheme.onSurface,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
