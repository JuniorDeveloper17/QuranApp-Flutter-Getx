import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quranapp/core/widget/customFutureBuilder.dart';
import '../../../data/model/location_m.dart';
import '../dependenci/dependency.dart';
import '../theme/theme.dart';

class DorpdownLocation extends GetView {
  DorpdownLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<List<LocationModel?>>(
      futureProvider: () => auth.getDataLocation(),
      loadingBuilder: (context) => Text(''),
      errorBuilder: (BuildContext context, error) => Text('$error'),
      dataBuilder: (context, data) {
        List<LocationModel?> id = data;
        return DropdownSearch<dynamic>(
          dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blue1, width: 1.3))),
              baseStyle: GoogleFonts.openSans(color: black, fontSize: 13)),
          dropdownButtonProps: DropdownButtonProps(color: black),
          popupProps: PopupProps.menu(
            searchFieldProps: TextFieldProps(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    suffixIcon: Icon(
                      Icons.search,
                      color: grey,
                      size: 30,
                    ),
                    hintText: 'cari kota kamu...',
                    hintStyle: GoogleFonts.openSans(fontSize: 15, color: grey),
                    filled: true,
                    fillColor: grey100,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none))),
            menuProps: MenuProps(
                backgroundColor: white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            showSearchBox: true,
          ),
          items: List.generate(data.length, (index) {
            LocationModel? result = data[index];

            return '${result?.lokasi}';
          }),
          onChanged: (value) {
            id.forEach((element) {
              if (element!.lokasi == value) {
                auth.locationName(value);
                auth.idLocation(element.id);
              }
            });
          },
          selectedItem: auth.locationName == ''
              ? 'select lokasi'
              : auth.locationName.value,
        );
      },
    );
  }
}
