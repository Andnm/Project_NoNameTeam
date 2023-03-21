import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

import '/utils/image_util.dart';
import 'grid_photos_screen.dart';
import 'photo_provider.dart';

//
// Future<PhotoInfo?> getVideo(BuildContext context,
//     {List<PhotoInfo>? items, bool isEdit = true}) async {
//   final hasPermissionImages = await checkPermissionImage(context);
//   if (hasPermissionImages) {
//     var page = GridPhotosScreen(
//       totalPhoto: 1,
//       itemsSelected: items ?? [],
//       isMultiple: false,
//       type: RequestType.video,
//     );
//     final PhotoInfo result =
//         await Navigator.of(context).push(_createRoute(page));
//     if (isEdit && result.entity != null) {
//       final file = await result.entity?.file;
//       final editVideo = VideoResizeScreen(file: file);
//       final listEdit =
//           await Navigator.of(context).push(_createRoute(editVideo));
//       if (listEdit != null) {
//         result.u8List = listEdit[0];
//         result.thumb = listEdit[1];
//         if (result.thumb != null) {
//           IMG.Image? image = IMG.decodeImage(result.thumb!);
//           result.ratio = image != null
//               ? double.parse((image.width / image.height).toStringAsFixed(2))
//               : 1;
//         }
//         return result;
//       } else {
//         return null;
//       }
//     } else {
//       return result;
//     }
//   } else {
//     showToast(Strings.loadImageError.localize(context));
//     return null;
//   }
// }

Future<PhotoInfo?> getImageUint8List(BuildContext context, {bool isEdit = false}) async {
  final hasPermissionImages = await checkPermissionImage(context);
  if (hasPermissionImages) {
    var page = GridPhotosScreen(
      totalPhoto: 1,
      isMultiple: false,
      type: RequestType.image,
    );
    final PhotoInfo result = await Navigator.of(context).push(_createRoute(page));
    if (isEdit && result.entity != null) {
      final file = await result.entity!.file;
      final u8ListEdit = await editPhoto(context, file?.readAsBytesSync());
      result.u8List = u8ListEdit;
      return result;
    } else {
      final file = await result.entity!.file;
      result.u8List = file?.readAsBytesSync();
      return result;
    }
  } else {
    return null;
  }
}

Future<List<PhotoInfo>> getImagesUint8List(BuildContext context, {int limit = 5, List<PhotoInfo>? items}) async {
  final hasPermissionImages = await checkPermissionImage(context);
  if (hasPermissionImages) {
    var page = GridPhotosScreen(
      totalPhoto: limit,
      itemsSelected: items ?? [],
      isMultiple: true,
      type: RequestType.image,
    );
    final result = await Navigator.of(context).push(_createRoute(page));
    await Future.forEach(result ?? [], (PhotoInfo element) async {
      if (element.entity != null) {
        final file = await element.entity!.file;
        element.u8List = file?.readAsBytesSync();
      }
    });
    return result ?? [];
  } else {
    return [];
  }
}

// Future<Uint8List?> editVideo(BuildContext context, Uint8List u8List) async {
//   final filePath = await destinationFileVideo;
//   final file = await writeToFile(u8List, filePath);
//   final editVideo = VideoResizeScreen(pathVideo: file.path);
//   final u8ListEdit = await Navigator.of(context).push(_createRoute(editVideo));
//   return u8ListEdit[0] as Uint8List;
// }

Future<Uint8List?> editPhoto(BuildContext context, Uint8List? u8List) async {
  if (u8List == null) return null;
  final filePath = await destinationFileImage;
  await writeToFile(u8List, filePath);
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    maxWidth: 720,
    maxHeight: 1080,
    sourcePath: filePath,
    aspectRatioPresets: Platform.isAndroid
        ? [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ]
        : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
  );
  if (croppedFile != null) {
    return croppedFile.readAsBytes();
  }
  return null;
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Future<bool> checkPermissionImage(BuildContext context) async {
  if (Platform.isAndroid) {
    // final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    // if ((info.version.sdkInt ?? 0) >= 33) return true;
    return true;
  }
  final status = await Permission.photos.status;
  if (status.isDenied || status.isPermanentlyDenied) {
    // showDialog(
    //     context: context,
    //     builder: (context) => TwoButtonDialogWidget(
    //           description: "Strings.pleaseGrandPhotoPermission.localize(context)",
    //           onConfirmed: () async {
    //             openAppSettings();
    //           },
    //         ));
    return false;
  }
  return true;
}
