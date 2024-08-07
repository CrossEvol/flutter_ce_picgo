# always exists false
`image_manage_item.dart`
```dart
  Future<FileImage> setupFileImage() async {
    var exists = await dbProvider.existsDownloadedImage((name, remoteUrl));
    var localUrl = join(appDirectory, ImageStorageType.github, name);
    if (exists) {
      var file = File(localUrl);
      if (file.existsSync()) {
        return FileImage(file);
      } else {
        // remote the outdated mismatched data
        await dbProvider.removeDownloadedImage((name, '', remoteUrl));
        return await createLocalImageCache(name, localUrl);
      }
    } else {
      return await createLocalImageCache(name, localUrl);
    }
  }
```
when debug, find that it use the below url to test existence 
`https://api.github.com/repos/CrossEvol/picgo-repo/contents/1716736390193681.jpg`
then save the below url into the db 
`https://raw.githubusercontent.com/CrossEvol/picgo-repo/master/1716726612744258.jpg`

use the curl to test the contents API , response is 
```json5
[
  {
    "name": "1716736390193681.jpg",
    "path": "1716736390193681.jpg",
    "sha": "a8d664af9139887fb5bfd0c61c837f363eab0271",
    "size": 293603,
    "url": "https://api.github.com/repos/CrossEvol/picgo-repo/contents/1716736390193681.jpg?ref=master",
    "html_url": "https://github.com/CrossEvol/picgo-repo/blob/master/1716736390193681.jpg",
    "git_url": "https://api.github.com/repos/CrossEvol/picgo-repo/git/blobs/a8d664af9139887fb5bfd0c61c837f363eab0271",
    "download_url": "https://raw.githubusercontent.com/CrossEvol/picgo-repo/master/1716736390193681.jpg",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/CrossEvol/picgo-repo/contents/1716736390193681.jpg?ref=master",
      "git": "https://api.github.com/repos/CrossEvol/picgo-repo/git/blobs/a8d664af9139887fb5bfd0c61c837f363eab0271",
      "html": "https://github.com/CrossEvol/picgo-repo/blob/master/1716736390193681.jpg"
    }
  },
  // ...
]
```
should modify the api, use the url to get the specific content, and use the download_url as the identifier.

# 422 error
```shell
flutter: ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
flutter: │ #0   _UploadScreenState.build.<anonymous closure>.<anonymous closure> (package:flutter_ce_picgo/views/upload_screen.dart:41:26)
flutter: │ #1   SliverChildBuilderDelegate.build (package:flutter/src/widgets/scroll_delegate.dart:490:22)
flutter: ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
flutter: │ ! start uploading...
flutter: └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
flutter: ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
flutter: │ #0   GithubRepoService.upload (package:flutter_ce_picgo/service/repo/impl/github_repo_service.dart:69:14)
flutter: │ #1   <asynchronous suspension>
flutter: ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
flutter: │ ⛔ DioException [bad response]: This exception was thrown because the response has a status code of 422 and RequestOptions.validateStatus was configured to throw for this status code.
flutter: │ ⛔ The status code of 422 has the following meaning: "Client error - the request contains bad syntax or cannot be fulfilled"
flutter: │ ⛔ Read more about status codes at https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
flutter: │ ⛔ In order to resolve this exception you typically have either to verify and fix your request code or you have to fix the server code.
flutter: │ ⛔ 
flutter: └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
flutter: ┌───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
flutter: │ #0   _UploadScreenState.build.<anonymous closure>.<anonymous closure>.<anonymous closure> (package:flutter_ce_picgo/views/upload_screen.dart:59:30)
flutter: │ #1   <asynchronous suspension>
flutter: ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
flutter: │ ! end uploading...
flutter: └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```
find the detailed response error message: 
```json
{
  "message": "Invalid request.\n\n\"sha\" wasn't supplied.",
  "documentation_url": "https://docs.github.com/rest/repos/contents#create-or-update-file-contents",
  "status": "422"
}
```
analyze the repo, find out that the images can be upload repeatedly.

# download image failed
```shell
======== Exception caught by image resource service ================================================
The following StateError was thrown resolving an image codec:
Bad state: File: 'C:\Users\mizuk\Documents\github\1720846279855633-dignissim.jpg' is empty and cannot be loaded as an image.
```
if the image size is too large, can not download it ??

# can not open the storage document in android
```shell
I/flutter (17023): │ #0   _RepoManageScreenState.openDocument (package:flutter_ce_picgo/views/repo_manage_screen.dart:170:14)
I/flutter (17023): │ #1   <asynchronous suspension>
I/flutter (17023): ├┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄
I/flutter (17023): │ ! PlatformException(android.os.FileUriExposedException: file:////storage/emulated/0/Android/data/com.crossevol.flutter_ce_picgo/files/pictures/github exposed beyond app through Intent.getData(), FileUriExposedException, Cause: null, Stacktrace: android.os.FileUriExposedException: file:////storage/emulated/0/Android/data/com.crossevol.flutter_ce_picgo/files/pictures/github exposed beyond app through Intent.getData()
I/flutter (17023): │ ! 	at android.os.StrictMode.onFileUriExposed(StrictMode.java:2209)
I/flutter (17023): │ ! 	at android.net.Uri.checkFileUriExposed(Uri.java:2402)
I/flutter (17023): │ ! 	at android.content.Intent.prepareToLeaveProcess(Intent.java:11421)
I/flutter (17023): │ ! 	at android.content.Intent.prepareToLeaveProcess(Intent.java:11373)
I/flutter (17023): │ ! 	at android.app.Instrumentation.execStartActivity(Instrumentation.java:1742)
I/flutter (17023): │ ! 	at android.app.Activity.startActivityForResult(Activity.java:5508)
I/flutter (17023): │ ! 	at android.app.Activity.startActivityForResult(Activity.java:5466)
I/flutter (17023): │ ! 	at android.app.Activity.startActivity(Activity.java:5852)
I/flutter (17023): │ ! 	at android.app.Activity.startActivity(Activity.java:5805)
I/flutter (17023): │ ! 	at io.flutter.plugins.urllauncher.UrlLauncher.launchUrl(UrlLauncher.java:92)
I/flutter (17023): │ ! 	at io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$-CC.lambda$setup$1(Messages.java:305)
I/flutter (17023): │ ! 	at io.flutter.plugins.urllauncher.Messages$UrlLauncherApi$$ExternalSyntheticLambda1.onMessage(Unknown Source:2)
I/flutter (17023): │ ! 	at io.flutter.plugin.common.BasicMessageChannel$IncomingMessageHandler.onMessage(BasicMessageChannel.java:261)
I/flutter (17023): │ ! 	at io.flutter.embedding.engine.dart.DartMessenger.invokeHandler(DartMessenger.java:295)
I/flutter (17023): │ ! 	at io.flutter.embedding.engine.dart.DartMessenger.lambda$dispatchMessageToQueue$0$io-flutter-embedding-engine-dart-DartMessenger(DartMessenger.java:322)
I/flutter (17023): │ ! 	at io.flutter.embedding.engine.dart.DartMessenger$$ExternalSyntheticLambda0.run(Unknown Source:12)
I/flutter (17023): │ ! 	at android.os.Handler.handleCallback(Handler.java:938)
I/flutter (17023): │ ! 	at android.os.Handler.dispatchMessage(Handler.java:99)
I/flutter (17023): │ ! 	at android.os.Looper.loopOnce(Looper.java:210)
I/flutter (17023): │ ! 	at android.os.Looper.loop(Looper.java:299)
I/flutter (17023): │ ! 	at android.app.ActivityThread.main(ActivityThread.java:8307)
I/flutter (17023): │ ! 	at java.lang.reflect.Method.invoke(Native Method)
I/flutter (17023): │ ! 	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:577)
I/flutter (17023): │ ! 	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:1073)
I/flutter (17023): │ ! , null)
I/flutter (17023): └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```