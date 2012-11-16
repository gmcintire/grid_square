require 'spec_helper'
require_relative "../../lib/string_ext"

describe String do
  describe "#downcase_last" do
    context "field" do
      Given(:upper) { "DN" }
      Given(:lower) { "dn" }

      Then { upper.downcase_last.should == "DN" }
      Then { lower.downcase_last.should == "DN" }
    end

    context "ending in digits" do
      Given(:upper) { "DN41BI83" }
      Given(:lower) { "dn41bi83" }

      Then { upper.downcase_last.should == "DN41bi83" }
      Then { lower.downcase_last.should == "DN41bi83" }
    end

    context "subsquare or longer" do
      Given(:upper) { "DN41BI83QR" }
      Given(:lower) { "dn41bi83qr" }

      Then { upper.downcase_last.should == "DN41BI83qr" }
      Then { lower.downcase_last.should == "DN41BI83qr" }
    end
  end
end
