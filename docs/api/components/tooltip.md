# Matestack Bootstrap Component: Tooltip

The Bootstrap `tooltip` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_tooltip(*args, &block)`

Returns a bootstrap component containing text or content specified by a block which can trigger a tooltip element. Also the tooltip is customizable with the following options.

**Optional options**

* `:text` - expects a string as text inside the element in which tooltip will be applied to
* `:variant` - Specify a variant for the tooltip. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
* `:tag` - element that tooltip should be applied to: _div, span, links, button, ..._ By default is set as 'button'  
* `:content` - expects a string as the body text for tooltip
* `:title` - expects a string as the title text for tooltip
* `:animation` - Apply a CSS fade transition to the tooltip
* `:placement` - How to position the tooltip - `auto` \| `top` \| `bottom` \| `left` \| `right`. when auto is specified, it will dynamically reorient the tooltip.
* `:tabindex` - For proper cross-browser and cross-platform behavior, you must use the `a` tag, not the `button` tag for dismiss-on-next-click, and you also must include a tabindex attribute.
* `:trigger` - How tooltip is triggered - `click` \| `hover` \| `focus` \| `manual`. You may pass multiple triggers; separate them with a space. `manual` cannot be combined with any other trigger.
* `:boundary` - Overflow constraint boundary of the tooltip
* `:offset` - Offset of the tooltip relative to its target.
* `:container` - Appends the tooltip to a specific element.
* `:delay` - Delay showing and hiding the tooltip \(ms\) - does not apply to manual trigger type. If a number is supplied, delay is applied to both hide/show
* `:selector` - If a selector is provided, tooltip objects will be delegated to the specified targets
* `:html` - Insert HTML into the tooltip. If false, innerText property will be used to insert content into the DOM.
* `:template` - Base HTML to use when creating the tooltip.
* `:fallback_placement` - Allow to specify which position Popper will use on fallback.
* `:popper_config` -     To change Bootstrap's default Popper.js config

  _Source:_ [https://v5.getbootstrap.com/docs/5.0/components/tooltips/\#options](https://v5.getbootstrap.com/docs/5.0/components/tooltips/#options)

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding tooltip div.

## Examples

### Example 1: Basic tooltip

```ruby
bs_tooltip text: "Click to toggle tooltip",
  content: "And here's some amazing content. It's very engaging. Right?",
  title: "tooltip title",
  variant: :danger
```

returns

```markup
<button data-animation="false" data-text="Tooltip" data-title="Tooltip Content" data-toggle="tooltip" title="" type="button" class="btn btn-primary btn btn-link" data-original-title="Tooltip Content">
  Tooltip
</button>
```

### Example 2: Tooltip as link appears when click

```ruby
bs_tooltip tag: :link,
  placement: :top,
  tabindex: "0",
  variant: :danger,
  trigger: "focus",
  title: "Tooltip Title",
  content: "And here's some amazing content. It's very engaging. Right?",
  text: "Click for tooltip"
```

returns

```markup
<a data-placement="top" data-tabindex="0" data-text="Click for tooltip" data-title="Tooltip Title" data-toggle="tooltip" data-trigger="focus" data-type="link" data-variant="danger" role="button" tabindex="0" title="" class="btn btn-danger" data-original-title="Tooltip Title">
  Click for tooltip
</a>
```

