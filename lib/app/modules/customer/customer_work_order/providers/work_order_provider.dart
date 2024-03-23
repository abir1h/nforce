import 'dart:io';
import 'package:uuid/v4.dart';

class WorkOrderProvider {
  static final workOrderList = <MockWorkOrderModel>[
    MockWorkOrderModel(
      id: 1,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'Eleanor Pena',
      address: '3337 Whispering Pines Circle',
      agentName: 'Jerome Bell',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'General',
      servicePackage: 'Insect Removal',
      priority: Priority.medium,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 2,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 3,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 4,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 5,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 6,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 6,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 7,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 8,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
    MockWorkOrderModel(
      id: 9,
      startDate: DateTime.now(),
      status: WorkOrderStatus.pending,
      contactName: 'John Doe',
      address: '1234 Main St, New York, NY 10030',
      agentName: 'John Doe',
      total: 50000,
      uuid: const UuidV4(),
      orderType: 'One Time',
      servicePackage: 'Basic',
      priority: Priority.low,
      zipCode: '10030',
      cancellationFee: '10',
      partialPayment: '10',
      createdAt: DateTime.now(),
      details: <String>[
        'Payment Details',
        'First Responder',
      ],
      additionalDetailsList: <AdditionalDetails>[
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
        AdditionalDetails(
          title: 'Created work order WOAT351 for Aaron Taylor',
          value: 'Dilruba Khanam Jesey',
          dateTime: DateTime.now(),
        ),
      ],
    ),
  ];
}

class MockWorkOrderModel {
  final int id;
  final DateTime startDate;
  final WorkOrderStatus status;
  final String contactName;
  final String address;
  final String agentName;
  final double total;
  final UuidV4 uuid;
  final String orderType;
  final String servicePackage;
  final Priority priority;
  final String zipCode;
  final String? tax;
  final String? discount;
  final String cancellationFee;
  final String partialPayment;
  final String? notes;
  final DateTime createdAt;
  final File? file;
  final List<String> details;
  final List<AdditionalDetails> additionalDetailsList;

  MockWorkOrderModel({
    required this.id,
    required this.startDate,
    required this.status,
    required this.contactName,
    required this.address,
    required this.agentName,
    required this.total,
    required this.uuid,
    required this.orderType,
    required this.servicePackage,
    required this.priority,
    required this.zipCode,
    required this.cancellationFee,
    required this.partialPayment,
    required this.createdAt,
    required this.details,
    required this.additionalDetailsList,
    this.tax,
    this.discount,
    this.notes,
    this.file,
  });
}

class AdditionalDetails {
  final String title;
  final String value;
  final DateTime dateTime;

  AdditionalDetails({
    required this.title,
    required this.value,
    required this.dateTime,
  });
}

enum WorkOrderStatus { pending, completed, cancelled }

enum Priority { low, medium, high }
