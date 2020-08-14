# Matestack Bootstrap Component: Progress

The Bootstrap `progress` component, implemented in Ruby.

## Parameters
This component can handle various optional configuration params and can yield content

### value - optional
Expects an Interger <= 100. Set the current value of the progress bar with this parameter

### valuemin - optional
By default it is set as 0. It describes the `aria-valuemin` attribute

### valuemax - optional
By default it is set as 100. It describes the `aria-valuemax` attribute

### color - optional
Expects bootrap predefined color: `primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`, `link`

### height - optional
Expects an Integer. Set the height of the progress bar in pixel

### striped - optional
Expects `true` or `false`. By default is set as `false`. Set this parameter to true for striped progress bar style

### animated - optional
Expects `true` or `false`. By default is set as `false`. Set this parameter to true for animated progress bar

### text - optional
Expects a string with the text that should go inside the `<progress-bar>` tag.

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: Basic example

```ruby
progress height: 20, color: :success, value: 25, valuemin: 0, valuemax: 100, text: "25%"

# because valuemin and valuemax is set as default. It can be shorten like this:
progress height: 20, color: :success, value: 25, text: "25%"
```

returns

```html
<div class="progress" style="height: 20px;">
  <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
</div>
```

### Example 2: Using striped and animated option

```ruby
progress value: 50, text: "50%", striped: true, animated: true
```

returns

```html
<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
</div>
```

### Example 3: Using Slots option

```ruby
progress slots: { custom_bar: my_progress_bars }

def my_progress_bars
  slot {
    div class: "progress-bar bg-success", attributes: { 'role':"progressbar", 'style':"width: 15%", 'aria-valuenow':"30", 'aria-valuemin':"0", 'aria-valuemax':"100" } 
    div class: "progress-bar bg-info", attributes: { 'role':"progressbar", 'style':"width: 30%", 'aria-valuenow':"30", 'aria-valuemin':"0", 'aria-valuemax':"100" }
  }
end
```

returns

```html
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-info" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
</div>
```
