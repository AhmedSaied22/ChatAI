part of 'chat_bloc_bloc.dart';

@immutable
sealed class ChatBlocState {}

final class ChatBlocInitial extends ChatBlocState {}

final class ChatSuccessState extends ChatBlocState {
  final List<ChatModel> messages;

  ChatSuccessState({required this.messages});
}
