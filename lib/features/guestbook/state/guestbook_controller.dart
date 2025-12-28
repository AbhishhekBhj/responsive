import 'package:flutter_riverpod/flutter_riverpod.dart';

enum GuestbookTab { profile, reservation, payment, feedback, orderHistory }
enum GuestSort { none, nameAsc, nameDesc }
class Guest {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String? image;

  const Guest({
    required this.id,
    this.image,
    required this.name,
    required this.phone,
    required this.email,
  });
}

class GuestbookState {
  final bool isGuestListVisible;
  final GuestbookTab selectedTab;
  final List<Guest> guests;
  final Guest? selectedGuest;
   final GuestSort sort;

  const GuestbookState({
    required this.isGuestListVisible,
    required this.selectedTab,
    required this.guests,
    required this.selectedGuest,
    required this.sort,
  });

  GuestbookState copyWith({
    bool? isGuestListVisible,
    GuestbookTab? selectedTab,
    List<Guest>? guests,
    Guest? selectedGuest,
     GuestSort? sort,
  }) {
    return GuestbookState(
      isGuestListVisible: isGuestListVisible ?? this.isGuestListVisible,
      selectedTab: selectedTab ?? this.selectedTab,
      guests: guests ?? this.guests,
      selectedGuest: selectedGuest ?? this.selectedGuest,
      sort: sort ?? this.sort,
    );
  }
}

class GuestbookController extends Notifier<GuestbookState> {
  @override
  GuestbookState build() {
   const guests = [
  Guest(
    id: '1',
    name: 'Lia Thomas',
    phone: '+1 212-456-7890',
    email: 'lia.thomas516@reddit.com',
    image: "assets/images/lia.png",
  ),
  Guest(
    id: '2',
    name: 'Bergnaum',
    phone: '+1 212-450-7890',
    email: 'cleorahills@gmail.com',
    image: "assets/images/berg.png",
  ),
  Guest(
    id: '3',
    name: 'Wunderlich',
    phone: '+1 212-236-7890',
    email: 'wunder@gmail.com',
    image: "assets/images/wunder.png",
  ),
  Guest(
    id: '4',
    name: 'Arjun Gerhold',
    phone: '+1 122-456-7890',
    email: 'alaskanm@dog.com',
  ),
  Guest(
    id: '5',
    name: 'Simeon Wilderman',
    phone: '+1 287-456-7890',
    email: 'simeon@user.com',
  ),
  Guest(
    id: '6',
    name: 'Eden Kautzer',
    phone: '+1 212-456-7090',
    email: 'edenka@user.com',
    image: "assets/images/eden.png",
  ),
  Guest(
    id: '7',
    name: 'Gino Yost',
    phone: '+1 222-456-7890',
    email: 'gyost@test.com',
    image: "assets/images/gino.png",
  ),
  Guest(
    id: '8',
    name: 'Ayden Veum',
    phone: '+1 222-456-7890',
    email: 'ayden@user.com',
  ),
];


    return GuestbookState(
      isGuestListVisible: true,
      selectedTab: GuestbookTab.profile,
      guests: guests,
      selectedGuest: guests.first,
      sort: GuestSort.none,
    );
  }

  void hideGuestList() {
    if (!state.isGuestListVisible) return;
    state = state.copyWith(isGuestListVisible: false);
  }

  void showGuestList() {
    if (state.isGuestListVisible) return;
    state = state.copyWith(isGuestListVisible: true);
  }

  void toggleGuestList() {
    state = state.copyWith(isGuestListVisible: !state.isGuestListVisible);
  }

  void selectTab(GuestbookTab tab) {
    state = state.copyWith(selectedTab: tab);
  }

  void selectGuest(Guest guest) {
    state = state.copyWith(selectedGuest: guest);
  }

  void selectGuestById(String id) {
    for (final g in state.guests) {
      if (g.id == id) {
        state = state.copyWith(selectedGuest: g);
        return;
      }
    }
  }
  void toggleSortByName() {
  final next = switch (state.sort) {
    GuestSort.none => GuestSort.nameAsc,
    GuestSort.nameAsc => GuestSort.nameDesc,
    GuestSort.nameDesc => GuestSort.nameAsc,
  };

  final sorted = [...state.guests];
  sorted.sort((a, b) {
    final an = a.name.toLowerCase();
    final bn = b.name.toLowerCase();
    final cmp = an.compareTo(bn);
    return next == GuestSort.nameAsc ? cmp : -cmp;
  });

  // Keep selection stable by id
  final selectedId = state.selectedGuest?.id;
  Guest? selected;
  if (selectedId != null) {
    for (final g in sorted) {
      if (g.id == selectedId) {
        selected = g;
        break;
      }
    }
  }

  state = state.copyWith(
    sort: next,
    guests: sorted,
    selectedGuest: selected ?? state.selectedGuest,
  );
}

}


final guestbookControllerProvider =
    NotifierProvider<GuestbookController, GuestbookState>(
  GuestbookController.new,
);
