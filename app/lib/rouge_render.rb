require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

class RougeRender < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end
