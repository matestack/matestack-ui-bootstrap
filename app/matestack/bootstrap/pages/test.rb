class Bootstrap::Pages::Test < Matestack::Ui::Page

  def response
    container size: :fluid do
      row horizontal: :center do
        col md: 3 do
          btn_group toolbar: true, label: "Toolbar with button groups" do
            btn_group label: "First group", vertical: true do

              btn variant: :secondary, is_transition: true, text: 1

              btn variant: :secondary, text: "2"
              btn variant: :secondary, text: "3"
            end
            btn_group label: "Second group" do
              btn variant: :secondary, text: "1"
              btn variant: :secondary, text: "2"
              btn variant: :secondary, text: "3"
            end
          end
        end
      end
      row horizontal: :center do
        col md: 3 do
          btn variant: :secondary, text: "1"
        end
      end
      row horizontal: :center do
        col md: 3 do
          card title: "Card title", body: "Some quick example text",
                header: "Card Header", footer: "Card Footer"
        end
      end
      row horizontal: :center, class: "mt-5" do
        col md: 3 do
          btn text: "Button" do
            badge text: "2", variant: :secondary, sr_only: "unread message", rounded: true
          end
        end
      end
      row horizontal: :center, class: "mt-5" do
        col md: 3 do
          toast show_on: "showToast", hide_on: "hideToast",
                body: "Hello, world! This is a toast message.", autohide: false

          onclick emit: "showToast" do
            btn text: "Show Toasts"
          end
          onclick emit: "hideToast" do
            btn text: "Hide Toasts"
          end
        end
      end
    end
  end



end
