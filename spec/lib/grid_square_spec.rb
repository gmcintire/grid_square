require 'spec_helper'
require_relative "../../lib/grid_square"

describe GridSquare do
  context "created from field" do
    Given(:grid_square) { GridSquare.new "DN" }

    Then { grid_square.field.should == "DN" }
    Then { lambda { grid_square.square }.should raise_error(IndexError) }
    Then { lambda { grid_square.subsquare }.should raise_error(IndexError) }
    Then { lambda { grid_square.extended_subsquare.should }.should raise_error(IndexError) }
    Then { lambda { grid_square.precision 10 }.should raise_error(IndexError) }

    Then { grid_square.west.should be_within(0.00001).of -120.0 }
    Then { grid_square.south.should be_within(0.00001).of 40.0 }
    Then { grid_square.north.should be_within(0.00001).of 50.0 }
    Then { grid_square.east.should be_within(0.00001).of -100.0 }

    Then { grid_square.width.should be_within(0.00001).of 20.0 }
    Then { grid_square.height.should be_within(0.00001).of 10.0 }

    Then { grid_square.center.longitude.should be_within(0.00001).of -110.0 }
    Then { grid_square.center.latitude.should be_within(0.00001).of 45.0 }
  end

  context "created from square" do
    Given(:grid_square) { GridSquare.new "DN41" }

    Then { grid_square.field.should == "DN" }
    Then { grid_square.square.should == "DN41" }
    Then { lambda { grid_square.subsquare.should == "DN41bi" }.should raise_error(IndexError) }
    Then { lambda { grid_square.extended_subsquare.should }.should raise_error(IndexError) }
    Then { lambda { grid_square.precision 10 }.should raise_error(IndexError) }

    Then { grid_square.west.should be_within(0.00001).of -112.0 }
    Then { grid_square.south.should be_within(0.00001).of 41.0 }

    Then { grid_square.width.should be_within(0.00001).of 2.0 }
    Then { grid_square.height.should be_within(0.00001).of 1.0 }

    Then { grid_square.center.longitude.should be_within(0.00001).of -111.0 }
    Then { grid_square.center.latitude.should be_within(0.00001).of 41.5 }
  end

  context "created from subsquare" do
    Given(:grid_square) { GridSquare.new "DN41bi" }

    Then { grid_square.field.should == "DN" }
    Then { grid_square.square.should == "DN41" }
    Then { grid_square.subsquare.should == "DN41bi" }
    Then { lambda { grid_square.extended_subsquare.should }.should raise_error(IndexError) }
    Then { lambda { grid_square.precision 10 }.should raise_error(IndexError) }

    Then { grid_square.west.should be_within(0.00001).of -111.91666 }
    Then { grid_square.south.should be_within(0.00001).of 41.33333 }

    Then { grid_square.width.should be_within(0.00001).of 0.083333 }
    Then { grid_square.height.should be_within(0.00001).of 0.041666 }

    Then { grid_square.center.longitude.should be_within(0.00001).of -111.875 }
    Then { grid_square.center.latitude.should be_within(0.00001).of 41.35416 }
  end

  context "created from extended subsquare" do
    Given(:grid_square) { GridSquare.new "DN41bi63" }

    Then { grid_square.field.should == "DN" }
    Then { grid_square.square.should == "DN41" }
    Then { grid_square.subsquare.should == "DN41bi" }
    Then { grid_square.extended_subsquare.should == "DN41bi63" }
    Then { lambda { grid_square.precision 10 }.should raise_error(IndexError) }

    Then { grid_square.west.should be_within(0.00001).of -111.86666 }
    Then { grid_square.south.should be_within(0.00001).of 41.34583 }

    Then { grid_square.width.should be_within(0.00001).of 0.0083333 }
    Then { grid_square.height.should be_within(0.00001).of 0.0041666 }

    Then { grid_square.center.longitude.should be_within(0.00001).of -111.8625 }
    Then { grid_square.center.latitude.should be_within(0.00001).of 41.34792 }
  end

  context "proper field casing" do
    Given(:upper) { GridSquare.new "DN41BI83QR" }
    Given(:lower) { GridSquare.new "dn41bi83qr" }

    Then { upper.field.should == "DN" }
    Then { upper.square.should == "DN41" }
    Then { upper.subsquare.should == "DN41bi" }
    Then { upper.precision(4).should == "DN41bi83" }

    Then { lower.field.should == "DN" }
    Then { lower.square.should == "DN41" }
    Then { lower.subsquare.should == "DN41bi" }
    Then { lower.precision(4).should == "DN41bi83" }
  end

  context "created from a ridiculously long GridSquare code" do
    Given(:ludicrous) { GridSquare.new "RN91SK59MC07FQ84VK31SM03PF57XS16DU32MS24LX34EI48RQ28CS09MA87VO18GS16WK64JL24XF21KJ12FO37RJ73QL28IU39AS55HC86SW74JD70VQ61SF52QA21SD28GB60HT40SN34VG10NP11TP27CR36OA76LD28TI36JE73TF03OT41UH60IX96IH80HX45KC53SJ57AF07HQ38NI74WT84LP33UQ34OP06TV69IA96LB80VW57MV04SJ88AV74GO73JW26BF53DE74BH31EV57WP25WO98IL47BT13AD44WC66BL08IA01KN55FV05EI50KM77HV72LF21NG51XI69QW28PO80FW77AI36BE19ID25JR96KA39DA28LK83PL86TP85AH21LB31NF52BQ06WJ64AQ05XK16RJ16SP96KE85BU61BS68OK10HC39QH86XB51PO62RA27JH93PM08NF46XS98HN76LJ55KQ68AQ34JR96OF09DJ13NP76BP09AP83MK60SE83FX63OS03AG31HA46KB00QF06LU66DX71PH65WU26IF88AO21LE62DI34GF23hc34" }
    Then { ludicrous.field.should == "RN" }
    Then { ludicrous.square.should == "RN91" }
    Then { ludicrous.subsquare.should == "RN91sk" }
    Then { ludicrous.extended_subsquare.should == "RN91sk59" }
    Then { lambda { ludicrous.precision 301 }.should raise_error(IndexError) }
  end

  describe ".encode" do
    Given(:grid_square) { GridSquare.encode -111.866785, 40.363840 }

    Then { grid_square.grid_reference.should == "DN40bi57" }

    context "with precision" do
      Given(:grid_square) { GridSquare.encode -111.866785, 40.363840, 10 }

      Then { grid_square.grid_reference.should == "DN40BI57XH67OE24bd98" }
    end
  end
end
