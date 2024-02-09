import 'package:flutter/material.dart';
import 'package:nuforce/app/shared/widgets/custom_appbar_minimal.dart';

class CreateInvoiceView extends StatefulWidget {
  const CreateInvoiceView({super.key});

  @override
  State<CreateInvoiceView> createState() => _CreateInvoiceViewState();
}

class _CreateInvoiceViewState extends State<CreateInvoiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarMinimal(
        title: 'Invoice #0022',
        trailing: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Create Invoice'),
        ),
      ),
    );
  }
}
