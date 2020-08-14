# Matestack Bootstrap Component: Spinner

The Bootstrap `spinner` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### type - optional
There are 2 types available. `grow` or `border`, By default it is set as `border`

### color - optional
Expects bootrap predefined styles: `primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`, `link`

### small - optional
Expects a boolean value. By default it is set as `false`

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic Spinner with border

```ruby
  spinner color: :primary
```

returns

```html
<div class="spinner-border text-primary" role="status">
  <span class="sr-only">Loading...</span>
</div>
```

### Example 2: Spinner within a Button 

```ruby
btn style: :secondary do
  spinner type: :grow, small: true
  plain "Loading..."
end
```

returns

```html
<button class="btn btn-secondary" type="button">
  <span class="spinner-grow spinner-border-sm" role="status" aria-hidden="true"></span>
  Loading...
</button>
```
