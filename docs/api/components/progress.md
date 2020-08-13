# Matestack Bootstrap Component: Progress

The Bootstrap `progress` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### value - optional
Expects an Interger <= 100. Set the current value of the progress bar with this parameter

### valuemin - optional
By default it is set as 100

### color - optional
Expects bootrap predefined color: `primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`, `link`

### striped - optional
Expects `true` or `false`. By default is set as `false`. Set this parameter to true for striped progress bar style

### animated - optional
Expects `true` or `false`. By default is set as `false`. Set this parameter to true for animated progress bar

### text - optional
Expects a string with the text that should go inside the `<progress-bar>` tag.

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: 

```ruby

```

returns

```html
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
</div>
```

### Example 2: 

```ruby

```

returns

```html
<div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
</div>
```

### Example 3: 

```ruby

```

returns

```html
<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
</div>
```
