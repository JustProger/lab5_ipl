# frozen_string_literal: true

# Description of Main
class Main
  def self.func(x_param)
    x_param = x_param.to_f # что делать с 0 и 2???
    raise ZeroDivisionError, 'Деление на ноль!' if x_param.equal?(2.to_f)

    Math.log((x_param**2) / (x_param - 2)) * Math.exp(x_param)
  end
end
