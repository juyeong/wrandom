class Array
  def wsample(count = nil, &block)
    ret = max_by(count || 1) { |v| w_algorithm(v, &block) }
    count ? ret : ret[0]
  end

  def wshuffle(&block)
    sort_by { |v| w_algorithm(v, &block) }
  end

  def wshuffle!(&block)
    sort_by! { |v| w_algorithm(v, &block) }
  end

  private

  def w_algorithm(v, &block)
    # Pavlos S. Efraimidis, Paul G. Spirakis
    # Weighted random sampling with a reservoir
    # Information Processing Letters
    # Volume 97 Issue 5, 16 March 2006
    # Pages 181-185
    population = block.call(v)
    rand ** ( 1.0 / population )
  end
end
