
import 'package:recpie/modal/shopApp/favorites_modal.dart';

abstract class LayoutStates{}


class initialState extends LayoutStates{}


class ChangeNaveButton extends LayoutStates{}


class HomeloadingState extends LayoutStates{}

class HomeEnterState extends LayoutStates{}

class HomeErorrState extends LayoutStates{}

class categoriesEnterState extends LayoutStates{}

class categoriesErorrState extends LayoutStates{}

class favoritesEnterState extends LayoutStates{}

class favoritesEnterStatessss extends LayoutStates{
   final favoritesmodal modass;
   favoritesEnterStatessss(this.modass);
}

class favoritesErorrState extends LayoutStates{}

class FavssErorrState extends LayoutStates{}

class FavssEnterState extends LayoutStates{}

class FavloadingState extends LayoutStates{}

class ProloadingState extends LayoutStates{}

class ProEnterState extends LayoutStates{}

class ProErorrState extends LayoutStates{}

class updloadingState extends LayoutStates{}

class updEnterState extends LayoutStates{}

class updErorrState extends LayoutStates{}
