import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami/data/api_manager.dart';
import 'package:islami/data/model/radio_response.dart';
import 'package:islami/providers/radio_provider.dart';
import 'package:islami/providers/settings_provider.dart';
import 'package:islami/ui/utils/app_assets.dart';
import 'package:provider/provider.dart';
import '../../utils/app_theme_colors.dart';
import '../../utils/app_theme_text_style.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late RadioProvider radioProvider;
  late SettingsProvider settingsProvider;
  ApiManager apiManager = ApiManager();
  late final Future<RadioResponse> myFuture;
  AudioPlayer audioPlayer = AudioPlayer();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    radioProvider = RadioProvider();
    myFuture = radioProvider.getRadio();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    settingsProvider = Provider.of(context);

    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Image.asset(AppAssets.radio),
        ),
        Expanded(
          flex: 4,
          child: FutureBuilder<RadioResponse>(
            future: myFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: snapshot.data!.radios!.length,
                  scrollDirection: Axis.horizontal,
                  itemExtent: MediaQuery.sizeOf(context).width,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return radioItemBuilder(snapshot.data!.radios![index], index);
                  },
                );
              }
              else if (snapshot.hasError) {
                return const Text("error");
              }
              else {
                return Center(child: CircularProgressIndicator(color: settingsProvider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,),);
              }
            },
          )
        ),
      ],
    );
  }

  Widget radioItemBuilder(Radios radio, int index) {
    index++;
    return Column(
      children: [
        Text(
          radio.name ?? "",
          style: settingsProvider.isDark ? AppThemeTextStyle.tableHeadDarkTextStyle : AppThemeTextStyle.tableHeadTextStyle,
        ),
        const Spacer(flex: 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed:
                settingsProvider.currentLanguage == 'ar' ?
                () {
                    audioPlayer.pause();
                    scrollController.animateTo(
                      (MediaQuery.sizeOf(context).width * (index - 1)) - MediaQuery.sizeOf(context).width,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn
                    );
                }
                    :
                () {
                    audioPlayer.pause();
                    scrollController.animateTo(MediaQuery.sizeOf(context).width * index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn
                    );
                },
              icon: Icon(
                settingsProvider.currentLanguage == 'ar' ? Icons.skip_next : Icons.skip_previous,
                color: settingsProvider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                size: 35.0,
              ),
            ),
            IconButton(
              onPressed: (){
                if (audioPlayer.state != PlayerState.playing) {
                  audioPlayer.play(UrlSource(radio.url ?? "" ));
                }
                else {
                  audioPlayer.pause();
                }
              },
              icon: Icon(
                audioPlayer.state == PlayerState.playing ? Icons.pause : Icons.play_arrow,
                color: settingsProvider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                size: 35.0,
              ),
            ),
            IconButton(
              onPressed:
                settingsProvider.currentLanguage == 'ar' ?
                () {
                  audioPlayer.pause();
                  scrollController.animateTo(MediaQuery.sizeOf(context).width * index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceIn
                  );
                }
                    :
                () {
                  audioPlayer.pause();
                  scrollController.animateTo(
                    (MediaQuery.sizeOf(context).width * (index - 1)) - MediaQuery.sizeOf(context).width,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn
                  );
                },
                icon: Icon(
                  settingsProvider.currentLanguage == 'ar' ? Icons.skip_previous : Icons.skip_next,
                  color: settingsProvider.isDark ? AppThemeColor.accentDark : AppThemeColor.primary,
                  size: 35.0,
              ),
            ),
          ],
        ),
        const Spacer(flex: 7,)
      ],
    );
  }

}
