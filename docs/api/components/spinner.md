# Matestack Bootstrap Component: Spinner

Bootstraps `spinner` component implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_spinner(*args, &block)`

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
bs_spinner
```

Result:

```markup
<div class="spinner-border text-primary" role="status">
  <span class="sr-only">Loading...</span>
</div>
```

### Border Spinner with different variants

Changing the appearance of the border spinner.

```ruby
bs_spinner variant: :secondary,
```

Result:

```markup
<div class="spinner-border text-secondary" role="status">
  <span class="sr-only">Loading...</span>
</div>
```

### Growing spinner

Changing the spinner kind to display bootstraps growing spinner with the "success" appearance.

```ruby
bs_spinner kind: :grow, variant: :success
```

Result:

```markup
<div class="spinner-grow text-success" role="status">
  <span class="sr-only">Loading...</span>
</div>
```

### Small spinner within a button

```ruby
bs_btn variant: :secondary do
  bs_spinner kind: :grow, size: :sm
  plain "Loading..."
end
```

Result:

```markup
<button class="btn btn-secondary" type="button">
  <span class="spinner-grow spinner-border-sm" role="status"></span>
  Loading...
</button>
```
