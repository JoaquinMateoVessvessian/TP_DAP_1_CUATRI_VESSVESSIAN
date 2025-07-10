import 'package:app1/entities/groceries.dart';
import 'package:app1/entities/usuarios.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends StateNotifier<List<Usuarios>> {
  UserNotifier() : super([
          Usuarios(
            name: 'octa',
            username: 'octa2',
            password: '2934',
            mail: 'octavianito'
          ),
          Usuarios(
            name: 'octa2',
            username: 'octa',
            password: '2934',
            mail: 'octavianito2'
          ),
  ]);
}

final userProvider =
    StateNotifierProvider<UserNotifier, List<Usuarios>>(
        (ref) => UserNotifier());

class GroceriesNotifier extends StateNotifier<List<Groceries>> {
  GroceriesNotifier()
      : super([
          Groceries(title: 'Carrot',photo: 'https://www.shutterstock.com/image-photo/fresh-carrot-isolated-on-white-260nw-2535865843.jpg',description: 'A crunchy, sweet, orange root rich in vitamin A.'),
          Groceries(title: 'Potato',photo: 'https://www.superaki.mx/cdn/shop/products/0000000000147_300x300.png?v=1634911468',description:'Starchy, edible tuber with thin or thick skin and white or yellow flesh.'),
          Groceries(title: 'Lettuce',photo: 'https://media.istockphoto.com/id/96891608/es/foto/lechuga-repollo.jpg?s=612x612&w=0&k=20&c=TRoTHmY6zDAkTCvq2Vmz-1mv0imZ0gfTd_Df7s0NUS8=',description:'A leafy green vegetable, crisp and mild in flavor, commonly used in salads'),
          Groceries(title: 'Apple', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtkzZMTh_n9DE3CznuCnA8wVdQI7IQT9sDng&s', description:'A sweet, crisp fruit with smooth skin, available in various colors like red, green, and yellow.'),
          Groceries(title: 'Orange',photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZbB_doR9LVg_xVbDXOOZc3TNbgNCEIzLLKw&s',description:'A juicy, sweet citrus fruit with a bright orange peel and high vitamin C content.'),
          Groceries(title: 'Tomato',photo:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpTX80L1o0BjWIj5axuzobiYhPRoj5zdaUwA&s',description:'A soft, juicy fruit often red, used as a vegetable in cooking, with a slightly sweet and tangy flavor.'),
        ]);
}

final groceriesProvider =
    StateNotifierProvider<GroceriesNotifier, List<Groceries>>(
        (ref) => GroceriesNotifier());

class DetailNotifier extends StateNotifier<Groceries?> {
DetailNotifier() : super(null);

  void setDetail(Groceries grocery) {
    state = grocery;
  }

  void clearDetail() {
    state = null;
  }
}

final detailProvider =
StateNotifierProvider<DetailNotifier, Groceries?>(
(ref) => DetailNotifier(

));
