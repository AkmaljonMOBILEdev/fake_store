import 'package:fake_store/cubits/cart/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showConfirmDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure to delete all items in Cart?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              context.read<CartCubit>().deleteAll();
              Navigator.of(context).pop();
            },
            child: Text(
              'Yes',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.red, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      );
    },
  );
}
