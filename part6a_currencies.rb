#Part 6: advanced OOP,metaprogramming, open classes
#and duck typing, continued
#
# a) [ELLS ex. 3.11] Extend the currency-conversion example from lecture so that you can write
# 5.dollars.in(:euros)
# 10.euros.in(:rupees)
# etc.
# ● You should support the currencies 'dollars', 'euros', 'rupees' , 'yen' where the
# conversions are: rupees to dollars, multiply by 0.019; yen to dollars, multiply by 0.013;
# euro to dollars, multiply by 1.292.
# ● Both the singular and plural forms of each currency should be acceptable,
# e.g. 1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.
# You can use the code shown in lecture as a starting point if you wish; it is shown below and is
# also available at pastebin http://pastebin.com/agjb5qBF

class Numeric
    @@currencies = {'dolar' => 1,'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
    def method_missing(method_id, *args, &block)  # capture all args in case have to call super
        singular_currency = method_id.to_s.gsub( /s$/, '')
      if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
      else
            super
      end
    end

    def in(currency)
        singular_currency = currency.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * (1/@@currencies[singular_currency])
        else
            super
        end
    end
end

puts "#{5.euros.in(:yen)}"