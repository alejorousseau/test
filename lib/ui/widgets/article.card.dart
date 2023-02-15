
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:technical_test/ui/theme/colors.theme.dart';
import 'package:technical_test/domain/models/article/article.model.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.fontSize,
    required this.article,
  });

  final double fontSize;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
          
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: InkWell(
          onTap:() async {
            if(article.storyUrl == null) return;
            final url = Uri.parse(article.storyUrl!);
              await launchUrl(
                url,
                mode: LaunchMode.inAppWebView,
                webViewConfiguration: const WebViewConfiguration(),
              );
          },
          child: Padding(
            padding: EdgeInsets.all(fontSize * 0.4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.storyTitle, style: GoogleFonts.arbutusSlab()
                    .copyWith(
                      fontSize: fontSize * 0.4,
                      fontWeight: FontWeight.w900,
                      color: ColorsTheme.primaryColor
                    )),
            
                    Text('Published ${DateFormat.yMMMd().format(article.createdAt)}', style: GoogleFonts.arbutusSlab()
                    .copyWith(
                      fontSize: fontSize * 0.25,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400
                    ))
                  ],
                ),
            
                SizedBox(height: fontSize * 0.3),
            
                Text(article.author.toUpperCase(), style: GoogleFonts.arbutusSlab()),
              ],
            ),
          ),
        ),
      )
    );
  }
}