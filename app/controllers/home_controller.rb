# HomeController
class HomeController < ApplicationController
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def index
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content =
      content_tag(:p, 'A tool for generating Operations Paperwork,
                  including for modular layouts.') +
      content_tag(:p, Lorem.new(200))
  end

  def about
    @title = @heading = 'About SwitchYard'
    @intro = 'A tool for generating Operations Paperwork, including for modular layouts. '
    @content = content_tag(:p, Lorem.new(100))
  end

  def postmail
    # message: {name: 'Will Merrell', email: 'will@morelandsolutions.com',
    #   subject: 'tests', text: 'This is a test'}
    redirect_to about_path
  end
end
