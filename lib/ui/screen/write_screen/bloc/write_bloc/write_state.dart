import 'package:phongtro/models/write.dart';

abstract class WriteState {}

class WriteInitial extends WriteState {}

class WriteLoading extends WriteState {}

class WriteLoaded extends WriteState {}

class WriteError extends WriteState {}
