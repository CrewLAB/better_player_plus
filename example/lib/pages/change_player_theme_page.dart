import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:better_player_example/pages/custom_controls/custom_controls_widget.dart';
import 'package:flutter/material.dart';

class ChangePlayerThemePage extends StatefulWidget {
  @override
  _ChangePlayerThemePageState createState() => _ChangePlayerThemePageState();
}

class _ChangePlayerThemePageState extends State<ChangePlayerThemePage> {
  BetterPlayerController _betterPlayerController;
  BetterPlayerDataSource _dataSource;
  PlayerTheme _playerTheme = PlayerTheme.material;

  @override
  void initState() {
    super.initState();
    String url = Constants.bugBuckBunnyVideoUrl;
    _dataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, url);
    _betterPlayerController = new BetterPlayerController(
      BetterPlayerConfiguration(
        autoDispose: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          playerTheme: _playerTheme,
        ),
      ),
      betterPlayerDataSource: _dataSource,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change player theme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Player with the possibility to change the theme",
                style: TextStyle(fontSize: 16),
              ),
            ),
            BetterPlayer(
              controller: _betterPlayerController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  child: Text("MATERIAL"),
                  onPressed: () {
                    setState(() {
                      _playerTheme = PlayerTheme.material;
                      _betterPlayerController.pause();
                      _betterPlayerController = new BetterPlayerController(
                        BetterPlayerConfiguration(
                          autoDispose: true,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            playerTheme: _playerTheme,
                          ),
                        ),
                        betterPlayerDataSource: _dataSource,
                      );
                    });
                  },
                ),
                MaterialButton(
                  child: Text("CUPERTINO"),
                  onPressed: () {
                    setState(() {
                      _playerTheme = PlayerTheme.cupertino;
                      _betterPlayerController.pause();
                      _betterPlayerController = new BetterPlayerController(
                        BetterPlayerConfiguration(
                          autoDispose: true,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            playerTheme: _playerTheme,
                          ),
                        ),
                        betterPlayerDataSource: _dataSource,
                      );
                    });
                  },
                ),
                MaterialButton(
                  child: Text("CUSTOM"),
                  onPressed: () {
                    setState(() {
                      _playerTheme = PlayerTheme.custom;
                      _betterPlayerController.pause();
                      _betterPlayerController = new BetterPlayerController(
                        BetterPlayerConfiguration(
                          autoDispose: true,
                          controlsConfiguration:
                              BetterPlayerControlsConfiguration(
                            playerTheme: _playerTheme,
                            customControlsBuilder: (controller) =>
                                CustomControlsWidget(
                              controller: controller,
                            ),
                          ),
                        ),
                        betterPlayerDataSource: _dataSource,
                      );
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}