# Matestack Bootstrap Component: Scrollspy

The Bootstrap `scrollspy` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_scrollspy(*args, &block)`
----

Returns a bootstrap scrollspy containing content specified by a block. Also the scrollspy is customizable with the following options.

**Optional options**

* `:offset` - Pixels to offset from top when calculating position of scroll, by default 10
* `:method` - Finds which section the spied element is in. Be default is `auto` which will choose the best method to get scroll coordinates.
* `:target` - Specifies element to apply Scrollspy plugin.

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding scrollspy div.

## Examples

### Example 1: Scrollspy with list-group

```ruby
bs_list_group id: "list-example", items: [
            { type: :link, text: "Go to Item 1", path: "#list-item1"},
            { type: :link, text: "Go to Item 2", path: "#list-item2" }
          ]

bs_scrollspy target: "#list-example" do
  heading size: 2, id: "list-item1", text: "Item 1"
  paragraph text: "Foo"

  heading size: 2, id: "list-item2", text: "Item 2"
  paragraph text: "Bar"
end
```

returns

```html
<ul id="list-example" class="list-group">
  <a href="#list-item1" class="list-group-item list-group-item-action">
    Go to Item 1
  </a>
  <a href="#list-item2" class="list-group-item list-group-item-action">
    Go to Item 2
  </a>
</ul>

<div data-spy="scroll" data-target="#list-example">
  <h2 id="list-item1">Item 1</h2>
  <p>
    Foo
  </p>
  <h2 id="list-item2">Item 2</h2>
  <p>
    Bar
  </p>
</div>
```
