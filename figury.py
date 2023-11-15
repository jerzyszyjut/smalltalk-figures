from math import sqrt, cos, sin, pi

class Wielokat:
  wiercholki: list[tuple[float, float]]
  nazwa: str

  def __init__(self, liczbaWierzcholkow, nowaNazwa: str):
    self.nazwa = nowaNazwa
    self.wierzcholki = [(0.0, 0.0)] * liczbaWierzcholkow

  def drukuj(self):
    print("Nazwa figury: ")
    print(self.nazwa)
    print("Wierzcholki wielokata to: ")
    for wierzcholek in self.wierzcholki:
      print(round(wierzcholek[0], 4), round(wierzcholek[1], 4))

class Szesciokat(Wielokat):
  bok: float
  srodek: tuple[float, float]

  def __init__(self, bok: float):
    super().__init__(6, "Szesciokat")
    self.bok = bok
    self.oblicz_punkty()
  
  def oblicz_punkty(self):
    srodek = (self.wierzcholki[0][0] + self.bok, self.wierzcholki[0][1])

    for i in range(6):
      self.wierzcholki[i] = (srodek[0] + self.bok * cos(i * pi / 3), srodek[1] + self.bok * sin(i * pi / 3))

  @property
  def pole(self):
    return 3 * sqrt(3) * (self.bok ** 2) / 2

  def drukuj(self):
    super().drukuj()
    print("Pole szesciokata to: ")
    print(round(self.pole, 4))

  def wysrodkuj(self):
    srodek = (0, 0)
    self.wierzcholki[0] = (srodek[0] - self.bok, srodek[1])
    self.oblicz_punkty()


a = Szesciokat(2.0)
a.drukuj()
a.wysrodkuj()
a.drukuj()
