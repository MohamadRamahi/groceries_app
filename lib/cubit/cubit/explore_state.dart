import 'package:equatable/equatable.dart';
import 'package:groceries_app/model/product2.dart';

abstract class ExplorerState extends Equatable {
  const ExplorerState();

  @override
  List<Object> get props => [];
}

class ExplorerInitial extends ExplorerState {}

class ExplorerLoaded extends ExplorerState {
  final List<Product2> products;

  const ExplorerLoaded(this.products);

  @override
  List<Object> get props => [products];
}
