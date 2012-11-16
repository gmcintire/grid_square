require 'spec_helper'
require_relative '../../lib/radix_enumerator'

module GridSquare
  describe RadixEnumerator do
    Given(:radix) { RadixEnumerator.new }

    Then {
      radix.next[0].should == ?A.ord
      radix.next[0].should == "0".ord
      radix.next[0].should == ?A.ord
      radix.next[0].should == "0".ord
      radix.next[0].should == ?A.ord
      radix.next[0].should == "0".ord
      radix.next[0].should == ?A.ord
      radix.next[0].should == "0".ord
      radix.next[0].should == ?A.ord
    }

    Then {
      radix.next[1].should == 18
      radix.next[1].should == 10
      radix.next[1].should == 24
      radix.next[1].should == 10
      radix.next[1].should == 24
      radix.next[1].should == 10
      radix.next[1].should == 24
      radix.next[1].should == 10
      radix.next[1].should == 24
    }
  end
end
