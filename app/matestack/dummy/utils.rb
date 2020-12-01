module Dummy::Utils

  def render_code path, title
    section_card title: title, subtitle: path, content_padding: false do
      md path: path, lang: "ruby"
    end
  end

  def render_code_grid items, id
    async defer: true, id: id do
      row do
        col align_self: :start, xl: 8 do
          items.each do |code_snippet|
            render_code code_snippet[:path], code_snippet[:title]
          end
        end
      end
    end
  end

end
