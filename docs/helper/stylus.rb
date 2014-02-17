require "haml/filters"
module Haml::Filters::Stylus
  include Haml::Filters::Base
  include Haml::Filters::Sass
  lazy_require 'stylus'
  def render(text)
    src = super
    "<style>#{src}</style>"
  end
end