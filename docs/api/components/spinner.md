# Matestack Bootstrap Component: Spinner

Bootstraps `spinner` component implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.



## `spinner(*args, &block)`
----

Returns a bootstrap spinner containing text or content specified by a block. Also the spinner is customizable with the following options. 

**Optional options**

* `:variant` - Specify a variant for the spinner. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
  
* `:kind` - Choose one of the two available bootstrap spinners. Possible values are `:border, :grow`. The default value is `:border`

* `:size` - Use `:sm` to make the spinner appear smaller. The default is `nil`.

* `:sr_only` - Screen reader only text. The default is "Loading...".

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding spinner div.



## Examples

### Basic border spinner
Basic border spinner with primary style as default and a default screen reader only text.
```ruby
spinner
```
Result:
```html
<div class="spinner-border text-primary" role="status">
  <span class="sr-only">Loading...</span>
</div>
```

### Border Spinner with different variants
Changing the appearance of the border spinner.
```ruby
spinner variant: :secondary, 
```
Result:
```html
<div class="spinner-border text-secondary" role="status">
  <span class="sr-only">Loading...</span>
</div>
```

### Growing spinner
Changing the spinner kind to display bootstraps growing spinner with the "success" appearance.
```ruby
spinner kind: :grow, variant: :success
```
Result:
```html
<div class="spinner-grow text-success" role="status">
  <span class="sr-only">Loading...</span>
</div>
```

### Small spinner within a button 

```ruby
btn variant: :secondary do
  spinner kind: :grow, size: :sm
  plain "Loading..."
end
```
Result:
```html
<button class="btn btn-secondary" type="button">
  <span class="spinner-grow spinner-border-sm" role="status"></span>
  Loading...
</button>
```




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
