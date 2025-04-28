import 'package:notesappflutter/feature_note/domain/use_case/util/order_type.dart';

sealed class NoteOrder {
  final OrderType orderType;

  const NoteOrder(this.orderType);

  NoteOrder copy(OrderType newOrderType) {
    switch (this) {
      case NoteOrderTitle():
        return NoteOrderTitle(newOrderType);
      case NoteOrderDate():
        return NoteOrderDate(newOrderType);
      case NoteOrderColor():
        return NoteOrderColor(newOrderType);
    }
  }
}

class NoteOrderTitle extends NoteOrder {
  const NoteOrderTitle(super.orderType);
}

class NoteOrderDate extends NoteOrder {
  const NoteOrderDate(super.orderType);
}

class NoteOrderColor extends NoteOrder {
  const NoteOrderColor(super.orderType);
}
