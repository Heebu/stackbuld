import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../core/reuseable/Widgets/text_sizes.dart';
import '../../../viewmodel/user_screen/transaction_history_viewmodel.dart';

class CompletePurchaseView extends StatelessWidget {
  const CompletePurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.initClass(),
      viewModelBuilder: () => TransactionHistoryViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Complete Purchases'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: viewModel.completeTransaction.isEmpty
              ? Center(
                  child: Text(
                    'No complete transactions',
                    style: TextStyle(
                        fontSize: TextSize.body1, fontWeight: FontWeight.w400),
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final transactions = viewModel.completeTransaction[index];
                    final itemDetails = [];

                    num amount = transactions.amount;
                    String date = transactions.date;
                    String status = transactions.transactionStatus;

                    return Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        height: 100.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: ListView.separated(
                                    itemBuilder: (context, index2) {
                                      final product = itemDetails[index2];
                                      String productName = product.product;
                                      num quantity = product.quantity;
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Item ${index2 + 1}: ',
                                                style: TextStyle(
                                                    fontSize: TextSize.caption3,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                productName,
                                                style: TextStyle(
                                                  fontSize: TextSize.caption3,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Quantity: ',
                                                style: TextStyle(
                                                    fontSize: TextSize.caption3,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                '$quantity',
                                                style: TextStyle(
                                                    fontSize:
                                                        TextSize.caption3),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: itemDetails.length)),
                            Row(
                              children: [
                                Text(
                                  'Date: ',
                                  style: TextStyle(
                                      fontSize: TextSize.caption3,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  date,
                                  style: TextStyle(fontSize: TextSize.caption3),
                                ),
                                const Spacer(),
                                Text(status,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: TextSize.caption3,
                                        color: Colors.blue)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Amount: ',
                                  style: TextStyle(
                                      fontSize: TextSize.caption3,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '₦$amount',
                                  style: TextStyle(
                                      fontSize: TextSize.caption3,
                                      color: amount < 200
                                          ? Colors.red
                                          : Colors.green),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: viewModel.completeTransaction.length),
        ),
      ),
    );
  }
}
