# Matestack Bootstrap Component: ButtonGroup

The Bootstrap `button_group` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `button_group(*args, &block)`
----

Returns a bootstrap button_group containing text or content specified by a block. Also the button_group is customizable with the following options. 

**Optional options**

* `:variant` - Specify a variant for the spinner. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`

*

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding spinner div.

## Examples

### Example 1: 

```ruby

```

returns

```html
<div class="">
  
</div>
```

### size - optional
Expects an Integer 1 or 3. By default it's medium size
*1 -> sm (small), 2 -> (medium), 3 -> lg(large)*

### type - optional
Expects `group` or `toolbar`. By default is set as `group`

### vertical - optional
Expects `true` or `false`. By default is set as `true`. This parameter determines whether the button group should align vertically

### label - optional
Expects a String. Adding label to attributes `aria-label`

### HMTL attributes - optional
This component accepts all the canonical [HTML global attributes](https://www.w3schools.com/tags/ref_standardattributes.asp) like `id` or `class`.

## Examples

### Example 1: 

```ruby
btn_group label: "Basic example" do 
  btn style: :secondary, text: "Left"
  btn style: :secondary, text: "Middle"
  btn style: :secondary, text: "Right"
end
```

returns

```html
<div class="btn-group" role="group" aria-label="Basic example">
  <button type="button" class="btn btn-secondary">Left</button>
  <button type="button" class="btn btn-secondary">Middle</button>
  <button type="button" class="btn btn-secondary">Right</button>
</div>
```

### Example 2: Using size

```ruby
btn_group size: 3, label: "..." do ... end
btn_group label: "..." do ... end
btn_group size: 1, label: "..." do ... end
```

returns

```html
<div class="btn-group btn-group-lg" role="group" aria-label="...">...</div>
<div class="btn-group" role="group" aria-label="...">...</div>
<div class="btn-group btn-group-sm" role="group" aria-label="...">...</div>
```