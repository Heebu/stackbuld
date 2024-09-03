import 'package:flutter/material.dart';
import 'package:stackbuld/core/reuseable/Widgets/mainTextWidget.dart';
import 'package:stacked/stacked.dart';

import '../../../viewmodel/user_screen/all_cart_viewmodel.dart';
import 'edit_cart_view.dart';

class AllCartView extends StatelessWidget {
  const AllCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.getMyCart(),
      viewModelBuilder: () => AllCartViewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text2(
              text: 'My Cart',
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final cart = viewModel.myCart[index];
              return ListTile(
                leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCartView(
                              cartItem: cart,
                            ),
                          ));
                    },
                    icon: Icon(Icons.edit)),
                title: Text2(
                  text: cart.itemName,
                ),
                subtitle: Text3(
                  text: cart.timestamp.toDate().toString(),
                ),
                trailing: IconButton(
                  onPressed: () {
                    viewModel.deleteCart(context, cart.orderId);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            },
            itemCount: viewModel.myCart.length,
          ),
        );
      },
    );
  }
}
