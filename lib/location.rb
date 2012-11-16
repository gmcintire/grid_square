module GridSquare
  class Location
    attr_accessor :longitude, :latitude
    def initialize(longitude, latitude)
      @longitude, @latitude = longitude, latitude
    end

    def /(scalar)
      Location.new longitude/scalar, latitude/scalar
    end

    def *(scalar)
      Location.new longitude*scalar, latitude*scalar
    end

    def +(other)
      Location.new longitude+other.longitude, latitude+other.latitude
    end

    def -(other)
      Location.new longitude-other.longitude, latitude-other.latitude
    end
  end
end