Checkout the branch of [#853](https://github.com/lihaoyi/Ammonite/pull/853),
```
$ git clone https://github.com/alexarchambault/Ammonite.git -b topic/optim
$ cd Ammonite
```

Publish it locally, along with one of its intermediary commit,
```
$ git checkout 9a47943a
$ mill '__[2.12.6].publishLocal'
$ git checkout 84d48542
$ rm -rf out # just in case
$ mill '__[2.12.6].publishLocal'
```

(If you are using mill 0.2.4, you may need to change `Some(mapDependencies)` in `build.sc` to `Some(mapDependencies())`.)

Clone this repository with
```
$ cd ..
$ git clone https://github.com/alexarchambault/ammonite-benchmark
$ cd ammonite-benchmark
```

Run the main benchmarks with
```
$ rm -rf results # wipe previous results
$ ./run.sh default
$ ./run.sh ammonite-tty-optim
$ ./run.sh ammonite-optim
```

(paste the text that `run.sh` puts in the clipboard, as the instructions should say)

Plot the results with
```
$ ./plot.sh
```
(should open a browser tab with a box plot)
