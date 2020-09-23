# Matestack Bootstrap Component: Badge

The Bootstrap `badge` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `badge(*args, &block)`
----

Returns a bootstrap badge containing text and/or content specified by a block. Also the badge is customizable with the following options. 

**Optional options**

* `:variant` - Specify a variant for the badge. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:secondary`

* `:rounded` - Expects `true` or `false`. By default is set as `false`. Set this parameter to true to apply bootstraps "rounded-pill" class.

* `:text` - Expects a string which gets displayed plain inside the badge. If a text and block is given, the text will be rendered before the block content.

* `:sr_only` - Screen reader only text like bootstrap establishes it, following the badge in another "span" containing the given string. As default no screen reader only "span" and text is rendered.

* `&block` - Use a block to create custom content/markup inside a badge. If used together with `:text` the text will be displayed before the block.

* Html attributes - all w3c confirm html attributes for span's can be set via options and will be added to the surrounding badge span.

## Examples

### Basic badge

```ruby
badge text: 'New' 
```

Result:

```html
<span class="badge bg-secondary"></span>
```

### Badge with block content

```ruby
badge variant: :warning do
  div do
    paragraph text: "Custom inner html"
  end
end
```

Result:

```html
<span class="badge bg-warning">
  <div>
    <p>Custom inner html</p>
  </div>
</span>
```

### Rounded success badge

```ruby
badge text: "Success", variant: :success, rounded: true
```

Result:

```html
<span class="badge rounded-pill bg-success">Success</span>
```