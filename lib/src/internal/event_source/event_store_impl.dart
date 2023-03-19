import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core_event_source/event_source.dart';

import '../../../internal.dart';

class EventStoreImpl implements EventStore {
  final FirebaseFirestore firestore;

  EventStoreImpl({required this.firestore});

  @override
  SourceReference<Event> source<Event>(
      {required String path, required JsonEventConverter<Event> reader}) {
    return SourceReferenceImpl(
        firestore: firestore, path: path, eventJsonConverter: reader);
  }
}
