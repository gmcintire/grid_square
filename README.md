# GridSquare

Calculate between GridSquare references and latitude/longitude.

```
grid = GridSquare.new "DN40bi"

grid.center
# => #<Location:0x000001008514d8 @longitude=-109.20833333333333, @latitude=41.6875>

grid.width
# => 0.08333333333333333

grid.height
# => 0.041666666666666664

GridSquare.encode(-111.866785, 40.363840).subsquare
# => "DN40bi"

# With arbitrary precision: specify the number of fields
GridSquare.encode(-111.866785, 40.363840, 10).grid_reference
# => "DN40BI57XH67OE24bd98"
```


# How the US GridSquare System Works

Okay in theory the GridSquare system is really complicated. But in
practice is just base conversion to a number that has a changing
radix. The first pair of digits are base 18, and the following pairs
alternate between base 10 and base 24.

Here's how it works:

The first two letters of a grid reference express the longitude and
latitude in base 18 (A through R). This pair of letters divides up the
whole planet into 18 equal "fields", each field being 10 degrees high
(latitude) and 20 degrees wide (longitude).

The next two digits are decimals that divide up each field into 10x10
"squares" (that's their name; they're obviously not square or even
rectangular). Squares are 2 degrees wide and 1 degree tall.

The next two letters are base 24 (A through X) and divide each square
into 24x24 "subsquares". Each subsquare is 5 minutes wide and 2.5
minutes tall.

The next two digits are decimals. The official spec calls this the
"extended subsquare".

Officially the locator system stops at extended subsquares (8 digits)
but unofficially it can be extended by repeating the base 10, base 24
pairs indefinitely to give precision to the subatomic level and
beyond. This is of course quite silly as the whole system is based on
the notion of a spherical earth and the point of the system is to
economically tell a complete stranger approximately where in the world
the person they are talking to is located.

By convention, the code is capitalized except for the last 2 letters,
though the first two characters are always capitalized.


# Who Uses this Crap?

Ham Radio operators use them to quickly exchange approximate location.
By convention, shortwave operators give their location in squares
while VHF and UHF operators give their location in subsquares. A
square has a precision of about 280km; subsquares give a location to
within 12km.


# Really?

Yes. It even has an amusing name, the Maidenhead Locator System:
http://en.wikipedia.org/wiki/Maidenhead_Locator_System
