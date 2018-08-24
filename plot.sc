
import $ivy.`org.plotly-scala::plotly-render:0.4.0`
import plotly._, element._, layout._, Plotly._

val names = Seq(
  "default",
  "ammonite-current",
  "ammonite-tty-optim",
  "ammonite-optim",
  "ammonite-optim-cheap-pprint"
)

val traces = names.flatMap { name =>
  val f = java.nio.file.Paths.get(s"$name.csv")
  if (java.nio.file.Files.isRegularFile(f)) {
    val values = new String(
      java.nio.file.Files.readAllBytes(f),
      "UTF-8"
    )
      .lines
      .filter(_.nonEmpty)
      .map(_.toDouble)
      .toVector

    Seq(Box(x = values, name = name))
  } else
    Nil
}

traces.reverse.plot()
