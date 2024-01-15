import 'package:finx/core/constant/app_color.dart';
import 'package:finx/core/constant/string_constant.dart';
import 'package:finx/core/shared_widgets/app_text_field.dart';
import 'package:finx/core/shared_widgets/primary_button.dart';
import 'package:finx/features/authentication/account_setup/controller/profile_set_up_controller.dart';
import 'package:finx/features/authentication/account_setup/screen/pin_set_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/helpers.dart';

// ignore: must_be_immutable
class ProfileVerification extends StatefulWidget {
  const ProfileVerification({super.key});

  @override
  State<ProfileVerification> createState() => _ProfileVerificationState();
}

class _ProfileVerificationState extends State<ProfileVerification> {
  var ctr = Get.put(ProfileSetUpController());

  final formKey = GlobalKey<FormState>();

  late List<Country> _countryList;
  late Country _selectedCountry;
  late String number;

  late List<Country> filteredCountries;
  @override
  void initState() {
    super.initState();
    _countryList = countries;
    filteredCountries = _countryList;
    number =
        //widget.initialValue ??
        '';
    if (number.startsWith('+')) {
      number = number.substring(1);
      // parse initial value
      _selectedCountry = countries.firstWhere(
          (country) => number.startsWith(country.fullCountryCode),
          orElse: () => _countryList.first);

      // remove country code from the initial number value
      number = number.replaceFirst(
          RegExp("^${_selectedCountry.fullCountryCode}"), "");
    } else {
      _selectedCountry = _countryList.firstWhere((item) => item.code == ('NG'),
          orElse: () => _countryList.first);

      // remove country code from the initial number value
      if (number.startsWith('+')) {
        number = number.replaceFirst(
            RegExp("^\\+${_selectedCountry.fullCountryCode}"), "");
      } else {
        number = number.replaceFirst(
            RegExp("^${_selectedCountry.fullCountryCode}"), "");
      }
    }
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => CountryPickerDialog(
          languageCode: 'en',
          filteredCountries: filteredCountries,
          searchText: 'Search Country',
          countryList: _countryList,
          selectedCountry: _selectedCountry,
          onCountryChanged: (Country country) {
            _selectedCountry = country;

            setState(() {});
          },
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.h),
              child: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fill your profile",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 40.h),
                    AppTextField(
                      hintText: 'First Name',
                      controller: ctr.firstNameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      hintText: 'Last Name',
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      controller: ctr.lastnameController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      hintText: 'UserName',
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      controller: ctr.usernameController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    //********************* beginning Custom phone number textfield with validation*******************//
                    TextFormField(
                      controller: ctr.phoneController,
                      validator: (value) {
                        if (value == null || !isNumeric(value)) {
                          return 'Invalid phone number';
                        } else if (value.length >= _selectedCountry.minLength &&
                            value.length <= _selectedCountry.maxLength) {
                          return null;
                        }
                        return 'Invalid phone number';
                      },
                      initialValue:
                          (ctr.phoneController == null) ? number : null,
                      autofillHints: const [
                        AutofillHints.telephoneNumberNational
                      ],
                      enabled: true,
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Get.isDarkMode
                                      ? AppColor.whiteColor
                                      : AppColor.greyColor),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(6.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 2)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(6.0)),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          prefixIcon: _buildFlagsButton(),
                          fillColor: Get.isDarkMode
                              ? AppColor.secondaryDarkColor
                              : AppColor.secondaryLight,
                          filled: true),
                      maxLength: _selectedCountry.maxLength,
                    ),

                    //********************* end Custom phone number textfield with validation*******************//

                    SizedBox(height: 20.h),
                    AppTextField(
                      hintText: 'Address',
                      controller: ctr.addressController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'This Field is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 50.h),
                    PrimaryButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ctr.register();
                        }
                      },
                      label: 'Continue',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildFlagsButton() {
    return Container(
      margin: EdgeInsets.zero,
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: InkWell(
          onTap: _changeCountry,
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 4.w,
                ),
                const Icon(Icons.arrow_drop_down),
                SizedBox(width: 4.w),
                Text(
                  _selectedCountry.flag,
                  style: const TextStyle(fontSize: 18),
                ),
                SizedBox(width: 4.w),
                FittedBox(
                  child: Text(
                    '+${_selectedCountry.dialCode}',
                    //style: widget.dropdownTextStyle,
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget layout(BuildContext context) {
  return Center(
    child: Stack(
      children: [
        CircleAvatar(
            maxRadius: 50,
            backgroundImage: NetworkImage(StringConstants.dummyProfilePicture)),
        Positioned(
          bottom: 10.h,
          right: 8.h,
          child: SvgPicture.asset(
            'assets/svgs/icons8_edit.svg',
          ),
        )
      ],
    ),
  );
}
