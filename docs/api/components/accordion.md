# Matestack Bootstrap Component: Accordion

The Bootstrap `accordion` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_accordion(*args, &block)`

Returns a bootstrap accordion containing card header and collapsable card-body elements or content specified by a block.

**Required options**

* `:items` - expects an array with 2 hashes, one for `header` and one for `body`. The two hashes can have the following keys
  * `open` - if true, this item will be shown initially
  * `header`:
    * `class` & `id` - adding custom class and id to header component
    * `size` - customize heading element, by default it's set as `h2`
    * `text` - header text block
  * `body`:
    * `class` - adding custom class to body component
    * `multi` - If set true, collapse body can be control by multiple sources
    * `text` - adding text block to body

**Optional options**

* `:open` - if true, all items will be shown initially
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding accordion div.

## Examples

### Example 1: Open specified items initially

```ruby
bs_accordion items: [
  {
    open: true,
    header: { text: "Collapsible Group Item #1" },
    body: { text: "Random Text for Collapse #1" }
  },
  {
    header: { text: "Collapsible Group Item #2" },
    body: { text: "Random Text for Collapse #2", class: "foobar" }
  }
]
```

### Example 1: Open all items initially

```ruby
bs_accordion open: true, items: [
  {
    header: { text: "Collapsible Group Item #1", class: "foobar" },
    body: { text: "Random Text for Collapse #1" }
  },
  {
    header: { text: "Collapsible Group Item #2" },
    body: { text: "Random Text for Collapse #2" }
  }
]
```
