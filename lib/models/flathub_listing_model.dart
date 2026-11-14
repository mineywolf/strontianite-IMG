class IconsItem {
  final String url;
  final int width;
  final int height;
  final String type;

  IconsItem({
    required this.url,
    required this.width,
    required this.height,
    required this.type,
  });

  factory IconsItem.fromJson(Map<String, dynamic> json) {
    return IconsItem(
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'width': width,
      'height': height,
      'type': type,
    };
  }
}

class ScreenshotsItem {
  final List<SizesItem> sizes;
  final String caption;
  final bool default;

  ScreenshotsItem({
    required this.sizes,
    required this.caption,
    required this.default,
  });

  factory ScreenshotsItem.fromJson(Map<String, dynamic> json) {
    return ScreenshotsItem(
      sizes: List<SizesItem>.from((json['sizes'] as List).map((e) => SizesItem.fromJson(e as Map<String, dynamic>))),
      caption: json['caption'] as String,
      default: json['default'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sizes': sizes.map((e) => e.toJson()).toList(),
      'caption': caption,
      'default': default,
    };
  }
}

class SizesItem {
  final String width;
  final String height;
  final String scale;
  final String src;

  SizesItem({
    required this.width,
    required this.height,
    required this.scale,
    required this.src,
  });

  factory SizesItem.fromJson(Map<String, dynamic> json) {
    return SizesItem(
      width: json['width'] as String,
      height: json['height'] as String,
      scale: json['scale'] as String,
      src: json['src'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'scale': scale,
      'src': src,
    };
  }
}

class ReleasesItem {
  final String timestamp;
  final String version;
  final String type;

  ReleasesItem({
    required this.timestamp,
    required this.version,
    required this.type,
  });

  factory ReleasesItem.fromJson(Map<String, dynamic> json) {
    return ReleasesItem(
      timestamp: json['timestamp'] as String,
      version: json['version'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp,
      'version': version,
      'type': type,
    };
  }
}

class ContentRatingDetails {
  final EnUS enUS;

  ContentRatingDetails({
    required this.enUS,
  });

  factory ContentRatingDetails.fromJson(Map<String, dynamic> json) {
    return ContentRatingDetails(
      enUS: EnUS.fromJson(json['en_US'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'en_US': enUS.toJson(),
    };
  }
}

class EnUS {
  final List<CategoriesItem> categories;
  final int minimumAge;
  final String minimumAgeText;
  final String contentRatingSystem;

  EnUS({
    required this.categories,
    required this.minimumAge,
    required this.minimumAgeText,
    required this.contentRatingSystem,
  });

  factory EnUS.fromJson(Map<String, dynamic> json) {
    return EnUS(
      categories: List<CategoriesItem>.from((json['categories'] as List).map((e) => CategoriesItem.fromJson(e as Map<String, dynamic>))),
      minimumAge: json['minimumAge'] as int,
      minimumAgeText: json['minimumAgeText'] as String,
      contentRatingSystem: json['contentRatingSystem'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categories': categories.map((e) => e.toJson()).toList(),
      'minimumAge': minimumAge,
      'minimumAgeText': minimumAgeText,
      'contentRatingSystem': contentRatingSystem,
    };
  }
}

class CategoriesItem {
  final String id;
  final String level;
  final String description;

  CategoriesItem({
    required this.id,
    required this.level,
    required this.description,
  });

  factory CategoriesItem.fromJson(Map<String, dynamic> json) {
    return CategoriesItem(
      id: json['id'] as String,
      level: json['level'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level': level,
      'description': description,
    };
  }
}

class Urls {
  final String bugtracker;
  final String homepage;
  final String help;
  final String donation;
  final String vcsBrowser;

  Urls({
    required this.bugtracker,
    required this.homepage,
    required this.help,
    required this.donation,
    required this.vcsBrowser,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      bugtracker: json['bugtracker'] as String,
      homepage: json['homepage'] as String,
      help: json['help'] as String,
      donation: json['donation'] as String,
      vcsBrowser: json['vcs_browser'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bugtracker': bugtracker,
      'homepage': homepage,
      'help': help,
      'donation': donation,
      'vcs_browser': vcsBrowser,
    };
  }
}

class Launchable {
  final String value;
  final String type;

  Launchable({
    required this.value,
    required this.type,
  });

  factory Launchable.fromJson(Map<String, dynamic> json) {
    return Launchable(
      value: json['value'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'type': type,
    };
  }
}

class Bundle {
  final String value;
  final String type;
  final String runtime;
  final String sdk;

  Bundle({
    required this.value,
    required this.type,
    required this.runtime,
    required this.sdk,
  });

  factory Bundle.fromJson(Map<String, dynamic> json) {
    return Bundle(
      value: json['value'] as String,
      type: json['type'] as String,
      runtime: json['runtime'] as String,
      sdk: json['sdk'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'type': type,
      'runtime': runtime,
      'sdk': sdk,
    };
  }
}

class Metadata {
  final bool flathub::verification::verified;
  final String flathub::verification::method;
  final String flathub::verification::loginName;
  final String flathub::verification::loginProvider;
  final String flathub::verification::timestamp;
  final bool flathub::verification::loginIsOrganization;

  Metadata({
    required this.flathub::verification::verified,
    required this.flathub::verification::method,
    required this.flathub::verification::loginName,
    required this.flathub::verification::loginProvider,
    required this.flathub::verification::timestamp,
    required this.flathub::verification::loginIsOrganization,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      flathub::verification::verified: json['flathub::verification::verified'] as bool,
      flathub::verification::method: json['flathub::verification::method'] as String,
      flathub::verification::loginName: json['flathub::verification::login_name'] as String,
      flathub::verification::loginProvider: json['flathub::verification::login_provider'] as String,
      flathub::verification::timestamp: json['flathub::verification::timestamp'] as String,
      flathub::verification::loginIsOrganization: json['flathub::verification::login_is_organization'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flathub::verification::verified': flathub::verification::verified,
      'flathub::verification::method': flathub::verification::method,
      'flathub::verification::login_name': flathub::verification::loginName,
      'flathub::verification::login_provider': flathub::verification::loginProvider,
      'flathub::verification::timestamp': flathub::verification::timestamp,
      'flathub::verification::login_is_organization': flathub::verification::loginIsOrganization,
    };
  }
}

class FlathubListing {
  final String type;
  final String id;
  final String name;
  final String summary;
  final String description;
  final String developerName;
  final String icon;
  final List<IconsItem> icons;
  final List<ScreenshotsItem> screenshots;
  final List<ReleasesItem> releases;
  final ContentRatingDetails contentRatingDetails;
  final Urls urls;
  final List<String> categories;
  final List<String> keywords;
  final String projectLicense;
  final List<String> provides;
  final Launchable launchable;
  final Bundle bundle;
  final Metadata metadata;
  final bool isFreeLicense;
  final bool isMobileFriendly;
  final bool isEol;

  FlathubListing({
    required this.type,
    required this.id,
    required this.name,
    required this.summary,
    required this.description,
    required this.developerName,
    required this.icon,
    required this.icons,
    required this.screenshots,
    required this.releases,
    required this.contentRatingDetails,
    required this.urls,
    required this.categories,
    required this.keywords,
    required this.projectLicense,
    required this.provides,
    required this.launchable,
    required this.bundle,
    required this.metadata,
    required this.isFreeLicense,
    required this.isMobileFriendly,
    required this.isEol,
  });

  factory FlathubListing.fromJson(Map<String, dynamic> json) {
    return FlathubListing(
      type: json['type'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      summary: json['summary'] as String,
      description: json['description'] as String,
      developerName: json['developer_name'] as String,
      icon: json['icon'] as String,
      icons: List<IconsItem>.from((json['icons'] as List).map((e) => IconsItem.fromJson(e as Map<String, dynamic>))),
      screenshots: List<ScreenshotsItem>.from((json['screenshots'] as List).map((e) => ScreenshotsItem.fromJson(e as Map<String, dynamic>))),
      releases: List<ReleasesItem>.from((json['releases'] as List).map((e) => ReleasesItem.fromJson(e as Map<String, dynamic>))),
      contentRatingDetails: ContentRatingDetails.fromJson(json['content_rating_details'] as Map<String, dynamic>),
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      categories: List<String>.from(json['categories'] as List),
      keywords: List<String>.from(json['keywords'] as List),
      projectLicense: json['project_license'] as String,
      provides: List<String>.from(json['provides'] as List),
      launchable: Launchable.fromJson(json['launchable'] as Map<String, dynamic>),
      bundle: Bundle.fromJson(json['bundle'] as Map<String, dynamic>),
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      isFreeLicense: json['is_free_license'] as bool,
      isMobileFriendly: json['isMobileFriendly'] as bool,
      isEol: json['is_eol'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'name': name,
      'summary': summary,
      'description': description,
      'developer_name': developerName,
      'icon': icon,
      'icons': icons.map((e) => e.toJson()).toList(),
      'screenshots': screenshots.map((e) => e.toJson()).toList(),
      'releases': releases.map((e) => e.toJson()).toList(),
      'content_rating_details': contentRatingDetails.toJson(),
      'urls': urls.toJson(),
      'categories': categories,
      'keywords': keywords,
      'project_license': projectLicense,
      'provides': provides,
      'launchable': launchable.toJson(),
      'bundle': bundle.toJson(),
      'metadata': metadata.toJson(),
      'is_free_license': isFreeLicense,
      'isMobileFriendly': isMobileFriendly,
      'is_eol': isEol,
    };
  }
}