import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../../../common_config/app_theme_jtlc.dart';
import '../../daftar_pengunjung/data/entrant.dart';
import '../../qr_scan/presentation/widgets/form_label_widget.dart';
import '../domain/entities/direct_spv.dart';
import '../domain/entities/enum_entrant.dart';
import 'form_karyawan_hari_ini_screen.dart';
import 'search_controller.dart';
import 'widgets/event_header_widget.dart';

final employeeDataTampunganProvider = StateProvider.autoDispose<List<DirectSpv>>((ref) => []);

class SearchEmpManualScreen extends StatefulHookConsumerWidget {
  const SearchEmpManualScreen({super.key});
  static const routeName = 'search-emp-manual-screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchEmpManualScreenState();
}

class _SearchEmpManualScreenState extends ConsumerState<SearchEmpManualScreen> {
  // var myFocusNode = FocusNode();
  var mineKeywordController = TextEditingController();
  bool isLoading = false;
  bool isOpenOptions = false;

  late List<String> autoCompleteData;
  late List<DirectSpv> employeeDataTampungan = [];
  var debounceTimer = Timer(const Duration(milliseconds: 500), () {});
  void doDebouncing({required Function() fn, int waitForMs = 500}) {
    debounceTimer.cancel();
    debounceTimer = Timer(Duration(milliseconds: waitForMs), fn);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var defaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0.sp, vertical: 40.0.sp);
    final employeeDataTampunganState = ref.watch(employeeDataTampunganProvider);

    ref.listen<AsyncValue<List<DirectSpv>?>>(
      searchEmpByKeywordGenControllerProvider,
      (prev, state) {
        if (state is AsyncData) {
          if (state.value != null) {
            ref.read(employeeDataTampunganProvider.notifier).state = state.value!;
            setState(() {
              isOpenOptions = true;
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

    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        backgroundColor: AppThemeJtlc.white,
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: AppThemeJtlc.jtlcTitleBlack,
          backgroundColor: AppThemeJtlc.white,
          title: const Text('Pilih Karyawan'),
          elevation: 1,
        ),
        body: Column(
          children: [
            const EventHeaderWidget(dataku: {'title': 'Form Tamu Hari Ini'}),
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0.sp, vertical: 20.0.sp),
                      child: const FormLabelWidget(
                        label: 'NIK/ Nama Karyawan',
                        paramIcon: FeatherIcons.userPlus,
                        colorLabel: AppThemeJtlc.jtlcGrayMute,
                      )),
                  Padding(
                    padding: defaultHorizontalPadding,
                    child: Autocomplete<DirectSpv>(
                      displayStringForOption: (DirectSpv option) => option.empname ?? '',
                      fieldViewBuilder: (context, myKeywordController, myFocusNode, onFieldSubmitted) {
                        mineKeywordController = myKeywordController;
                        return Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            TextField(
                              onChanged: (value) {
                                doDebouncing(
                                  fn: () async {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    await ref
                                        .read(searchEmpByKeywordGenControllerProvider.notifier)
                                        .findEmpByKeyword(value.toLowerCase());
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
                                    GestureDetector(
                                      onTap: () {
                                        mineKeywordController.clear();
                                        doClosedList();
                                        setState(() {});
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
                            if (employeeDataTampunganState[i].empid?.toLowerCase().contains(pattern.toLowerCase()) ??
                                false) {
                              results.add(employeeDataTampunganState[i].empid == null
                                  ? employeeDataTampunganState[i]
                                  : employeeDataTampunganState[i]);
                            }
                            if (employeeDataTampunganState[i].empname?.toLowerCase().contains(pattern.toLowerCase()) ??
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
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.13.sp,
                        left: 25.0.sp,
                        right: 25.0.sp,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0.sp),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: employeeDataTampunganState.asMap().entries.map((e) {
                            var dataku = e.value;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  doAddToTemporary(dataku);
                                  // doClosedList();
                                  mineKeywordController.clear();
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: NetworkImage(
                                      e.value.imageProfileUrl ?? 'https://www.w3schools.com/howto/img_avatar.png',
                                    ),
                                  ),
                                  title: Text(e.value.empname ?? ''),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(e.value.empid ?? ''),
                                      Text(e.value.compcodename ?? ''),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doAddToTemporary(DirectSpv suggestion) async {
    // var empidOrganizer = await UserSecureStorage.getUsername();
    // var isExist = ref.read(entrantControllerProvider.notifier).isExist(suggestion);
    // if (suggestion.empid != empidOrganizer) {
    ref.read(entrantControllerProvider.notifier).addSingle(
          Entrant(
            username: suggestion.empid ?? '',
            idEmpType: EnumEntrantType.EMPLOYEE.index.toString(),
            gendercode: suggestion.gendercode ?? '99',
            gendername: suggestion.gendername ?? '',
            name: suggestion.empname ?? '',
            compcode: suggestion.compcode ?? '',
            compcodename: suggestion.compcodename ?? '',
            persareacode: suggestion.persareacode ?? '',
            persareaname: suggestion.persareaname ?? '',
            perssubareacode: suggestion.perssubareacode ?? '',
            perssubareaname: suggestion.perssubareaname ?? '',
            grade: suggestion.grade ?? '',
            spvEmpid: suggestion.spvEmpid ?? '',
            spvEmpname: suggestion.spvEmpname ?? '',
            imageAvailable: suggestion.imageAvailable ?? false,
            // imageProfileUrl: suggestion.imageProfileUrl ?? '',
            imageProfileUrl: suggestion.imageProfileUrl ?? '',
          ),
        );
    // doClosedList();
    // debugPrint(suggestion.toJson().toString());
    context.pushNamed(FormKaryawanHariIniScreen.routeName);
    // }
  }

  void doClosedList() {
    ref.read(employeeDataTampunganProvider.notifier).state = [];
  }
}
