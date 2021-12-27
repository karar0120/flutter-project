abstract class stateApp{}

class initialState extends stateApp{}


class NewsButtonNavstate extends stateApp{}


class NewsBusinessdata extends stateApp{}

class NewsBusinessError extends stateApp{
  final String error;
  NewsBusinessError(this.error);
}
class NewsBusinessloading extends stateApp{
}
class NewsSportssdata extends stateApp{}

class NewsSportsError extends stateApp{
  final String error;
  NewsSportsError(this.error);
}
class NewsSportsloading extends stateApp{
}


class Newsscsdata extends stateApp{}

class NewsscError extends stateApp{
  final String error;
  NewsscError(this.error);
}
class Newsscloading extends stateApp{
}

class Newssearchdata extends stateApp{}

class NewssearchError extends stateApp{
  final String error;
  NewssearchError(this.error);
}
class Newssearchloading extends stateApp{
}