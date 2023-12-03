class Loading {
  Loading({
    this.loading,
  });

  List<LoadingElement?>? loading;

  factory Loading.fromJson(Map<String, dynamic> json) => Loading(
        loading: json["loading"] == null
            ? null
            : List<LoadingElement>.from(
                json["loading"].map((x) => LoadingElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "loading": List<dynamic>.from(loading!.map((x) => x?.toJson())),
      };
}

class LoadingElement {
  LoadingElement({
    this.height,
    this.width,
  });

  final int? height;
  final int? width;

  factory LoadingElement.fromJson(Map<String, dynamic> json) => LoadingElement(
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
      };
}
