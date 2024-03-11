import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuforce/app/model/agents_model.dart';
import 'package:nuforce/app/model/line_item_model.dart';
import 'package:nuforce/app/shared/functions/image_picker_func.dart';
import 'package:nuforce/app/utils/colors.dart';

class InvoiceController extends GetxController {
  XFile? _image;
  XFile? get image => _image;
  Future<void> setImage() async {
    _image = await pickImage(ImageSource.gallery);
    update();
  }

  DateTime? _invDate;
  DateTime? get invDate => _invDate;
  void updateInvDate(DateTime? date) {
    _invDate = date;
    update();
  }

  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  void updateExpireDate(DateTime? date) {
    _expireDate = date;
    update();
  }

  List<Agent> get agents => _agents;
  final List<Agent> _agents = const [
    Agent(
      id: 1,
      name: 'Agent 1',
      image: 'assets/images/agents/agent1.png',
      status: 'Away(10 min ago)',
      color: AppColors.agentCardBg1,
    ),
    Agent(
      id: 2,
      name: 'Agent 2',
      image: 'assets/images/agents/agent2.png',
      status: 'Not Available',
      color: AppColors.agentCardBg2,
    ),
    Agent(
      id: 3,
      name: 'Agent 3',
      image: 'assets/images/agents/agent3.png',
      status: 'Active',
      color: AppColors.agentCardBg1,
    ),
    Agent(
      id: 4,
      name: 'Agent 4',
      image: 'assets/images/agents/agent4.png',
      status: 'Not Available',
      color: AppColors.agentCardBg2,
    ),
    Agent(
      id: 5,
      name: 'Agent 5',
      image: 'assets/images/agents/agent5.png',
      status: 'Not Available',
      color: AppColors.agentCardBg1,
    ),
  ];

  Agent? _selectedAgent;

  Agent? get selectedAgent => _selectedAgent;

  void updateSelectedAgent(Agent agent) {
    _selectedAgent = agent;
    update();
  }

  List<LineItem> get lineItems => _lineItems;
  final List<LineItem> _lineItems = const <LineItem>[];
}
