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


To run the benchmark with the current master of Ammonite (commit `53edc31`),
do
```
$ ./run.sh ammonite-current
```
Instead of simply pasting the code that `run.sh` puts in the clipboard,
paste it in a text editor, then feed it 10~20 lines at a time to Ammonite.
Apart from the very first and very last lines, it mostly consists of the
same block of code, repeated multiple times, so it should be easy to simply
paste that code multiple times in a row.
Just pay attention to paste at the same time entire blocks whose duration
matters (the `val start = …` line and its subsequent `val end = …` line should
be pasted at the same time).
