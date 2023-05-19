import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_architecture/l10n/locale_provider.dart';
import 'package:flutter_architecture/network/model/category_list.dart';
import 'package:flutter_architecture/network/provider/api_request_ui.dart';
import 'package:flutter_architecture/network/viewmodel/categories_viewModel.dart';
import 'package:flutter_architecture/theme/Images.dart';
import 'package:flutter_architecture/theme/types.dart';
import 'package:provider/provider.dart';

import '../../theme/colors.dart';
import '../../widgets/components/highlight_view.dart';
import '../../widgets/components/icon_button.dart';
import '../../widgets/components/search_box.dart';
import '../../widgets/scrollable_viewRoot.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final horizontalPadding = const EdgeInsets.symmetric(horizontal: 30);
  final viewModel = CategoriesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchCategories();
  }

  void toggleLanguage(LocaleProvider provider) {
    setState(() {
      provider.toggleLocale();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableViewRoot(
        child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 32,
                      height: 32,
                      child: Images.logo,
                    ),
                    Consumer<LocaleProvider>(
                        builder: (context, localeProvider, child) {
                      return GFTSIconButton(
                        iconData: Images.notification,
                        onPressed: () => toggleLanguage(localeProvider),
                      );
                    })
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: horizontalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find Your",
                      style: TextStyleTypes.bodyLargeRegular
                          .copyWith(color: ColorSystem.textHeading),
                    ),
                    Text(
                      "Workout Class",
                      style: TextStyleTypes.heading3Medium
                          .copyWith(color: ColorSystem.textHeading),
                    ),
                    GFTSSearchBox(
                      onPressed: () {},
                    ),
                    Text(
                      "Last week highlights",
                      style: TextStyleTypes.bodyLargeMedium
                          .copyWith(color: ColorSystem.textHeading),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            HighLightView(
                              title: "Workout Time",
                            ),
                            HighLightView(
                              title: "Workout Time",
                            ),
                          ],
                        )),
                    Text(
                      "Last week Categories",
                      style: TextStyleTypes.bodyLargeMedium
                          .copyWith(color: ColorSystem.textHeading),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ApiRequestUI<CategoryList>(
                          buildContext: context,
                          stream: viewModel.categoryListStreamProvider.stream,
                          onSuccess: (CategoryList categoryList) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: categoryList.categories!.map((e) {
                                  return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: HighLightView(
                                        title: e,
                                      ));
                                }).toList(),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ])));
  }
}
