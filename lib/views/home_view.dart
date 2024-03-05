import 'package:chat_ai/bloc/chat_bloc_bloc.dart';
import 'package:chat_ai/models/chat_models.dart';
import 'package:lottie/lottie.dart';
import 'package:chat_ai/widgets/chat_bubble_builder.dart';
import 'package:chat_ai/widgets/custom_app_bar.dart';
import 'package:chat_ai/widgets/custom_text_field.dart';
import 'package:chat_ai/widgets/send_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();
  final ChatBlocBloc chatBloc = ChatBlocBloc();
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBlocBloc, ChatBlocState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatModel> messages = (state as ChatSuccessState).messages;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const CustomAppBar(),
                    Expanded(
                      child: ChatBubbleBuilder(messages: messages),
                    ),
                    if (chatBloc.loading)
                      Lottie.asset(
                        'assets/animations/dpoolLoader.json',
                        height: 100,
                        width: 100,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Expanded(
                          child: CustomTextField(
                            controller: controller,
                            hintText: 'Text',
                            onSubmitted: (data) {
                              _controller.animateTo(
                                _controller.position.maxScrollExtent,
                                duration: Duration(minutes: 1),
                                curve: Curves.bounceInOut,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            if (controller.text.isNotEmpty) {
                              String text = controller.text;
                              controller.clear();
                              chatBloc.add(ChatGenerateNewTextMessageEvent(
                                  inputMessage: text));
                            }
                          },
                          child: const CustomSendIcon(),
                        ),
                      ]),
                    ),
                  ],
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
