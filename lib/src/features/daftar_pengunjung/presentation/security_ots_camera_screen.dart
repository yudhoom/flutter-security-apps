// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../common_widgets/cancel_button.dart';
import '../../../common_widgets/ok_button.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../goshow/presentation/form_karyawan_hari_ini_screen.dart';
import '../../goshow/presentation/form_tamu_hari_ini_screen.dart';
import '../../goshow/presentation/goshows_controller.dart';
import '../../home/presentation/home_screen.dart';
import '../../qr_scan/domain/model/bulk_gate.dart';
import '../../qr_scan/presentation/check_in_screen.dart';
import '../../qr_scan/presentation/scan_qr_controller.dart';

final xifProviderProvider = StateProvider<String>((ref) => '');

class SecurityOtsCameraScreen extends StatefulHookConsumerWidget {
  final String? paramRouteName;
  const SecurityOtsCameraScreen({
    super.key,
    this.paramRouteName,
  });
  static const routeName = 'security-ots-camera-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SecurityOtsCameraScreenState();
}

class _SecurityOtsCameraScreenState extends ConsumerState<SecurityOtsCameraScreen> {
  // late CameraController cameraController;
  // XFile? imageFile;
  late CameraController controller;
  int _cameraIndex = EnumCameraIndex.front.index;
  FlashMode flashMode = FlashMode.off;
  late String photoBase64;
  late File imageResized;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Logger().w('zzzzzz: ${widget.paramRouteName}');
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<BulkGate?>(visitorBulkControllerProvider, (previous, next) {
      if (next != null) {
        ref.read(bulkGateControllerProvider.notifier).bulkGate(next);
        // context.goNamed(ScanQrScreenNew.routeName);
      }
    });

    ref.listen(bulkGateControllerProvider, (previous, next) {
      if (next != null) {
        context.goNamed(CheckInScreen.routeName);
      }
    });

    // if (widget.paramRouteName != null && widget.paramRouteName == FormKaryawanHariIniScreen.routeName) {
    //   ref.listen<AsyncValue<ImageTmp?>>(
    //     uploadImageTmpProfileProvider,
    //     (previous, statex) {
    //       if ((!statex.isRefreshing && !statex.isLoading) && !statex.hasError) {
    //         Logger().i('uploadImageTmpProfileProvider ${statex.value}');
    //         ref.read(captureTmpImageProfile(EnumTypeTemporaryImg.karyawan.index).notifier).state = {
    //           "imageLocation": statex.value?.imageLocation ?? '',
    //           "imageProfileUrl": statex.value?.imageProfileUrl ?? '',
    //           "type": EnumTypeTemporaryImg.karyawan.index,
    //         };
    //         context.goNamed(widget.paramRouteName ?? '');
    //       }
    //     },
    //   );
    // } else if (widget.paramRouteName != null && widget.paramRouteName == FormTamuHariIniScreen.routeName) {
    //   ref.listen<AsyncValue<ImageTmp?>>(
    //     uploadImageTmpProfileProvider,
    //     (previous, statex) {
    //       if ((!statex.isRefreshing && !statex.isLoading) && !statex.hasError) {
    //         // Logger().i('uploadImageTmpProfileProvider ${statex.value}');
    //         ref.read(captureTmpImageProfile(EnumTypeTemporaryImg.tamu.index).notifier).state = {
    //           "imageLocation": statex.value?.imageLocation ?? '',
    //           "imageProfileUrl": statex.value?.imageProfileUrl ?? '',
    //           "type": EnumTypeTemporaryImg.tamu.index,
    //         };
    //         context.goNamed(widget.paramRouteName ?? '');
    //       }
    //     },
    //   );
    // }

    return WillPopScope(
      onWillPop: () async {
        // context.goNamed(ScanQrScreenNew.routeName);
        _doBackScanQR();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(''),
          leading: IconButton(
            icon: const Icon(
              FeatherIcons.x,
              color: Colors.white,
            ),
            onPressed: () {
              // _doBackToLogin(statusSelfie.data);
              _doBackScanQR();
            },
          ),
          actions: [
            if (_cameraIndex == EnumCameraIndex.front.index)
              IconButton(
                  onPressed: () {
                    if (flashMode == FlashMode.off) {
                      controller.setFlashMode(FlashMode.torch);
                      flashMode = FlashMode.always;
                    } else {
                      controller.setFlashMode(FlashMode.off);
                      flashMode = FlashMode.off;
                    }
                  },
                  icon: const Icon(Icons.flash_auto)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _cameraIndex = _cameraIndex == 1 ? 0 : 1;
                  });
                },
                icon: const Icon(Icons.flip_camera_android)),
          ],
        ),
        body: FutureBuilder(
          future: initializationCamera(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * controller.value.aspectRatio,
                        child: CameraPreview(controller),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset('assets/images/camera-overlay.png', fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TextHeading6(
                          title: 'Lepaskan Masker,\nposisikan mata & wajah Anda sesuai garis panduan',
                          color: Colors.white,
                          isCenter: true,
                        ),
                        const SizedBox(height: 10.0),
                        CircleAvatar(
                          radius: 30.0,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 29.0,
                            child: IconButton(
                              icon: const Icon(
                                FeatherIcons.camera,
                                // size: 30.0.sp,
                              ),
                              onPressed: () {
                                if (!controller.value.isTakingPicture) {
                                  onTakePicture(isLoading);
                                }
                              },
                            ),
                          ),
                        ),
                        // SizedBox(height: 10.0.sp),
                        // const TextHeading6(
                        //   title: 'Ambil Swafoto untuk melengkapi Profile Anda',
                        //   color: Colors.white,
                        // ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> initializationCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(
      cameras[_cameraIndex],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    await controller.initialize();
  }

  void onTakePicture(bool isLoading) async {
    await controller.takePicture().then((XFile xfile) {
      if (mounted) {
        if (xfile != null) {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: const Text(''),
                      content: SizedBox(
                        width: 200.0,
                        height: 200.0,
                        child: CircleAvatar(
                          backgroundImage: Image.file(
                            File(xfile.path),
                          ).image,
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CancelButton(
                              label: 'Ambil Ulang',
                              dialogContext: context,
                            ),
                            if (!isLoading)
                              OkButton(
                                label: 'Simpan Foto',
                                someFunction: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  _doUploadTmpImage(xfile, isLoading);
                                },
                              )
                            else
                              const Center(
                                child: CircularProgressIndicator(),
                              ),
                          ],
                        )
                      ],
                    );
                  },
                );
              });
        }
      }
      return;
    });
  }

  Future<void> _getImage(XFile image) async {
    // final XFile? image = await controller.takePicture();
    if (image.path != null) {
      imageResized = await FlutterNativeImage.compressImage(image.path, quality: 100, percentage: 70);
      setState(() {
        List<int> imageBytes = imageResized.readAsBytesSync();
        photoBase64 = base64Encode(imageBytes);
      });
      ref.read(visitorBulkControllerProvider.notifier).updateDriverphoto(photoBase64);
    }
  }

  Future<void> _doBackScanQR() async {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Anda yakin ingin membatalkan ?'),
        actions: [
          CancelButton(
            label: 'Tidak',
            dialogContext: dialogContext,
          ),
          OkButton(
            label: 'Ya',
            someFunction: () {
              if (widget.paramRouteName == FormTamuHariIniScreen.routeName) {
                context.goNamed(HomeScreen.routeName);
              } else {
                context.goNamed(widget.paramRouteName ?? '');
              }
            },
          ),
        ],
      ),
    );
  }

  void _doUploadTmpImage(XFile xfile, bool isLoading) {
    // ref.read(uploadImageTmpProfileProvider.notifier).uploadTmpImageProfile(xfile);
    testCompressAndGetFile(xfile, isLoading);
  }

  Future<void> testCompressAndGetFile(XFile xFile, bool isLoading) async {
    final myFile = File(xFile.path);
    final fileName = myFile.absolute.path.split('/').last;
    final targetPath = myFile.absolute.path.replaceAll(fileName, '${fileName.split('.')[0]}compressed.jpg');
    var result = await FlutterImageCompress.compressAndGetFile(
      myFile.absolute.path,
      targetPath,
      quality: 100,
      rotate: 0,
      minHeight: 1024,
      minWidth: 768,
    );
    ref.read(uploadImageTmpProfileProvider.notifier).uploadTmpImageProfile(xFile, result ?? File('')).then(
      (statex) {
        isLoading = false;
        var statusTamu = EnumTypeTemporaryImg.tamu.index;
        if (widget.paramRouteName != null && widget.paramRouteName == FormKaryawanHariIniScreen.routeName) {
          statusTamu = EnumTypeTemporaryImg.karyawan.index;
        }
        ref.read(captureTmpImageProfile(statusTamu).notifier).state = {
          "imageLocation": statex?.imageLocation,
          "imageProfileUrl": statex?.imageProfileUrl,
          "type": statusTamu,
        };
        if (statex != null) {
          context.goNamed(widget.paramRouteName ?? '');
        }
      },
    ).onError((error, stackTrace) {
      isLoading = false;
      Logger().w('stackTrace: ${jsonEncode(error)}');
      showDialog(
          context: context,
          builder: (contextDialog) => AlertDialog(
                title: const Text('Peringatan'),
                content: Text(jsonEncode(error)),
              ));
    });
  }
}

enum EnumCameraIndex { front, back }

enum EnumCameraDescription { front, back }
