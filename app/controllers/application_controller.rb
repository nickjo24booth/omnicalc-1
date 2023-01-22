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
end
