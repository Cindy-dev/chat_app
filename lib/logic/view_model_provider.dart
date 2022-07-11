import 'package:chat_app/logic/view_model/login_vm.dart';
import 'package:chat_app/logic/view_model/message_vm.dart';
import 'package:chat_app/logic/view_model/signup_vm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginVM = ChangeNotifierProvider((_) => LoginVm());
final signupVM = ChangeNotifierProvider((_) => SignupVM());
final messageVM = ChangeNotifierProvider((_) => MessageVM());