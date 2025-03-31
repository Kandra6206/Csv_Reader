import csv_reader
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  1
  |> should.equal(1)
}

pub fn read_csv_test() {
  "./text.csv"
  |> csv_reader.csv_from_file
  |> should.equal(
    csv_reader.Csv(["This", "is", "a", "Test!"], [["12", "21421", "adw", "ahe"]]),
  )
}
