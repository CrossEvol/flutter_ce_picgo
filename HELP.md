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