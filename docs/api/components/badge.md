# Matestack Bootstrap Component: Badge

The Bootstrap `badge` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### color - optional 
Expects bootrap predefined color: `primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`, `link`

### rounded - optionoal
Expects `true` or `false`. By default is set as `false`. Set this parameter to true for `rounded-pill` 

### text - optional
Expects a string with the text that should go inside the `<badge>` tag.

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Yield content into the badge

```ruby
badge color: :secondary do
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
badge text: "Success", color: :success, rounded: true
```

returns

```html
<span class="badge rounded-pill bg-success">Success</span>
```