class Array
  def wsample(*args, &block)
    count, options = \
      if args.size == 0 || args[0].class == Hash
        [nil, args[0]]
      else
        [args[0], args[1]]
      end
    ret = max_by(count || 1) { |v| w_algorithm(v, options, &block) }
    count ? ret : ret[0]
  end

  def wshuffle(options = {}, &block)
    sort_by { |v| w_algorithm(v, options, &block) }.reverse!
  end

  def wshuffle!(options = {}, &block)
    sort_by! { |v| w_algorithm(v, options, &block) }.reverse!
  end

  private

  def w_algorithm(v, options = {}, &block)
    # Pavlos S. Efraimidis, Paul G. Spirakis
    # Weighted random sampling with a reservoir
    # Information Processing Letters
    # Volume 97 Issue 5, 16 March 2006
    # Pages 181-185
    r = options[:random] ? options[:random].rand : rand rescue rand
    population = block.call(v)
    r ** ( 1.0 / population )
  end
end
