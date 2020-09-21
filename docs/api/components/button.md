# Matestack Bootstrap Component: Button

The Bootstrap `button` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `button(*args, &block)`
----

Returns a bootstrap button containing text or content specified by a block. Also the button is customizable with the following options. 

**Optional options**

* `:variant` - Specify a variant for the spinner. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
For outline btn style: add `outline_`: `variant: :outline_primary` --> `btn-outline-primary`

* `:size` - Use `:block, :sm, :md or :lg` to change the size of the button. The default is `nil`.

* `:kind` - This parameter let you set the btn tags. By default is set as `button`. You can set is for example as `submit`, `reset`, etc.

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding spinner div.

## Examples

### Example 1: Basic Bootstrap btn with predefined styes
The btn implemented in ruby has by default primary as styling

```ruby
btn text: "Primary"
btn variant: :secondary, text: "Secondary"
btn variant: :success, text: "Success"
btn variant: :danger, text: "Danger"
btn variant: :warning, text: "Warning"
btn variant: :info, text: "Info"
btn variant: :light, text: "Light"
btn variant: :dark, text: "Dark"
btn variant: :link, text: "Link"

btn variant: :outline_primary, text: "Outline Primary"
btn variant: :outline_secondary, text: "Outline Secondary"
...
```

returns

```html
<btn type="button" class="btn btn-primary">Primary</btn>
<btn type="button" class="btn btn-secondary">Secondary</btn>
<btn type="button" class="btn btn-success">Success</btn>
<btn type="button" class="btn btn-danger">Danger</btn>
<btn type="button" class="btn btn-warning">Warning</btn>
<btn type="button" class="btn btn-info">Info</btn>
<btn type="button" class="btn btn-light">Light</btn>
<btn type="button" class="btn btn-dark">Dark</btn>
<btn type="button" class="btn btn-link">Link</btn>

<btn type="button" class="btn btn-outline-primary"> Outline Primary</btn>
<btn type="button" class="btn btn-outline-secondary">Outline Secondary</btn>
```

### Example 2: Yield a given block

```ruby
btn id: 'foo', class: 'bar' do
  plain "Click me"
end
```

returns

```html
<btn id="foo" type="button" class="btn btn-primary bar">
  Click me
</btn>
```


### Example 3: Using pre define btn size parameter
```ruby
btn variant: :success, size: :sm, text: "Small btn"
btn variant: :secondary, size: :lg, text: "Large btn"
```

returns

```html
<btn type="button" class="btn btn-success btn-sm">Small btn</btn>

<btn type="button" class="btn btn-secondary btn-lg">Large btn</btn>

```