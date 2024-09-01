import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../core/reuseable/Widgets/text_sizes.dart';
import '../../../viewmodel/user_screen/change_address_viewmodel.dart';

class ChangeAddressView extends StatelessWidget {
  const ChangeAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getAddress(),
      viewModelBuilder: () => ChangeAddressViewmodel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My Address',
                style: TextStyle(
                  fontSize: TextSize.caption3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Edit your address location here',
                style: TextStyle(
                  fontSize: TextSize.caption4,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: ListView.separated(
              itemBuilder: (context, index) {
                final address = viewModel.myAddress[index];
                return ListTile(
                  onLongPress: () {
                    viewModel.deleteAddress(index);
                  },
                  leading: const Icon(
                    Icons.location_pin,
                  ),
                  title: Text(
                    address,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: TextSize.caption3),
                  ),
                  // subtitle: TextButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'edit address',
                  //     style: TextStyle(color: Colors.green),
                  //   ),
                  //  ),

                  trailing: IconButton(
                      onPressed: () {
                        viewModel.deleteAddress(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: viewModel.myAddress.length),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add address'),
                  content: SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      minLines: 2,
                      maxLength: 100,
                      maxLines: 4,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: const InputDecoration(
                        labelText: "Address",
                      ),
                      controller: addressController,
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.addAddress(context, addressController.text);
                        },
                        child: const Text('Add address')),
                  ],
                );
              },
            );
          },
          child: Icon(
            Icons.add,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
