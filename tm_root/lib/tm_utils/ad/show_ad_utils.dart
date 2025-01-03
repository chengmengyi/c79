class ShowAdUtils{
  static final ShowAdUtils _showAdUtils=ShowAdUtils();
  static ShowAdUtils get instance=>_showAdUtils;

  showAd({
    required Function() onClose,
}){
    onClose.call();
  }
}