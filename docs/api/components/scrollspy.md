# Scrollspy

The Bootstrap `scrollspy` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_scrollspy(*args, &block)`

_use only when you want to apply the scrollspy behavior to a specific element on your UI \(other than `body`\)_

Returns a `div` with applied bootstrap scrollspy data attributes and `position: relative;` containing content specified by a block. Also the scrollspy is customizable with the following options:

**Required options**

* `:height` - Defines the height for the scrollable container, can be an Integer which will be interepreted as `Xpx`, or a custom String like `"20em"`

**Optional options**

* `:offset` - Pixels to offset from top when calculating position of scroll, by default 10
* `:method` - Finds which section the spied element is in. Be default is `auto` which will choose the best method to get scroll coordinates.
* `:target` - Specifies element to apply Scrollspy plugin.
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding scrollspy div.

## Examples

### Example 1: Scrollspy with list-group

```ruby
bs_row class: "m-3" do
  bs_col lg: 4 do
    bs_list_group id: "list-example", class: "mb-5", actionable_items: true, items: [
      { type: :link, text: "Item 1", path: "#list-item1"},
      { type: :link, text: "Item 2", path: "#list-item2" }
    ]
  end
  bs_col lg: 8 do
    bs_scrollspy target: "#list-example", offset: 0, height: 200 do
      h2 "Item 1", id: "list-item1"
      100.times do
        paragraph "Text for item 1"
      end
      h2 "Item 2", id: "list-item2"
      100.times do
        paragraph "Text for item 2"
      end
    end
  end
end
```

