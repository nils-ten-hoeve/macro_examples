// Copyright (c) 2024, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.


import 'package:macro_examples/auto_dispose.dart';

void main() {
  var state = MyState(a: ADisposable(), b: BDisposable(), c: 'hello world');
  state.dispose();
}

@AutoDispose()
class MyState extends State {
  final ADisposable a;
  final ADisposable? a2;
  final BDisposable b;
  final String c;

  MyState({required this.a, this.a2, required this.b, required this.c});

  @override
  String toString() => 'MyState!';
}

class State {
  void dispose() {
    print('disposing of $this');
  }
}

class ADisposable implements Disposable {
  void dispose() {
    print('disposing of ADisposable');
  }
}

class BDisposable implements Disposable {
  void dispose() {
    print('disposing of BDisposable');
  }
}