class GridSquare
  class RadixEnumerator
    def next
      if @enum.nil?
        @enum = ([["0".ord, 10], [?A.ord, 24]]).cycle
        [?A.ord, 18]
      else
        @enum.next
      end
    end
  end
end