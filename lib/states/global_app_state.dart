import 'package:scanner_app/states/generate_code_state.dart';

class AppState {
  GenerateCodeState generateCodeState;
  AppState({required this.generateCodeState});
  AppState copyWith({GenerateCodeState? latestGenerateCodeState}) {
    return AppState(
        generateCodeState: latestGenerateCodeState ?? generateCodeState);
  }
}
