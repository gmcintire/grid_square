require 'spec_helper'
require_relative '../../lib/location'

module GridSquare
  describe Location do
    # We can use Locations to represent exact points...
    Given(:origin) { Location.new 0.0, 0.0 }

    # Or spans/sizes
    Given(:window) { Location.new -180.0, -90.0 }

    Then { window.longitude.should be_within(0.000001).of -180.0 }
    Then { window.latitude.should be_within(0.000001).of -90.0 }

    context "translation +" do
      Given(:new_origin) { origin + Location.new(50.0, 40.0) }
      Then { new_origin.longitude.should be_within(0.000001).of 50.0 }
      Then { new_origin.latitude.should be_within(0.000001).of 40.0 }
    end

    context "translation -" do
      Given(:new_origin) { origin - Location.new(50.0, 40.0) }
      Then { new_origin.longitude.should be_within(0.000001).of -50.0 }
      Then { new_origin.latitude.should be_within(0.000001).of -40.0 }
    end

    context "scaling *" do
      Given(:new_window) { window * 2 }
      Then { new_window.longitude.should be_within(0.000001).of -360.0 }
      Then { new_window.latitude.should be_within(0.000001).of -180.0 }
    end

    context "scaling /" do
      Given(:new_window) { window / 2 }
      Then { new_window.longitude.should be_within(0.000001).of -90.0 }
      Then { new_window.latitude.should be_within(0.000001).of -45.0 }
    end
  end
end