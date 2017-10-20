library {{ project_name }}.src.auth.local;

import 'dart:async';
import 'package:angel_auth/angel_auth.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:collection/collection.dart';
import '{{ model_path }}';

/// Configures the server to perform username+password authentication.
AngelConfigurer configureServer(AngelAuth<{{ model }}> auth, List<int> computePassword(String {{ password_field }}, {{ model }} user)) {
  return (Angel app) async {
    var strategy = new LocalAuthStrategy((username, {{ password_field }}) async {
      var userService = app.service('{{ service }}');
      Iterable<{{ model }}> users = await userService.index({
        'query': {
          'username': username,
        },
      }).then((it) => it.map({{ model }}.parse));
      
      if (existing.isEmpty)
        return null;
        
      var user = users.first;
      var hash = computePassword({{ password_field }}, user);
      
      if (!(const ListEquality().equals(hash, user.{{ password_field }})))
        return null;
        
      return user;
    });
  };
}
