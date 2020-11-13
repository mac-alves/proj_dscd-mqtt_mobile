<h1 align="center">
  <img wi alt="ChatNode" width="300" src="https://res.cloudinary.com/dpf7e7tpc/image/upload/v1605274667/projetos/mqtt-proj_dscd_ikn5h9.svg" />
</h1>

<h1 align="center">
  MQTT - Flutter+NodeJS+NodeMCU
</h1>
<h3 align="center">Study work on MQTT for the discipline of Development of Distributed Control Systems</h3>
<br/>
<p align="center">
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/mac-alves/proj_dscd-mqtt_mobile">

  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/mac-alves/proj_dscd-mqtt_mobile">

  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/mac-alves/proj_dscd-mqtt_mobile">

  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/mac-alves/proj_dscd-mqtt_mobile">

  <img alt="GitHub" src="https://img.shields.io/github/license/mac-alves/proj_dscd-mqtt_mobile">
</p>

<p align="center">
  <a href="#rocket-technologies">Technologies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#bangbang-dependencies">Dependencies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#information_source-how-to-use">How To Use</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#bangbang-license">Attention</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#link-useful-links">Useful Links</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#memo-license">License</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#memo-license">Autor</a>
</p>

## :rocket: &nbsp;&nbsp;&nbsp; Technologies

This project was developed with the following technologies:

-  [Flutter](https://flutter.dev/)
-  [Mobx](https://pub.dev/packages/mobx)
-  [Mqtt_Client](https://pub.dev/packages/mqtt_client)
-  [Slidy](https://github.com/Flutterando/slidy)
-  [Mosquitto](https://mosquitto.org/)
-  [Vscode](https://code.visualstudio.com/)

## :bangbang: &nbsp;&nbsp;&nbsp; Dependencies

- [Git](https://git-scm.com),
- [Flutter v1.22.2](https://flutter.dev/) 
- [Slidy v2.2.1](https://github.com/Flutterando/slidy)
- [Mosquitto v1.6.9](https://mosquitto.org/)

## :information_source: &nbsp;&nbsp;&nbsp; How To Use

```bash
# Clone this repository
$ git clone https://github.com/mac-alves/proj_dscd-mqtt_mobile.git

# Go into the repository
$ cd proj_dscd-mqtt_mobile/

# Install dependencies
$ flutter pub get

# build clean mobx
$ slidy run mobx_build_clean

# Check the broker access host and port at
- lib/app/modules/mqtt/mqtt_controller.dart

# run on your emulator
$ -- varied command

# ---- useful commands ---- 

# watch mobx modifications
$ slidy run mobx_watch
```

## :bangbang: &nbsp;&nbsp;&nbsp; Attention

- This project is a Flutter part of the complete project. the other parts are listed in useful links.
- Was developed using a local broker. If you want to use a remote broker, check the appropriate access credentials and code changes.

## :link: &nbsp;&nbsp;&nbsp; Useful Links
 - [Project presentation](https://youtu.be/n4rObNn_SwI)
 - [Part of NodeJS](https://github.com/mac-alves/proj_dscd-mqtt_nodejs.git)
 - [Part of NodeMCU](https://gist.github.com/mac-alves/59733b6d7da235ce42ae4111380a4bcd)

## :memo: &nbsp;&nbsp;&nbsp; License
This project is under the MIT license. See the [LICENSE](https://github.com/mac-alves/proj_dscd-mqtt_mobile/blob/main/LICENSE) for more information.

---

## Autor

:anchor: &nbsp;&nbsp; **Mauricio Alves** - *Github* - [mac-alves](https://github.com/mac-alves)


[nodejs]: https://nodejs.org/
[npm]: https://www.npmjs.com/
[vc]: https://code.visualstudio.com/
[vceditconfig]: https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
[vceslint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
