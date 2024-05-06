import 'package:chat_ai/bloc/chat_bloc_bloc.dart';
import 'package:chat_ai/models/chat_models.dart';
import 'package:chat_ai/utils/constants.dart';
import 'package:chat_ai/widgets/chat_app_bar.dart';
import 'package:chat_ai/widgets/drawer_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:chat_ai/widgets/chat_bubble_builder.dart';
import 'package:chat_ai/widgets/custom_text_field.dart';
import 'package:chat_ai/widgets/send_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});
  static String id = 'Chat View';

  @override
  State<ChatView> createState() => _ChatViewState();
}

CollectionReference messages =
    FirebaseFirestore.instance.collection(kMessagesCollections);
final Stream<QuerySnapshot> _messagesStream =
    FirebaseFirestore.instance.collection(kMessagesCollections).snapshots();
TextEditingController controller = TextEditingController();

class _ChatViewState extends State<ChatView> {
  TextEditingController controller = TextEditingController();
  final ChatBlocBloc chatBloc = ChatBlocBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer:
          const FractionallySizedBox(widthFactor: 0.5, child: MyDrawer()),
      body: BlocConsumer<ChatBlocBloc, ChatBlocState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatModel> messagesList =
                  (state as ChatSuccessState).messages;
              return PopScope(
                canPop: false,
                onPopInvoked: (didPop) async {},
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: backgroundColorList,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ChatAppBar(),
                              IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: openDrawer,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ChatBubbleBuilder(messages: messagesList),
                          ),
                          if (chatBloc.loading)
                            Lottie.asset(
                              'assets/animations/loader.json',
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
                                ),
                              ),
                              const SizedBox(width: 12),
                              InkWell(
                                onTap: () {
                                  if (controller.text.isNotEmpty) {
                                    String text = controller.text;
                                    controller.clear();
                                    chatBloc.add(
                                        ChatGenerateNewTextMessageEvent(
                                            inputMessage: text));
                                  }
                                },
                                child: const CustomSendIcon(),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
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
