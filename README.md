# Counter app State Management Using Riverpod

## Installing Dependencies
add flutter_riverpod in dependencies section of your pubspec.yaml file

add riverpod_generator and build_runner in dev_dependencies of your pubspec.yaml file

add freezed, json_serializable and build_runner to generate the post model

run flutter pub get
create post.dart file containing PostModel class

create posts.dart file containing Posts class extending _$Posts class

run dart run build_runner watch to generate models and providers

create new file named as posts_page.dart file containing the listview to display all fetched posts

