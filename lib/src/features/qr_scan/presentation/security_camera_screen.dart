// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/cancel_button.dart';
import '../../../common_widgets/ok_button.dart';
import '../../../common_widgets/text_heading6.dart';
import '../domain/model/bulk_gate.dart';
import '../domain/model/visitor_gate.dart';
import 'check_in_screen.dart';
import 'scan_qr_controller.dart';
import 'scan_qr_screen_new.dart';

final xifProviderProvider = StateProvider<String>((ref) => '');

class SecurityCameraScreen extends StatefulHookConsumerWidget {
  const SecurityCameraScreen({super.key});
  static const routeName = 'securityCameraScreen';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SecurityCameraScreenState();
}

class _SecurityCameraScreenState extends ConsumerState<SecurityCameraScreen> {
  // late CameraController cameraController;
  // XFile? imageFile;
  late CameraController controller;
  int _cameraIndex = 0;
  FlashMode flashMode = FlashMode.off;
  late String photoBase64;
  late File imageResized;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // initUserInfo();
    // initializationCamera();
    // didChangeAppLifecycleState(AppLifecycleState.inactive);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<BulkGate?>(
      visitorBulkControllerProvider,
      (previous, next) {
        if (next != null) {
          ref.read(bulkGateControllerProvider.notifier).bulkGate(next);
          // context.goNamed(ScanQrScreenNew.routeName);
        }
      },
    );
    ref.listen<AsyncValue<VisitorGate?>>(
      bulkGateControllerProvider,
      (previous, next) {
        if (next is AsyncData) {
          context.goNamed(CheckInScreen.routeName);
          setState(() {
            isLoading = false;
          });
        }

        if (next is AsyncError) {
          showError(context, next.error);
          setState(() {
            isLoading = false;
          });
        }
      },
    );
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
            if (_cameraIndex == 0)
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
                  icon: const Icon(
                    Icons.flash_auto,
                    color: Colors.white,
                  )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _cameraIndex = _cameraIndex == 1 ? 0 : 1;
                  });
                },
                icon: const Icon(
                  Icons.flip_camera_android,
                  color: Colors.white,
                )),
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
                                  onTakePicture();
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
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller.initialize();
  }

  void onTakePicture() async {
    await controller.takePicture().then((XFile xfile) {
      if (mounted) {
        if (xfile != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: StatefulBuilder(
                builder: (context, setState) {
                  return SizedBox(
                    width: 200.0.sp,
                    height: MediaQuery.of(context).size.height * 0.5.sp,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.65.sp,
                            backgroundImage: Image.file(
                              File(xfile.path),
                              fit: BoxFit.cover,
                            ).image,
                          ),
                        ),
                        !isLoading
                            ? Expanded(
                                flex: 0,
                                child: Wrap(
                                  children: [
                                    CancelButton(
                                      label: 'Ambil Ulang',
                                      dialogContext: context,
                                    ),
                                    OkButton(
                                      label: 'Simpan',
                                      someFunction: () {
                                        _getImage(xfile);
                                        setState(() {
                                          isLoading = true;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                      ],
                    ),
                  );
                },
              ),
              // actions: [
              //   !isLoading
              //       ? Wrap(
              //           children: [
              //             CancelButton(
              //               label: 'Ambil Ulang',
              //               dialogContext: context,
              //             ),
              //             OkButton(
              //               label: 'Simpan',
              //               someFunction: () {
              //                 _getImage(xfile);
              //               },
              //             ),
              //           ],
              //         )
              //       : const Center(
              //           child: CircularProgressIndicator.adaptive(),
              //         )
              // ],
            ),
          );
        }
      }
      return;
    });
  }

  Future<void> _getImage(XFile image) async {
    // final XFile? image = await controller.takePicture();
    if (image.path != null) {
      imageResized = await FlutterNativeImage.compressImage(
        image.path,
        quality: 100,
        percentage: 70,
      );
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
              // ref.read(visitorProvider.notifier).state.clear();
              context.goNamed(ScanQrScreenNew.routeName);
            },
          ),
        ],
      ),
    );
  }

  void showError(BuildContext context, Object? error) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Peringatan'),
        content: Text(error.toString()),
        actions: [
          CancelButton(
            dialogContext: dialogContext,
          ),
        ],
      ),
    );
  }
}

enum EnumCameraDescription { front, back }
