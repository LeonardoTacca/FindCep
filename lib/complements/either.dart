//classe estraida do pacote Dartz
abstract class Either<A, B> {
  const Either();

  factory Either.left(A value) = Left<A, B>;

  factory Either.right(B value) = Right<A, B>;

  bool get isLeft;

  bool get isRight;

  A get leftValue;

  B get rightValue;

  Either<C, B> mapLeft<C>(C Function(A) f);

  Either<A, C> map<C>(C Function(B) f);

  Either<C, D> bimap<C, D>(C Function(A) f, D Function(B) g);

  Either<A, B> operator |(Either<A, B> other);

  C fold<C>(C Function(A) ifLeft, C Function(B) ifRight);

  Either<A, C> flatMap<C>(Either<A, C> Function(B) f);

  Either<B, A> swap();

  Either<A, B> filter(bool Function(B) predicate, {A Function() ifLeft});
}

class Left<A, B> extends Either<A, B> {
  final A? value;

  const Left(this.value);

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;

  @override
  A get leftValue => value!;

  @override
  B get rightValue {
    throw StateError('Either.rightValue chamado em um valor Left');
  }

  @override
  Either<C, B> mapLeft<C>(C Function(A) f) => Left(f(value as A));

  @override
  Either<A, C> map<C>(C Function(B) f) => Left(value);

  @override
  Either<C, D> bimap<C, D>(C Function(A) f, D Function(B) g) => Left(f(value as A));

  @override
  Either<A, B> operator |(Either<A, B> other) => other;

  @override
  C fold<C>(C Function(A) ifLeft, C Function(B) ifRight) => ifLeft(value as A);

  @override
  Either<A, C> flatMap<C>(Either<A, C> Function(B) f) => Left(value);

  @override
  Either<B, A> swap() => Right(value as A);

  @override
  Either<A, B> filter(bool Function(B) predicate, {A Function()? ifLeft}) {
    if (ifLeft != null) return Left(ifLeft());
    return this;
  }
}

class Right<A, B> extends Either<A, B> {
  final B value;

  const Right(this.value);

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;

  @override
  A get leftValue {
    throw StateError('Either.leftValue chamado em um valor Right');
  }

  @override
  B get rightValue => value;

  @override
  Either<C, B> mapLeft<C>(C Function(A) f) => Right(value);

  @override
  Either<A, C> map<C>(C Function(B) f) => Right(f(value));

  @override
  Either<C, D> bimap<C, D>(C Function(A) f, D Function(B) g) => Right(g(value));

  @override
  Either<A, B> operator |(Either<A, B> other) => this;

  @override
  C fold<C>(C Function(A) ifLeft, C Function(B) ifRight) => ifRight(value);

  @override
  Either<A, C> flatMap<C>(Either<A, C> Function(B) f) => f(value);

  @override
  Either<B, A> swap() => Left(value);

  @override
  Either<A, B> filter(bool Function(B) predicate, {A Function()? ifLeft}) {
    if (predicate(value)) return this;
    if (ifLeft != null) return Left(ifLeft());
    return const Left(null);
  }
}
