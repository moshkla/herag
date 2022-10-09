import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlView extends StatelessWidget {
  const HtmlView({Key? key, required this.htmlString}) : super(key: key);
  final String htmlString;
  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlString,
      tagsList: Html.tags..addAll(["bird", "flutter"]),
      style: {
        "table": Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
          padding: const EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
          padding: const EdgeInsets.all(6),
          alignment: Alignment.topLeft,
        ),
        'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
      },
      customRender: {
        "table": (context, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: (context.tree as TableLayoutElement).toWidget(context),
          );
        },
        "bird": (RenderContext context, Widget child) {
          return const TextSpan(text: "🐦");
        },
        "flutter": (RenderContext context, Widget child) {
          return FlutterLogo(
            style: (context.tree.element!.attributes['horizontal'] != null)
                ? FlutterLogoStyle.horizontal
                : FlutterLogoStyle.markOnly,
            textColor: context.style.color!,
            size: context.style.fontSize!.size! * 5,
          );
        },
      },
      customImageRenders: {
        networkSourceMatcher(domains: ["flutter.dev"]):
            (context, attributes, element) {
          return const FlutterLogo(size: 36);
        },
        networkSourceMatcher(domains: ["mydomain.com"]): networkImageRender(
          headers: {"Custom-Header": "some-value"},
          altWidget: (alt) => Text(alt ?? ""),
          loadingWidget: () => const Text("Loading..."),
        ),
        // On relative paths starting with /wiki, prefix with a base url
        (attr, _) => attr["src"] != null && attr["src"]!.startsWith("/wiki"):
            networkImageRender(
                mapUrl: (url) => "https://upload.wikimedia.org" + url!),
        // Custom placeholder image for broken links
        networkSourceMatcher():
            networkImageRender(altWidget: (_) => const FlutterLogo()),
      },
      onLinkTap: (url, _, __, ___) {
        print("Opening $url...");
      },
      onImageTap: (src, _, __, ___) {
        print(src);
      },
      onImageError: (exception, stackTrace) {
        print(exception);
      },
      onCssParseError: (css, messages) {
        print("css that errored: $css");
        print("error messages:");
        for (var element in messages) {
          print(element);
        }
        return null;
      },
    );
  }
}
