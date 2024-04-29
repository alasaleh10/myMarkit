import 'package:my_markit/core/validation/reqular_exc.dart';

validation(String value, String type, {String? password}) {
  switch (type) {
    case 'caintName':
      if (!RegExp(arabicName).hasMatch(value)) {
        return " الاسم عربي ولايمكن تركه فارغا";
      } else if (value.length <= 3) {
        return 'الإسم يجب ان يكون اكبر من 3';
      }

    // case 'email':
    //   if (!RegExp(emailReg).hasMatch(value)) {
    //     return 'البريد الالكتروني غير صالح';
    //   }

    case 'phone':
      if (!RegExp(phoneLength).hasMatch(value)) {
        return 'رقم الجوال يجب ان يكون 9 ارقام';
      } else if (!RegExp(phoneNumber).hasMatch(value)) {
        return 'يجب ان يكون رقم';
      }
    case 'discription':
      if (value.isEmpty) {
        return 'لايمكن ترك الوصف فارغا';
      } else if (value.length <= 3) {
        return 'الوصف يجب ان يكون اكبر من 3';
      }

    case 'price':
      if (value.isEmpty) {
        return 'لايمكن ترك السعر فارغا ';
      } else if (!RegExp(phoneNumber).hasMatch(value)) {
        return 'يجب ان يكون رقم';
      }

    // case 'password':
    //   if (value.isEmpty) {
    //     return 'لايمكن ترك كلمة المرور فارغة';
    //   } else if (!RegExp(min8).hasMatch(value)) {
    //     return 'كلمة المرور يجب ان تكون اكبر من 7';
    //   } else if (!RegExp(passwordReg).hasMatch(value)) {
    //     return 'كلمة المرور يجب ان تحتوي على ارقام او احرف فقط';
    //   }

    // case 'name':

    // case 'location':
    //   if (value.isEmpty) {
    //     return 'لايمكن ترك الموقع فارغا';
    //   }

    // case 'accoumNo':
    //   if (value.isEmpty) {
    //     return "لايمكن ترك رقم الاقامة فارغا";
    //   } else if (!RegExp(phoneNumber).hasMatch(value)) {
    //     return 'رقم الاقامة يجب ان يكون رقما';
    //   }
    // case 'project':
    //   if (value.isEmpty) {
    //     return "لايمكن ترك اسم المشروع فارغا";
    //   }
    // case 'projectStatus':
    //   if (value.isEmpty) {
    //     return "لايمكن ترك حالة المشروع فارغا";
    //   } else if (!RegExp(min3).hasMatch(value)) {
    //     return 'حالة المشروع يجب ان يكون اكبر من 3';
    //   }
    // case 'purpose':
    //   if (value.isEmpty) {
    //     return "لايمكن ترك الغرض  فارغا";
    //   }
    // case 'reaction':
    //   if (value.isEmpty) {
    //     return "لايمكن ترك الانطباع فارغا";
    //   }
    // case 'next':
    //   if (value.isEmpty) {
    //     return "لايمكن ترك الاجراء القادم فارغا";
    //   }
    // case 'id':
    //   if (value.isEmpty) {
    //     return "لايمكن ترك الرقم الوظيفي فارغا";
    //   } else if (!RegExp(phoneNumber).hasMatch(value)) {
    //     return 'الرقم الوظيفي  يجب ان يكون رقما';
    //   }
  }
}
