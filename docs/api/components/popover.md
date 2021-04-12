# Popover

The Bootstrap `popover` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_popover(*args, &block)`

Returns a bootstrap component containing text or content specified by a block which can trigger a popover element. Also the popover is customizable with the following options.

**Optional options**

* `:text` - expects a string as text inside the element in which popover will be applied to
* `:variant` - Specify a variant for the popover. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
* `:tag` - element that popover should be applied to: _div, span, links, button, ..._  
* `:content` - expects a string as the body text for popover
* `:title` - expects a string as the title text for popover
* `:animation` - Apply a CSS fade transition to the popover
* `:placement` - How to position the popover - `auto` \| `top` \| `bottom` \| `left` \| `right`. when auto is specified, it will dynamically reorient the popover.
* `:tabindex` - For proper cross-browser and cross-platform behavior, you must use the `a` tag, not the `button` tag for dismiss-on-next-click, and you also must include a tabindex attribute.
* `:trigger` - How popover is triggered - `click` \| `hover` \| `focus` \| `manual`. You may pass multiple triggers; separate them with a space. `manual` cannot be combined with any other trigger.
* `:boundary` - Overflow constraint boundary of the popover
* `:offset` - Offset of the popover relative to its target.
* `:container` - Appends the popover to a specific element.
* `:delay` - Delay showing and hiding the popover \(ms\) - does not apply to manual trigger type. If a number is supplied, delay is applied to both hide/show
* `:selector` - If a selector is provided, popover objects will be delegated to the specified targets
* `:html` - Insert HTML into the popover. If false, innerText property will be used to insert content into the DOM.
* `:template` - Base HTML to use when creating the popover.
* `:fallback_placement` - Allow to specify which position Popper will use on fallback.
* `:popper_config` - To change Bootstrap's default Popper.js config

  _Source:_ [https://v5.getbootstrap.com/docs/5.0/components/popovers/\#options](https://v5.getbootstrap.com/docs/5.0/components/popovers/#options)

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding popover div.

## Examples

### Example 1: Basic Popover

```ruby
bs_popover "Click to toggle popover",
        content: "And here's some amazing content. It's very engaging. Right?",
        title: "Popover title",
        variant: :danger
```

returns

```markup
<button type="button" class="btn btn-danger" data-bs-toggle="popover" title="Popover title" data-bs-content="And here's some amazing content. It's very engaging. Right?">
  Click to toggle popover
</button>
```

### Example 2: Popover with HTML tag inside

```ruby
bs_popover "Popover", html: 'true', content: "<p>this paragraph in popover</p>"
```

returns

```markup
<button data-bs-content="<p>this paragraph in popover</p>" data-bs-html="true" data-bs-toggle="popover" role="button" tabindex="" title="" type="button" class="btn btn-primary" data-bs-original-title="">
  Popover
</button>
```

### Example 3:

```ruby
bs_popover "Dismissible Popover", tag: :link, placement: :top, tabindex: "0", variant: :danger, trigger: "focus", title: "Dismissible popover", content: "And here's some amazing content. It's very engaging. Right?"
```

returns

```markup
<a data-bs-content="And here's some amazing content. It's very engaging. Right?" data-bs-placement="top" data-bs-tabindex="0" data-bs-title="Dismissible popover" data-bs-toggle="popover" data-bs-trigger="focus" role="button" tabindex="0" title="" class="btn btn-danger" data-bs-original-title="Dismissible popover">
  Dismissible Popover
</a>
```
