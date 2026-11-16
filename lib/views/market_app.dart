import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:material_3_expressive/components/buttons/enums/m3e_button_enums.dart';
import 'package:material_3_expressive/material_3_expressive.dart';
import 'package:material_ui/material_ui.dart';
import 'package:strontianite/models/flathub_app_listing_model.dart';
import 'package:strontianite/models/flathub_item_model.dart';
import 'package:strontianite/models/flathub_screenshots_model.dart';
import 'package:strontianite/utils/market_utils.dart';

class MarketApp extends StatefulWidget {
  const MarketApp({super.key, required this.flathubItemModel});

  final FlathubItemModel flathubItemModel;

  @override
  State<MarketApp> createState() => _MarketAppState();
}

class _MarketAppState extends State<MarketApp> {
  FlathubAppListingModel? _appListingModel;
  bool _isLoading = false;
  bool _isOperationInProgress = false;
  double? _percentageComplete = 0;
  bool _isInstalled = false;

  @override
  void initState() {
    super.initState();
    _setAppListing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.flathubItemModel.name ?? 'Unknown app'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _isLoading
            ? Center(
                child: M3ELoadingIndicator(
                  variant: M3ELoadingIndicatorVariant.contained,
                ),
              )
            : (_appListingModel != null
                  ? SingleChildScrollView(
                      child: Column(
                        spacing: 16,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 16,
                            children: [
                              if (_appListingModel!.icon != null)
                                Image.network(
                                  _appListingModel!.icon!,
                                  height: 64,
                                ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _appListingModel!.name ?? 'Unknown app',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontVariations: [
                                          FontVariation('ROND', 100),
                                        ],
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                    ),
                                    Text(
                                      _appListingModel!.developerName ??
                                          'Unknown developer',
                                    ),
                                  ],
                                ),
                              ),
                              _isOperationInProgress
                                  ? M3EProgressIndicator.circularWavy(
                                      value: _percentageComplete,
                                    )
                                  : (_isInstalled
                                        ? M3EButton.icon(
                                            style: M3EButtonStyle.tonal,
                                            onPressed: () async {
                                              if (_appListingModel!.bundle ==
                                                  null) {
                                                return;
                                              }
                                              setState(() {
                                                _percentageComplete = null;
                                                _isOperationInProgress = true;
                                              });
                                              final success =
                                                  await MarketUtils.uninstallApp(
                                                    _appListingModel!.id!,
                                                    onProgress: (percent) {
                                                      debugPrint(
                                                        'Percentage uninstalled: $percent',
                                                      );
                                                      setState(() {
                                                        _percentageComplete =
                                                            percent;
                                                      });
                                                    },
                                                  );
                                              setState(() {
                                                _isOperationInProgress = false;
                                                _percentageComplete = null;
                                                if (success) {
                                                  _isInstalled = false;
                                                }
                                              });
                                            },
                                            label: const Text('Uninstall'),
                                            icon: const Icon(
                                              M3EIcons.delete_rounded,
                                            ),
                                          )
                                        : M3EButton.icon(
                                            style: M3EButtonStyle.filled,
                                            onPressed: () async {
                                              if (_appListingModel!.bundle ==
                                                  null) {
                                                return;
                                              }
                                              setState(() {
                                                _percentageComplete = null;
                                                _isOperationInProgress = true;
                                              });
                                              final success =
                                                  await MarketUtils.installApp(
                                                    _appListingModel!.id!,
                                                    onProgress: (percent) {
                                                      debugPrint(
                                                        'Percentage installed: $percent',
                                                      );
                                                      setState(() {
                                                        _percentageComplete =
                                                            percent;
                                                      });
                                                    },
                                                  );
                                              setState(() {
                                                _isOperationInProgress = false;
                                                _percentageComplete = null;
                                                if (success) {
                                                  _isInstalled = true;
                                                }
                                              });
                                            },
                                            label: const Text('Install'),
                                            icon: const Icon(
                                              M3EIcons.install_desktop_rounded,
                                            ),
                                          )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 8,
                            children: [
                              if (_appListingModel!.isFreeLicense != null)
                                M3EChip(
                                  label: _appListingModel!.isFreeLicense!
                                      ? 'Open-source'
                                      : 'Proprietary',
                                  leading: _appListingModel!.isFreeLicense!
                                      ? const Icon(M3EIcons.lock_open_rounded)
                                      : const Icon(M3EIcons.lock_rounded),
                                ),
                              if (_appListingModel!.isMobileFriendly != null)
                                M3EChip(
                                  label: _appListingModel!.isMobileFriendly!
                                      ? 'Mobile friendly'
                                      : 'Not mobile friendly',
                                  leading: _appListingModel!.isMobileFriendly!
                                      ? const Icon(
                                          M3EIcons.mobile_friendly_rounded,
                                        )
                                      : const Icon(
                                          M3EIcons.desktop_mac_rounded,
                                        ),
                                ),
                              if (_appListingModel!
                                      .contentRatingDetails?['en_US']
                                      ?.minimumAge !=
                                  null)
                                M3EChip(
                                  label:
                                      'Age ${_appListingModel!.contentRatingDetails!['en_US']!.minimumAge.toString()}+',
                                  leading: const Icon(M3EIcons.people_rounded),
                                ),
                            ],
                          ),
                          M3EDivider(),
                          if (_appListingModel!.screenshots != null)
                            _buildScreenshots(_appListingModel!.screenshots!),
                          M3EDivider(),
                          Html(data: _appListingModel!.description),
                        ],
                      ),
                    )
                  : Center(child: Text('No data'))),
      ),
    );
  }

  Future<void> _setAppListing() async {
    setState(() {
      _isLoading = true;
    });
    final listing = await MarketUtils.getAppListing(widget.flathubItemModel);
    setState(() {
      _appListingModel = listing;
      _isLoading = false;
    });
    await _setIsInstalled();
  }

  Future<void> _setIsInstalled() async {
    _isInstalled = await MarketUtils.isInstalled(_appListingModel!.id!);
  }

  Widget _buildScreenshots(List<FlathubScreenshotsModel> screenshots) {
    return CarouselSlider.builder(
      itemCount: screenshots.length,
      itemBuilder: (context, index, pageViewIndex) {
        final s = screenshots[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              Expanded(
                child: s.sizes?[0].src != null
                    ? Image.network(s.sizes![0].src!, fit: BoxFit.contain)
                    : Container(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        child: Center(
                          child: const Icon(M3EIcons.image_rounded),
                        ),
                      ),
              ),
              if (s.caption != null) Text(s.caption!),
            ],
          ),
        );
      },
      options: CarouselOptions(autoPlay: true),
    );
  }
}
