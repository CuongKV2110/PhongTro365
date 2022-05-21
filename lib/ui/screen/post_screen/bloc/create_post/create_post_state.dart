import 'package:flutter/material.dart';

@immutable
abstract class CreatePostState {}

class CreatePostInitial extends CreatePostState {}

class CreatePostProcessing extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {}

class CreatePostError extends CreatePostState {}
