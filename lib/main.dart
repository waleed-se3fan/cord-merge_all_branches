import 'package:cord_2/app/audio/cubit/audio_cubit.dart';
import 'package:cord_2/app/chat_details/cubit/chat_details_cubit.dart';
import 'package:cord_2/app/contacts/cubit/contact_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'app/chat/cubit/chat_cubit.dart';
import 'core/utils/bloc_observer.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(create: (BuildContext context)=> ChatCubit()),
        BlocProvider<ContactCubit>(create: (BuildContext context)=> ContactCubit()),
        BlocProvider<ChatDetailsCubit>(create: (BuildContext context)=> ChatDetailsCubit()),
        BlocProvider<AudioCubit>(create: (BuildContext context)=> AudioCubit()),
      ],
      child: const CordApp(),
  ));
}
