import '../abstract/i_result.dart';

class Result implements IResult{
  late final bool _success;
  late String _message;
  @override
  String get message => _message;

  @override
  bool get success => _success;

  Result(this._success);
  Result.withMessage(this._success, this._message);

}
