import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub type Record {
  Record(List(String))
}

pub type Csv {
  Csv(headers: List(String), records: List(Record))
}

fn return_entries(file: String) -> List(List(String)) {
  simplifile.read(file)
  |> result.unwrap("")
  |> string.split("\n")
  |> list.map(fn(x) { string.split(x, ",") })
}

fn clean(str: String) -> String {
  let str = case string.starts_with(str, "\"") {
    True -> string.drop_start(str, 1)
    False -> str
  }
  let str = case string.ends_with(str, "\"") {
    True -> string.drop_end(str, 1)
    False -> str
  }
  string.trim(str)
}

fn cleanall(entries: List(List(String))) -> List(List(String)) {
  entries
  |> list.map(fn(x) {
    x
    |> list.map(fn(y) { clean(y) })
  })
}

fn form_csv(entries: List(List(String))) -> Csv {
  let head =
    entries
    |> list.first
    |> result.unwrap([])
  let records =
    entries
    |> list.drop(1)
    |> list.map(fn(x) { Record(x) })
  Csv(head, records)
}

pub fn csv_from_file(str: String) -> Csv {
  return_entries(str)
  |> cleanall
  |> form_csv
}

pub fn main() {
  csv_from_file("./users.csv")
  |> io.debug
}
