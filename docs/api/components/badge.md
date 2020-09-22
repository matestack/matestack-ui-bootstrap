# Matestack Bootstrap Component: Badge

The Bootstrap `badge` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `badge(*args, &block)`
----

Returns a bootstrap badge containing text or content specified by a block. Also the badge is customizable with the following options. 

**Optional options**

* `:variant` - Specify a variant for the badge. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`

* `:rounded` - Expects `true` or `false`. By default is set as `false`. Set this parameter to true for setting bootstrap `rounded-pill` option

* `:text` - Expects a string with the text that should go inside the badge

* `:sr_only` - Screen reader only text. The default is "Loading...".

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding badge div.

## Examples

### Example 1: Yield content into the badge

```ruby
badge variant: :secondary do
  paragraph text: "Yield any content here"
end
```

returns

```html
<span class="badge bg-secondary">
  <p>
    Yield any content here
  </p>
</span>
```

### Example 2: Badge as rounded pill

```ruby
badge text: "Success", variant: :success, rounded: true
```

returns

```html
<span class="badge rounded-pill bg-success">Success</span>
```