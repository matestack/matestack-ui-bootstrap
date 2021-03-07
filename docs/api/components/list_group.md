# ListGroup

The Bootstrap `List group` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_list_group(*args, &block)`

Returns a bootstrap listgroup containing series of content. Also the listgroup is customizable with the following options.

**Optional options**

* `:items` - expects an array of hashes with `type`, `text`, `path`, `active`, `variant`, `badge` as possible keys
  * `:variant` - Specify a variant for the button. Variant represent bootstraps contextual classes and can have one of the following values:
    * `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class via `class`.
  * `active` - If set true list item will have an active class
  * `badge` - If given, renders an additional badge
  * `icon` - Name of desired icon which will prepend the \(optionally\) given text
  * `type` - Can be `nil`, `link`, `transition`, `action`, `label` or `tab`
    * will automatically render the listgroup as a `div` \(rather than `ul`\) when one of the items is `link`, `transition`, `action` or `tab`
* `horizontal` - to change the layout of list group items from vertical to horizontal across all breakpoints.
* `horizontal_size` - choose `sm`, `md`, `lg`, `xl`, `xxl` to make a list group horizontal starting at that breakpoint’s min-width
* `variant` - If set to `:flush`, borders and rounded corners will be removed
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding listgroup div.

## Examples

### Example 1: Basic example

```ruby
bs_list_group items: [
  { text: "Cras justo odio", icon: "circle"},
  { text: "Dapibus ac facilisis in", variant: :danger },
  { text: "Dapibus ac facilisis in", badge: "42" },
  { text: "Vestibulum at eros", disabled: true }
]
```

### Example 2: Basic example with links

```ruby
bs_list_group  items: [
  { type: :link, path: "#list-item1", text: "Item 1" },
  { type: :link, path: "#list-item2", text: "Item 2", disabled: true }
]
```

### Example 3: Basic example with transitions

```ruby
bs_list_group  items: [
  { type: :transition, path: root_path, delay: 300, text: "Item 1" },
  { type: :transition, path: products_path, text: "Item 2", disabled: true }
]
```

### Example 4: Basic tab nav example

```ruby
bs_row do
  bs_col lg: 4 do
    bs_list_group id: "list-tab", tab_nav: true,
      items: [
        { type: :tab, id: :a, text: "Item 1", active: true},
        { type: :tab, id: :b, text: "Item 2" },
        { type: :tab, id: :c, text: "Item 3" }
      ]
  end
  bs_col lg: 8 do
    bs_tab_nav id: "list" do
      bs_tab_nav_content id: :a, active: true do
        plain "A"
      end
      bs_tab_nav_content id: :b do
        plain "B"
      end
      bs_tab_nav_content id: :c do
        plain "C"
      end
    end
  end
end
```

