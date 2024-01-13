// // To parse this JSON data, do
// //
// //     final homeDetails = homeDetailsFromJson(jsonString);
//
// import 'dart:convert';
//
// HomeDetails homeDetailsFromJson(String str) => HomeDetails.fromJson(json.decode(str));
//
// String homeDetailsToJson(HomeDetails data) => json.encode(data.toJson());
//
// class HomeDetails {
//   int? statusCode;
//   List<Datum>? data;
//   int? totalCount;
//
//   HomeDetails({
//     this.statusCode,
//     this.data,
//     this.totalCount,
//   });
//
//   factory HomeDetails.fromJson(Map<String, dynamic> json) => HomeDetails(
//     statusCode: json["StatusCode"],
//     data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//     totalCount: json["total_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "StatusCode": statusCode,
//     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     "total_count": totalCount,
//   };
// }
//
// class Datum {
//   int? index;
//   String? id;
//   String? voucherNo;
//   DateTime? date;
//   ErName? ledgerName;
//   double? totalGrossAmtRounded;
//   int? totalTaxRounded;
//   double? grandTotalRounded;
//   ErName? customerName;
//   int? totalTax;
//   Status? status;
//   double? grandTotal;
//   bool? isBillwised;
//   BillwiseStatus? billwiseStatus;
//
//   Datum({
//     this.index,
//     this.id,
//     this.voucherNo,
//     this.date,
//     this.ledgerName,
//     this.totalGrossAmtRounded,
//     this.totalTaxRounded,
//     this.grandTotalRounded,
//     this.customerName,
//     this.totalTax,
//     this.status,
//     this.grandTotal,
//     this.isBillwised,
//     this.billwiseStatus,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     index: json["index"],
//     id: json["id"],
//     voucherNo: json["VoucherNo"],
//     date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
//     ledgerName: erNameValues.map[json["LedgerName"]]!,
//     totalGrossAmtRounded: json["TotalGrossAmt_rounded"]?.toDouble(),
//     totalTaxRounded: json["TotalTax_rounded"],
//     grandTotalRounded: json["GrandTotal_Rounded"]?.toDouble(),
//     customerName: erNameValues.map[json["CustomerName"]]!,
//     totalTax: json["TotalTax"],
//     status: statusValues.map[json["Status"]]!,
//     grandTotal: json["GrandTotal"]?.toDouble(),
//     isBillwised: json["is_billwised"],
//     billwiseStatus: billwiseStatusValues.map[json["billwise_status"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "index": index,
//     "id": id,
//     "VoucherNo": voucherNo,
//     "Date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
//     "LedgerName": erNameValues.reverse[ledgerName],
//     "TotalGrossAmt_rounded": totalGrossAmtRounded,
//     "TotalTax_rounded": totalTaxRounded,
//     "GrandTotal_Rounded": grandTotalRounded,
//     "CustomerName": erNameValues.reverse[customerName],
//     "TotalTax": totalTax,
//     "Status": statusValues.reverse[status],
//     "GrandTotal": grandTotal,
//     "is_billwised": isBillwised,
//     "billwise_status": billwiseStatusValues.reverse[billwiseStatus],
//   };
// }
//
// enum BillwiseStatus {
//   PAID,
//   UNPAID
// }
//
// final billwiseStatusValues = EnumValues({
//   "paid": BillwiseStatus.PAID,
//   "unpaid": BillwiseStatus.UNPAID
// });
//
// enum ErName {
//   CASH_IN_HAND,
//   JASMAL
// }
//
// final erNameValues = EnumValues({
//   "Cash In Hand": ErName.CASH_IN_HAND,
//   "Jasmal": ErName.JASMAL
// });
//
// enum Status {
//   INVOICED
// }
//
// final statusValues = EnumValues({
//   "Invoiced": Status.INVOICED
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
