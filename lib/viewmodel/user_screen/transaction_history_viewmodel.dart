import 'package:stacked/stacked.dart';

import '../../model/transaction_hostory_model.dart';

class TransactionHistoryViewModel extends BaseViewModel {
  List<TransactionHistoryModel> allTransaction = <TransactionHistoryModel>[];
  List<TransactionHistoryModel> completeTransaction =
      <TransactionHistoryModel>[];
  String accessToken = '';
  String userId = '';

  getTransactionHistory() async {}

  getAccessToken() async {}

  Future<void> onRefreshed() async {
    await initClass();
  }

  initClass() async {
    await getAccessToken();
    await getTransactionHistory();
  }
}
