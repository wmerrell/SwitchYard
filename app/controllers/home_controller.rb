# HomeController
class HomeController < ApplicationController
  def index
    @title = @heading = 'SwitchYard'
    @intro = 'Welcome to SwitchYard'
    @content = 'A tool for generating Operations Paperwork, including for modular layouts. ' + '<br />Mattis mauris aliquam. Elit feugiat nec amet pede massa diam erat ante at nec. Nibh eros vestibulum potenti amet id et velit congue. Elit tristique pretium eget libero inceptos gravida rutrum. Fermentum morbi turpis massa. Libero mi pellentesque purus eros aliquam nisi ipsum. Per nisi tellus posuere elementum suspendisse at id. Torquent mollis sit aliquam dapibus aptent sodales vestibulum nunc. Aliquam vel at lorem ornare nostra litora in. Vel phasellus in metus aliquam mi porttitor porttitor suspendisse et. Per non fusce turpis praesent molestie ad lacinia elit in cursus turpis. Mi fermentum morbi eget. Sollicitudin ullamcorper interdum pellentesque ligula nunc risus ut. Dignissim donec arcu ut. Accumsan eleifend phasellus. Turpis vestibulum nunc commodo interdum ullamcorper ac. Luctus scelerisque donec. Turpis platea sagittis nullam duis eu eget curabitur viverra. Proin. Blandit consectetuer at proin eu quam in in quis magna. Justo enim quam a eget in mauris mauris. Nam eu per nunc fusce vulputate eu elit. Vel vel aliquet. Sem lorem ac pharetra. Velit leo sed. Felis mattis hendrerit quam lectus sed turpis molestie metus pellentesque et ad. Mollis duis tempor egestas. Mauris aliquam sociosqu dolor ipsum aliquam morbi elit. Vitae imperdiet nostra nibh quis mauris ligula suscipit. Amet ultrices sagittis. '
  end

  def about
    @title = @heading = 'About SwitchYard'
    @intro = 'A tool for generating Operations Paperwork, including for modular layouts. '
    @content = 'Mattis mauris aliquam. Elit feugiat nec amet pede massa diam erat ante at nec. Nibh eros vestibulum potenti amet id et velit congue. Elit tristique pretium eget libero inceptos gravida rutrum. Fermentum morbi turpis massa. Libero mi pellentesque purus eros aliquam nisi ipsum. Per nisi tellus posuere elementum suspendisse at id. Torquent mollis sit aliquam dapibus aptent sodales vestibulum nunc. Aliquam vel at lorem ornare nostra litora in. Vel phasellus in metus aliquam mi porttitor porttitor suspendisse et. Per non fusce turpis praesent molestie ad lacinia elit in cursus turpis. Mi fermentum morbi eget. Sollicitudin ullamcorper interdum pellentesque ligula nunc risus ut. Dignissim donec arcu ut. Accumsan eleifend phasellus. Turpis vestibulum nunc commodo interdum ullamcorper ac. Luctus scelerisque donec. Turpis platea sagittis nullam duis eu eget curabitur viverra. Proin. Blandit consectetuer at proin eu quam in in quis magna. Justo enim quam a eget in mauris mauris. Nam eu per nunc fusce vulputate eu elit. Vel vel aliquet. Sem lorem ac pharetra. Velit leo sed. Felis mattis hendrerit quam lectus sed turpis molestie metus pellentesque et ad. Mollis duis tempor egestas. Mauris aliquam sociosqu dolor ipsum aliquam morbi elit. Vitae imperdiet nostra nibh quis mauris ligula suscipit. Amet ultrices sagittis. '
  end

  def postmail
    redirect_to about_path
  end
end
