class String
  def downcase_last
    if length > 4
      self[0...-4].upcase + self[-4..-1].downcase
    else
      upcase
    end
  end
end
