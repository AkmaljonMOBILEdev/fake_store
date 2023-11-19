import 'package:fake_store/data/models/data.dart';
import 'package:fake_store/data/network/api_service.dart';
import 'package:fake_store/services/service_locator/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/local/shared_pref/storage_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(
      BuildContext context, String username, String password) async {
    print("EEE: $username, $password");
    emit(LoginLoading());
    if (username.isNotEmpty && password.isNotEmpty) {
      UniversalData token = await getIt
          .get<ApiService>()
          .loginUser(username: username, password: password);
      StorageRepository.putString("isLogged", token.data.toString());
      emit(LoginLogged());
    }else{
      emit(LoginError());
    }
  }
}
