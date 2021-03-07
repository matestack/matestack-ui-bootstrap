# Tooltip

The Bootstrap `tooltip` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_tooltip(*args, &block)`

Returns a bootstrap tooltip component containing content specified by a block which can trigger a tooltip element. Also the tooltip is customizable with the following options.

**Required options**

* `:tooltip_title` - expects a string as the title text for the tooltip

**Optional options**

* `:text` - expects a string as text for the visible element on which the tooltip will be applied to, alternatively yield a block
* `:tag` - element that tooltip should be applied to. By default is set as 'div', you can modify it to use a `div`
* `:animation` - Apply a CSS fade transition to the tooltip
* `:placement` - How to position the tooltip - `auto` \| `top` \| `bottom` \| `left` \| `right`. when auto is specified, it will dynamically reorient the tooltip.
* `:trigger` - How tooltip is triggered - `click` \| `hover` \| `focus` \| `manual`. You may pass multiple triggers; separate them with a space. `manual` cannot be combined with any other trigger.
* `:boundary` - Overflow constraint boundary of the tooltip
* `:offset` - Offset of the tooltip relative to its target.
* `:container` - Appends the tooltip to a specific element.
* `:delay` - Delay showing and hiding the tooltip \(ms\) - does not apply to manual trigger type. If a number is supplied, delay is applied to both hide/show
* `:selector` - If a selector is provided, tooltip objects will be delegated to the specified targets
* `:html` - Insert HTML into the tooltip. If false, innerText property will be used to insert content into the DOM.
* `:template` - Base HTML to use when creating the tooltip.
* `:fallback_placement` - Allow to specify which position Popper will use on fallback.
* `:popper_config` - To change Bootstrap's default Popper.js config

  _Source:_ [https://v5.getbootstrap.com/docs/5.0/components/tooltips/\#options](https://v5.getbootstrap.com/docs/5.0/components/tooltips/#options)

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding tooltip div.

## Examples

### Example 1: Basic tooltip appears on hover

```ruby
bs_tooltip tooltip_title: "Help Message" do
  action method: :post, path: some_path do
    bs_btn text: "Button"
  end
end
```

### Example 2: Tooltip appears when clicked

```ruby
bs_tooltip tooltip_title: "Help Message", trigger: "click" do
  action method: :post, path: some_path do
    bs_btn text: "Button"
  end
end
```

