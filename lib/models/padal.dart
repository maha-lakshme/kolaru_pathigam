class PadalList {
  String padalName;
  String padalVarigal;
  String padalAssetName;
  bool isPlaying;
  PadalList(
      {required this.padalName,
      required this.padalVarigal,
      required this.padalAssetName,
      this.isPlaying = false});
}