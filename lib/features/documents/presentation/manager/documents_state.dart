import 'package:metw_go/features/profile/data/models/profile_out_model/profile_out_model.dart';

abstract class DocumentsState {}

class DocumentsInitialState extends DocumentsState {}

class PickDocumentImageLoading extends DocumentsState {}

class PickDocumentImageSuccess extends DocumentsState {}

class UpdateDocumentsLoading extends DocumentsState {}

class UpdateDocumentsSuccess extends DocumentsState {
  final ProfileOutModel profileOutModel;
  UpdateDocumentsSuccess(this.profileOutModel);
}

class UpdateDocumentsFailure extends DocumentsState {
  final String message;
  UpdateDocumentsFailure(this.message);
}
