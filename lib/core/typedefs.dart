typedef ReelID = String;

typedef VideoPlayFunction = Future<void> Function();
typedef VideoPauseFunction = Future<void> Function();
typedef VideoSeekFunction = Future<void> Function(Duration position);
