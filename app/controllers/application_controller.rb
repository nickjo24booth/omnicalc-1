class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "game_templates/rules.html.erb" })
  end

  def blank_square_form
    render({ :template => "calc_templates/square_form.html.erb" })
  end

  def calculate_square

    #Everything in the params hash is a string.

    @num = params.fetch("number").to_f

    @square = @num ** 2

    render({ :template => "calc_templates/square_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calc_templates/random_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f

    @random = rand(@lower..@upper)

    render({ :template => "calc_templates/rand_results.html.erb" })
  end

  def blank_sqrt_form
    render({ :template => "calc_templates/sqrt_form.html.erb" })
  end

  def calculate_sqrt
    @num = params.fetch("number").to_f

    @sqrt = @num ** 0.5

    render({ :template => "calc_templates/sqrt_results.html.erb" })
  end

  def blank_payment_form
    render({ :template => "calc_templates/payment_form.html.erb" })
  end

  def calculate_pmt
    @apr = params.fetch("user_apr").to_f
    @r = (@apr / 100) / 12

    @years = params.fetch("user_years").to_f
    @n = @years * 12

    @pv = params.fetch("user_pv").to_f

    @numerator = @r * @pv
    @denominator = 1 - ((1 + @r) ** (-@n))

    @pmt = @numerator / @denominator

    render({ :template => "calc_templates/payment_results.html.erb" })
  end
end
