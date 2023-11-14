Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.! !

!Wielokat methodsFor: 'accessing'!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !

!Wielokat methodsFor: 'displaying'!

drukuj
  "drukuje nazwe wielokata i jego wierzcholkow"
  Transcript cr;
	show: 'Wierzcholki wielokata to: ';
	cr.
	1 to: wierzcholki size do: 
    [:i |
        Transcript show: ((wierzcholki at: i) roundTo: 0.0001) printString;cr.
    ].! !



Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'displaying'!

drukuj
  "drukuje nazwe wielokata i jego wierzcholkow"

  super drukuj.
  Transcript cr;
	show: 'Pole kwadratu to: ';
  show: self pole printString.
  ! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.! !

Wielokat subclass: #Szesciokat
    instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Szesciokat methodsFor: 'initialize-release'!

initialize: bok
    super initialize: 6 name: 'Szesciokat'.
    "dziala ale uwaga na kazdy nawias kazdy jest niezbedny"
    "nie wiem czy da sie to jakos petla zrobic"
    wierzcholki at: 2 put: (bok * 2)  @ 0.
    wierzcholki at: 3 put: (bok / 2) @ (((3 sqrt) / 2) * bok).
    wierzcholki at: 4 put: ((bok * 3) / 2) @ (((3 sqrt) / 2) * bok).
    wierzcholki at: 5 put: (bok / 2) @ ((((3 sqrt) / 2) * -1) * bok).
    wierzcholki at: 6 put: ((bok * 3) / 2) @ ((((3 sqrt) / 2) * -1) * bok).
! !

!Szesciokat methodsFor: 'actions'!

pole
    | bok wynik |
    bok := (((wierzcholki at: 4) x) abs) - (((wierzcholki at: 3) x) abs).
    wynik := (((bok squared) * (3 sqrt) * 3) / 2).
    ^wynik.! !


!Szesciokat methodsFor: 'displaying'!

drukuj
  "drukuje nazwe wielokata i jego wierzcholkow"

  super drukuj.
  Transcript cr;
	show: 'Pole szesciokata to: ';
  show: self pole printString.
  ! !
