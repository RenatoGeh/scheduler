import sys

preamble = """
<html>
<style>
table, th, td {
  border:1px solid black;
}
</style>
<table>
  <tr>
    <th>Schedule</th>
    <th>Monday</th>
    <th>Tuesday</th>
    <th>Wednesday</th>
    <th>Thursday</th>
    <th>Friday</th>
  </tr>
"""

postamble = """
</table>
</html>
"""

DAYS = {"mon": 0, "tue": 1, "wed": 2, "thu": 3, "fri": 4}
HOURS = {"h8": 0, "h10": 1, "h12": 2, "h14": 3, "h16": 4}
HOURS_H = ["08h00", "10h00", "12h00", "14h00", "16h00"]

class Table:
  def __init__(self, T: list):
    self.M = {(d, h): [] for d in DAYS for h in HOURS}
    for t in T:
      k = (t[2], t[1])
      self.M[k].append(t[0])

def draw(T: Table, filename: str):
  with open(filename, "w") as out:
    out.write(preamble)

    for h in HOURS:
      out.write(f"  <tr>\n    <td>{HOURS_H[HOURS[h]]}</td>\n")
      for d in DAYS:
        out.write("    <td>\n")
        for s in T.M[(d, h)]:
          out.write(f"      {s.upper()}<br>\n")
        out.write("    </td>\n")
      out.write("  </tr>\n")

    out.write(postamble)

def main():
  L = sys.argv[1:]
  T = [l[3:-1].split(sep=',') for l in L]
  draw(Table(T), "/tmp/out.html")

if __name__ == "__main__": main()
