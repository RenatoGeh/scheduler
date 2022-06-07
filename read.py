
class Subject:
  def __init__(self, code: str, freq: str, double: bool, prof: list):
    self.code = code
    self.prof = prof
    self.freq = freq
    self.double = double
    self.undergrad = self.code[3] == '0'

def read(file: str) -> tuple[list, list]:
  L = []
  S = set()
  with open(file) as F:
    for l in F:
      T = l.lower().split()
      P = T[3:]
      for p in P: S.add(p)
      L.append(Subject(T[0], T[1], T[2] != "0", P))
  return L, S

preamble = """
% Time slots
slot(h8).  % 08h00 - 09h40
slot(h10). % 10h00 - 11h40
slot(h14). % 14h00 - 15h40
slot(h16). % 16h00 - 17h40

next(h8, h10).
next(h14, h16).
prev(h16, h14).
prev(h10, h8).

% Morning or afternoon classes
morning(h8; h10).
afternoon(h14; h16).

% Week days
day(mon).
day(tue).
day(wed).
day(thu).
day(fri).
day(mon, 2).
day(tue, 3).
day(wed, 4).
day(thu, 5).
day(fri, 6).

"""

def write(L: list, P: list, out:str):
  with open(out, "w") as F:
    F.write(preamble)
    F.write("% Professors\n\n")
    for p in P:
      F.write(f"prof({p}).\n")
    F.write("\n")
    F.write("% Subjects\n\n")
    for l in L:
      F.write(f"subject({l.code}).\n")
      F.write(f"freq({l.code}, {l.freq}).\n")
      for p in l.prof: F.write(f"lectures({p}, {l.code}).\n")
      if l.undergrad: F.write(f"undergrad({l.code}).\n")
      if l.double: F.write(f"double({l.code}).\n")
      F.write("\n")

def main():
  L, P = read("data.dat")
  write(L, P, "example.lp")

if __name__ == "__main__": main()
