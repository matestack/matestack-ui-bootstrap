# Matestack Bootstrap Component: Btn

The Bootstrap `button` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### style - optional
Expects bootrap predefined styles: `primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`, `link`

For outline button style: add `outline_`: `btn-outline-primary` == `style: outline_primary`

### size - optional
Expects an Integer <= 3.
0 -> block, 1 -> sm, 2 -> md, 3 -> lg

### type - optional
This parameter let you set the button tags. By default is set as `button`. You can set is for example as `submit`, `reset`, etc.

### Disabled - optional
Expects a boolean to specify a disabled `<button>` tag. Defaults to `false`, so if not specified otherwise buttons are **not disabled**.

### Text - optional
Expects a string with the text that should go inside the `<button>` tag.

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic Bootstrap button with predefined styes
The button implemented in ruby has by default primary as styling

```ruby
btn text: "Primary"
btn style: :secondary, text: "Secondary"
btn style: :success, text: "Success"
btn style: :danger, text: "Danger"
btn style: :warning, text: "Warning"
btn style: :info, text: "Info"
btn style: :light, text: "Light"
btn style: :dark, text: "Dark"
btn style: :link, text: "Link"

btn style: :outline_primary, text: "Outline Primary"
btn style: :outline_secondary, text: "Outline Secondary"
...
```

returns

```html
<button type="button" class="btn btn-primary">Primary</button>
<button type="button" class="btn btn-secondary">Secondary</button>
<button type="button" class="btn btn-success">Success</button>
<button type="button" class="btn btn-danger">Danger</button>
<button type="button" class="btn btn-warning">Warning</button>
<button type="button" class="btn btn-info">Info</button>
<button type="button" class="btn btn-light">Light</button>
<button type="button" class="btn btn-dark">Dark</button>
<button type="button" class="btn btn-link">Link</button>

<button type="button" class="btn btn-outline-primary"> Outline Primary</button>
<button type="button" class="btn btn-outline-secondary">Outline Secondary</button>
```

### Example 2: Yield a given block

```ruby
btn id: 'foo', class: 'bar' do
  plain "Click me"
end
```

returns

```html
<button id="foo" type="button" class="btn btn-primary bar">
  Click me
</button>
```


### Example 3: Using pre define button size parameter
```ruby
btn style: :success, size: 1, text: "Small button"
btn style: :secondary, size: 3, text: "Large button"
```

returns

```html
<button type="button" class="btn btn-success btn-sm">Small button</button>

<button type="button" class="btn btn-secondary btn-lg">Large button</button>

```