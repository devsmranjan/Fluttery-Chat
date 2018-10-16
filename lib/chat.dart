import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'message.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> with TickerProviderStateMixin {
  final List<Message> _messages = <Message>[];
  final TextEditingController _textController = TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(
              color: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.black
                  : Colors.white),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
        centerTitle: true,
      ),
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Flexible(
            child: ListView.builder(
          itemBuilder: (context, index) => _messages[index],
          itemCount: _messages.length,
          reverse: true,
          padding: EdgeInsets.all(8.0),
        )),
        Divider(),
        Container(
          child: _buildComposer(),
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
        )
      ],
    );
  }

  Widget _buildComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                  child: TextField(
                controller: _textController,
                onChanged: (value) {
                  setState(() {
                    _isWriting = value.length > 0;
                  });
                },
                onSubmitted: _submitMessage,
                decoration:
                    InputDecoration.collapsed(hintText: "Enter your message"),
              )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? CupertinoButton(
                        child: Text("Submit"),
                        onPressed: _isWriting
                            ? () => _submitMessage(_textController.text)
                            : null)
                    : IconButton(
                        icon: Icon(Icons.message),
                        onPressed: _isWriting
                            ? () => _submitMessage(_textController.text)
                            : null),
              )
            ],
          ),
        ));
  }

  void _submitMessage(String text) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
    Message message = Message(
      text: text,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 800)),
    );

    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (Message message in _messages) {
      message.animationController.dispose();
    }

    _textController.dispose();
    super.dispose();
  }
}
