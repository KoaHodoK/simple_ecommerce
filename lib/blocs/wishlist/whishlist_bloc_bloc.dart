import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/models/wish_list_model.dart';
import 'package:equatable/equatable.dart';

part 'whishlist_bloc_event.dart';
part 'whishlist_bloc_state.dart';

class WhishlistBlocBloc extends Bloc<WhishlistBlocEvent, WhishlistBlocState> {
  WhishlistBlocBloc() : super(WhishlistLoading());
  @override
  Stream<WhishlistBlocState> mapEventToState(WhishlistBlocEvent event) async* {
    if (event is StarWishList) {
      yield* _mapStartWishListToState();
    } else if (event is AddWishList) {
      yield* _mapAddWishListToState(event, state);
    } else if (event is RemoveWishList) {
      yield* _mapRemoveWishListToState(event, state);
    }
  }

  Stream<WhishlistBlocState> _mapStartWishListToState() async* {
    yield WhishlistLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield const WhishlistLoaded();
    } catch (_) {}
  }

  Stream<WhishlistBlocState> _mapAddWishListToState(
      AddWishList event, WhishlistBlocState state) async* {
    if (state is WhishlistLoaded) {
      try {
        yield WhishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<WhishlistBlocState> _mapRemoveWishListToState(
      RemoveWishList event, WhishlistBlocState state) async* {
    if (state is WhishlistLoaded) {
      try {
        yield WhishlistLoaded(
            wishList: WishList(
                products: List.from(state.wishList.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
