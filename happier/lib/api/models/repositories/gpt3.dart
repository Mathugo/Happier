import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class OpenAI {
  String apiKey;
  OpenAI({required this.apiKey});

  Future<String> answer(String question) async {
    String apiKey = this.apiKey;
    final DataRequest = {
      "prompt":
          "The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly.\n\nHuman: Hello, who are you?\nAI: I am an AI created by OpenAI. How can I help you today?\nHuman: " +
              question,
      "temperature": 0.9,
      "max_tokens": 150,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0.6,
      "stop": ["\n", " Human:", " AI:"],
    };

/*
curl https://api.openai.com/v1/engines/davinci/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
  "prompt": "The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly.\n\nHuman: Hello, who are you?\nAI: I am an AI created by OpenAI. How can I help you today?\nHuman: ",
  "temperature": 0.9,
  "max_tokens": 150,
  "top_p": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0.6,
  "stop": ["\n", " Human:", " AI:"]
}'
*/

    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/answers'),
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $apiKey",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: {
        "prompt":
            "The following is a conversation with an AI assistant. The assistant is helpful, creative, clever, and very friendly.\n\nHuman: Hello, who are you?\nAI: I am an AI created by OpenAI. How can I help you today?\nHuman: " +
                question,
        "temperature": 0.9,
        "max_tokens": 150,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0.6,
        "stop": ["\n", " Human:", " AI:"],
      },
    ).timeout(const Duration(seconds: 120));

    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> resp = map["answers"];
    return resp[0];
  }
}
