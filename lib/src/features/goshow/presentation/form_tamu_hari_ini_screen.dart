import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../../common_utils/utils.dart';
import '../../../common_widgets/ok_button.dart';
import '../../../common_widgets/text_heading6.dart';
import '../../../core/client/failure.dart';
import '../../../core/domain/user_shared_preferences.dart';
import '../../daftar_pengunjung/presentation/pengunjung_hari_ini_screen.dart';
import '../../daftar_pengunjung/presentation/widgets/gate_in_button_widget.dart';
import '../../home/presentation/home_screen.dart';
import '../../qr_scan/presentation/widgets/form_label_widget.dart';
import '../../qr_scan/presentation/widgets/text_field_widget.dart';
import '../domain/entities/direct_spv.dart';
import '../domain/entities/gate_in_input_tamu.dart';
import '../domain/entities/gate_in_karyawan_tamu.dart';
import 'form_karyawan_hari_ini_screen.dart';
import 'goshows_controller.dart';
import 'search_controller.dart';
import 'search_emp_manual_screen.dart';
import 'widgets/card_employee_widget.dart';
import 'widgets/event_header_widget.dart';
import 'widgets/search_suggestions_widget.dart';

enum Gender { pria, wanita }

class FormTamuHariIniScreen extends StatefulHookConsumerWidget {
  const FormTamuHariIniScreen({super.key});
  static const routeName = 'form-tamu-hari-ini-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormTamuHariIniScreenState();
}

class _FormTamuHariIniScreenState extends ConsumerState<FormTamuHariIniScreen> {
  var mineKeywordController = TextEditingController();
  bool isLoading = false;
  bool isOpenOptions = false;
  bool isLoadingGateIn = false;
  Gender? _gender = Gender.pria;
  var organizerState = const DirectSpv();
  String? selectedCountryCode = '+62';

  @override
  Widget build(BuildContext context) {
    final employeeDataTampunganState = ref.watch(employeeDataTampunganProvider);
    final captureTmpImageProfileState = ref.watch(captureTmpImageProfile(EnumTypeTemporaryImg.tamu.index));

    var defaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 15.0.sp);
    var paddingHorizontalTf = 15.0.sp;
    var paddingVerticalTf = 15.0.sp;
    var defaultVerticalPadding = EdgeInsets.symmetric(vertical: 10.0.sp, horizontal: 20.0.sp);

    var phoneController = useTextEditingController();
    var namaTamu = useTextEditingController();
    var nomorKtp = useTextEditingController();
    var namaPerusahaan = useTextEditingController();

    ref.listen<AsyncValue<List<DirectSpv>?>>(
      searchEmpByKeywordControllerProvider,
      (prev, state) {
        if ((!state.isRefreshing && !state.isLoading) && !state.hasError) {
          if (state.value != null) {
            ref.read(employeeDataTampunganProvider.notifier).state = state.value!;
            setState(() {
              // isOpenOptions = true;
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        }
      },
    );

    ref.listen<AsyncValue<GateInKaryawanTamu?>>(
      goshowsControllerProvider,
      (prev, state) {
        if ((!state.isRefreshing && !state.isLoading) && !state.hasError) {
          doResetImage();
          context.goNamed(PengunjungHariIniScreen.routeName, extra: state.value?.idEvent);
          setState(() {
            isLoadingGateIn = false;
          });
        }
        if ((!state.isRefreshing && !state.isLoading) && state.hasError) {
          showError((state.error as GeneralFailure).message);
          setState(() {
            isLoadingGateIn = false;
          });
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        doBack();
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppThemeJtlc.white,
          appBar: AppBar(
            title: const Text('Form Tamu Hari Ini'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const EventHeaderWidget(dataku: {'title': 'Form Tamu Hari Ini'}),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppThemeJtlc.jtlcGrayLight,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0.sp), topRight: Radius.circular(25.0.sp)),
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.sp, vertical: 10.0.sp),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 110.0.sp,
                              backgroundColor: AppThemeJtlc.jtlcGrayMute,
                              backgroundImage:
                                  Image.network(captureTmpImageProfileState['imageProfileUrl'].toString()).image,
                            ),
                            // if (captureTmpImageProfileState['imageLocation'] == '')
                            // ElevatedButton(
                            //   onPressed: () {
                            //     context.goNamed(SecurityOtsCameraScreen.routeName, extra: FormTamuHariIniScreen.routeName);
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: AppThemeJtlc.jtlcBlueDark,
                            //     // padding: EdgeInsets.symmetric(vertical: 10.0.sp),
                            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0.sp)),
                            //   ),
                            //   child: const Text('Ambil Foto'),
                            // ),
                          ],
                        ),
                      ),
                      // Text('${isOpenOptions}'),
                      Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                              label: 'NIK/ Nama Karyawan Pengundang', paramIcon: FeatherIcons.userPlus)),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                      //   child: TextFieldWidget(
                      //     type: 'search',
                      //     paramController: reasonController,
                      //     paramHint: 'Cari NIK/ Nama Karyawan',
                      //   ),
                      // ),
                      //========
                      SizedBox(
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 0.0.sp, left: 15.0.sp, right: 15.0.sp, top: 10.0.sp),
                              child: Autocomplete<DirectSpv>(
                                displayStringForOption: (DirectSpv option) => option.empname ?? '',
                                fieldViewBuilder: (context, myKeywordController, myFocusNode, onFieldSubmitted) {
                                  mineKeywordController = myKeywordController;
                                  return Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      TextFormField(
                                        onChanged: (value) {
                                          doDebouncing(
                                            fn: () async {
                                              await ref
                                                  .read(searchEmpByKeywordControllerProvider.notifier)
                                                  .findEmpByKeyword(value.toLowerCase())
                                                  .whenComplete(() {
                                                setState(() {
                                                  isOpenOptions = true;
                                                });
                                              });
                                            },
                                          );
                                        },
                                        controller: mineKeywordController,
                                        onEditingComplete: onFieldSubmitted,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(RegExp(r'[0-9 A-Za-z]')),
                                        ],
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppThemeJtlc.white,
                                          labelText: 'Cari Nama/ NIK',
                                          hintText: '',
                                          contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0.sp),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(18.0.sp),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            if (isLoading)
                                              SizedBox(
                                                height: 20.h,
                                                width: 20.w,
                                                child: const CircularProgressIndicator.adaptive(),
                                              ),
                                            if (mineKeywordController.text.isNotEmpty)
                                              InkWell(
                                                onTap: () {
                                                  mineKeywordController.clear();
                                                  doClosedList();
                                                },
                                                child: const Icon(FeatherIcons.x),
                                              )
                                            else
                                              Icon(FeatherIcons.search, size: 20.0.sp, color: AppThemeJtlc.jtlcOrange),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                                optionsBuilder: (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<DirectSpv>.empty();
                                  } else {
                                    List<DirectSpv> results = [];
                                    var pattern = textEditingValue.text;
                                    for (var i = 0; i < employeeDataTampunganState.length; i++) {
                                      if (employeeDataTampunganState[i]
                                              .empid
                                              ?.toLowerCase()
                                              .contains(pattern.toLowerCase()) ??
                                          false) {
                                        results.add(employeeDataTampunganState[i].empid == null
                                            ? employeeDataTampunganState[i]
                                            : employeeDataTampunganState[i]);
                                      }
                                      if (employeeDataTampunganState[i]
                                              .empname
                                              ?.toLowerCase()
                                              .contains(pattern.toLowerCase()) ??
                                          false) {
                                        results.add(employeeDataTampunganState[i].empname == null
                                            ? employeeDataTampunganState[i]
                                            : employeeDataTampunganState[i]);
                                      }
                                    }
                                    return results;
                                  }
                                },
                              ),
                            ),
                            if (employeeDataTampunganState.isNotEmpty && isOpenOptions == true)
                              SearchSuggestionsWidget(
                                doClosedList: () => doClosedList(),
                                employeeDataTampunganState: employeeDataTampunganState,
                                mineKeywordController: mineKeywordController,
                                doAddToTemporary: (p0) {
                                  setState(() {
                                    organizerState = p0;
                                    isOpenOptions = false;
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                      //========
                      SizedBox(height: 10.0.sp),
                      //========
                      if (organizerState.empid != null)
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: defaultHorizontalPadding,
                                  child: const FormLabelWidget(label: 'Data Pengundang', paramIcon: FeatherIcons.userPlus)),
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Padding(
                                    padding: defaultVerticalPadding,
                                    child: CardEmployeeWidget(
                                      isOrganizer: true,
                                      empid: organizerState.empid ?? '',
                                      name: organizerState.empname ?? '',
                                      gender: organizerState.gendername ?? '',
                                      companyInfo: organizerState.persareaname ?? '',
                                      avatar: organizerState.imageProfileUrl ?? '',
                                      onTapFunction: () {},
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.0.sp,
                                      horizontal: 30.0.sp,
                                    ),
                                    child: InkWell(
                                      onTap: () => setState(() {
                                        organizerState = const DirectSpv();
                                      }),
                                      child: Icon(
                                        FeatherIcons.x,
                                        size: 20.0.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      //========
                      Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(label: 'Nomor WhatsApp Tamu', paramIcon: FeatherIcons.userPlus)),
                      // const InputPhoneWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                        child: IntlPhoneField(
                          textInputAction: TextInputAction.go,
                          controller: phoneController,
                          initialCountryCode: 'ID',
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          validator: (value) {
                            var inputLength = value?.number.length ?? 0;
                            if (inputLength > 15) {
                              return 'Nomor telepon tidak boleh lebih dari 15 digit';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: AppThemeJtlc.white,
                              counterText: "",
                              labelText: 'Masukkan Nomor WhatsApp',
                              border: OutlineInputBorder(
                                gapPadding: 0.0,
                                borderSide: const BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
                              ),
                              suffixIcon: isLoading
                                  ? const FittedBox(child: CircularProgressIndicator.adaptive())
                                  : const SizedBox.shrink()),
                          onChanged: (phone) {
                            // print(phone.completeNumber);
                          },
                          onCountryChanged: (country) {
                            setState(() {
                              selectedCountryCode = '+${country.dialCode}';
                            });
                          },
                          disableLengthCheck: true,
                        ),
                      ),
                      Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Nama Tamu',
                            paramIcon: FeatherIcons.user,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                        child: TextFieldWidget(
                          type: 'text',
                          paramController: namaTamu,
                          paramHint: 'Masukkan Nama Tamu',
                          fillColor: AppThemeJtlc.white,
                          isFill: true,
                        ),
                      ),
                      Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Masukkan Nomor Identitas',
                            paramIcon: FeatherIcons.file,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                        child: TextFieldWidget(
                          type: 'text',
                          maxLengthNumber: 16,
                          paramController: nomorKtp,
                          paramHint: 'Masukkan Nomor Identitas',
                          isFill: true,
                          fillColor: AppThemeJtlc.white,
                        ),
                      ),
                      Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Nama Perusahaan',
                            paramIcon: FeatherIcons.briefcase,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: paddingHorizontalTf, vertical: paddingVerticalTf),
                        child: TextFieldWidget(
                          type: 'text',
                          paramController: namaPerusahaan,
                          paramHint: 'Masukkan Nama Perusahaan',
                          fillColor: AppThemeJtlc.white,
                          isFill: true,
                        ),
                      ),
                      Padding(
                          padding: defaultHorizontalPadding,
                          child: const FormLabelWidget(
                            label: 'Gender',
                            paramIcon: FeatherIcons.user,
                          )),
                      Padding(
                        padding: defaultHorizontalPadding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(children: [
                              Radio<Gender>(
                                  value: Gender.pria,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  }),
                              const Text('Laki-Laki'),
                            ]),
                            Row(children: [
                              Radio<Gender>(
                                value: Gender.wanita,
                                groupValue: _gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    _gender = value;
                                  });
                                },
                              ),
                              const Text('Perempuan'),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          persistentFooterButtons: [
            if (!isLoadingGateIn)
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5.sp,
                  child: GateInButtonWidget(
                    doSubmit: () {
                      doSubmitHandler(
                        organizerState,
                        namaTamu,
                        nomorKtp,
                        namaPerusahaan,
                        captureTmpImageProfileState,
                        phoneController,
                      );
                    },
                  ),
                ),
              )
            else
              const Center(child: CircularProgressIndicator.adaptive()),
          ],
        ),
      ),
    );
  }

  void doClosedList() {
    FocusScope.of(context).unfocus();
    mineKeywordController.clear();
    setState(() {
      isOpenOptions = false;
    });
    ref.read(employeeDataTampunganProvider.notifier).state = [];
  }

  void showError(String? message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Peringatan'),
        content: Text(message ?? ''),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void doBack() async {
    doResetImage();
    context.goNamed(HomeScreen.routeName);
  }

  void doResetImage() {
    ref.read(captureTmpImageProfile(EnumTypeTemporaryImg.tamu.index).notifier).state = {
      'imageLocation': '',
      'imageProfileUrl': '',
      'type': EnumTypeTemporaryImg.tamu.index
    };
  }

  void doSubmitHandler(
    DirectSpv organizerState,
    TextEditingController namaTamu,
    TextEditingController nomorKtp,
    TextEditingController namaPerusahaan,
    Map<String, dynamic> captureTmpImageProfileState,
    TextEditingController phoneController,
  ) async {
    var phoneEmp = '$selectedCountryCode${phoneNumberNonZero(phoneController.value.text.trim().replaceAll('-', ''), '')}';
    final username = await UserSharedPreferences.getUsername();
    if (isValid(
      organizerState,
      captureTmpImageProfileState['imageLocation'],
      phoneController,
      namaTamu,
      nomorKtp,
      namaPerusahaan,
    )) {
      setState(() {
        isLoadingGateIn = true;
      });
      var input = GateInInputTamu(
        visitor: Visitor(
          phoneNumber: phoneEmp,
          name: namaTamu.value.text,
          gendercode: _gender == Gender.pria ? 1.toString() : 2.toString(),
          idCardNumber: nomorKtp.value.text.toString().trim(),
          companyName: namaPerusahaan.value.text.toString().trim(),
          imageLocation: captureTmpImageProfileState['imageLocation'].toString(),
        ),
        organizer: Organizer(
          username: organizerState.empid,
          name: organizerState.empname,
          gendercode: organizerState.gendercode,
          compcodename: organizerState.compcodename,
          persareaname: organizerState.persareaname,
          perssubareaname: organizerState.perssubareaname,
          spvEmpid: organizerState.spvEmpid,
        ),
        username: username,
      );
      ref.read(goshowsControllerProvider.notifier).gateInOtsTamu(input);
    }
  }

  bool isValid(
    DirectSpv organizerState,
    captureTmpImageProfileState,
    TextEditingController phoneController,
    TextEditingController namaTamu,
    TextEditingController nomorKtp,
    TextEditingController namaPerusahaan,
  ) {
    if (captureTmpImageProfileState.isEmpty) {
      _showValidationSnackBar(title: 'Harap melengkapi foto tamu');
      return false;
    } else if (organizerState.empid == null) {
      _showValidationSnackBar(title: 'Harap mengisi Karyawan Pengundang');
      return false;
    } else if (phoneController.text.isEmpty) {
      _showValidationSnackBar(title: 'Harap mengisi nomor WhatsApp');
      return false;
    } else if (namaTamu.text.isEmpty) {
      _showValidationSnackBar(title: 'Harap mengisi nama tamu');
      return false;
    } else if (nomorKtp.text.isEmpty) {
      _showValidationSnackBar(title: 'Harap mengisi nomor KTP');
      return false;
    } else {
      return true;
    }
  }

  void _showValidationSnackBar({required String title}) {
    showDialog(
      context: context,
      builder: (contextDialog) => AlertDialog(
        title: const Text('Peringatan'),
        content: TextHeading6(title: title),
        actions: [
          OkButton(
            label: 'OK',
            someFunction: () {
              Navigator.of(contextDialog).pop();
            },
          ),
        ],
      ),
    );
  }
}
