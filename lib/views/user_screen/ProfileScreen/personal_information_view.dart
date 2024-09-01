import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../core/reuseable/Widgets/text_sizes.dart';
import '../../../viewmodel/user_screen/profile_viewmodel.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      // onViewModelReady: (viewModel) => viewModel.initClass(),
      viewModelBuilder: () => SideDrawerViewmodel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: TextSize.caption3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Edit your personal information here',
                  style: TextStyle(
                    fontSize: TextSize.caption4,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'profile image',
                  child: MaterialButton(
                    onPressed: () {
                      viewModel.pickProfileImage(context);
                    },
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(viewModel.profilePics),
                              fit: BoxFit.cover),
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(width: 3.w)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextField(
                    text: 'Full Name',
                    hint: viewModel.name,
                    textEditingController: viewModel.nameController,
                    textInputType: TextInputType.name),
                AppTextField(
                    text: 'Email',
                    hint: viewModel.email,
                    textEditingController: viewModel.emailController,
                    textInputType: TextInputType.emailAddress),
                AppTextField(
                    text: 'WhatsApp Number',
                    hint: viewModel.phoneNumber,
                    textEditingController: viewModel.whatsAppController,
                    textInputType: TextInputType.phone),
                ElevatedButton(
                    onPressed: () {
                      viewModel.onEditInfo(context, false);
                    },
                    child: viewModel.isLoading == true
                        ? const CircularProgressIndicator()
                        : Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: TextSize.caption1,
                                fontWeight: FontWeight.w700),
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.text,
    required this.hint,
    required this.textEditingController,
    required this.textInputType,
  });

  final String text;
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: TextSize.caption1),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10.r)),
            child: TextField(
              controller: textEditingController,
              keyboardType: textInputType,
              textCapitalization: TextCapitalization.sentences,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hint),
            ),
          )
        ],
      ),
    );
  }
}
