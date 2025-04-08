import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HeritagePlaceTabContent extends StatelessWidget {
  const HeritagePlaceTabContent({
    super.key,
    required this.gioiThieu,
    required this.mappedFields,
  });

  final String? gioiThieu;
  final Map<String, String?> mappedFields;

  @override
  Widget build(BuildContext context) {
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
                        color: Colors.white,
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
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        entry.value ?? '—',
                                        style: const TextStyle(
                                          color: Colors.white,
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
