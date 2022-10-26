import 'package:equatable/equatable.dart';

class TreeTestModel extends Equatable {
  final int id;
  final String title;
  final List<TreeTestModel> children;
  const TreeTestModel({
    required this.id,
    required this.title,
    required this.children,
  });

  @override
  List<Object?> get props => [id, title, children];
}
