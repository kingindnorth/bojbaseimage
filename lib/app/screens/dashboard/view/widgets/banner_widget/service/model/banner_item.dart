class BannerItem {
  final String imageUrl;   // for now: local asset path; later: network URL
  final String? deeplink;  // optional: if each banner navigates differently

  BannerItem({required this.imageUrl, this.deeplink});

  factory BannerItem.fromJson(Map<String, dynamic> j) =>
      BannerItem(imageUrl: j['imageUrl'] as String, deeplink: j['deeplink'] as String?);
}
