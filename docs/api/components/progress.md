# Progress

The Bootstrap `progress` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_progress(*args, &block)`

Returns a bootstrap progress containing text or content specified by a block. Also the progress is customizable with the following options.

**Optional options**

* `:progress` - expects a number or a list containing hashes with at least a `:value`. Other options are `:text`, `:class`, `:variant`, `:striped`, `:animated` and `:aria_valuenow`.
  * `value` -  Expects an Interger &lt;= 100. Set the current value of the progress bar with this parameter
  * `class` - adding custom class for progress bar
  * `variant` - Specify a variant for the progress. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
  * `striped` - Expects `true` or `false`. By default is set as `false`. Set this parameter to true for striped progress bar style
  * `animated` - Expects `true` or `false`. By default is set as `false`. Set this parameter to true for animated progress bar
  * `aria_valuenow` - String for attribute _aria-valuenow_
  * `text` - Expects a string with the text that should go inside the `<progress-bar>` tag.

    **Point of Attention:** by using the hash option, your progress bar will have multiple bars _\(look at example 3\)_
* `:text` - Expects a string with the text that should go inside the `<progress-bar>` tag.  
* `:valuemin` - By default it is set as 0. It describes the `aria-valuemin` attribute  
* `:valuemax` - By default it is set as 100. It describes the `aria-valuemax` attribute  
* `:height` - Expects an Integer. Set the height of the progress bar in pixel  
* `variant` - Specify a variant for the progress. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`  
* `striped` - Expects `true` or `false`. By default is set as `false`. Set this parameter to true for striped progress bar style  
* `animated` - Expects `true` or `false`. By default is set as `false`. Set this parameter to true for animated progress bar  
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding progress div.

## Examples

### Example 1: Basic example

```ruby
bs_progress "25%", height: 20, variant: :success, progress: 25, valuemin: 0, valuemax: 100

# because valuemin and valuemax is set as default. It can be shorten like this:
bs_progress "25%", height: 20, variant: :success, progress: 25
```

returns

```markup
<div class="progress" style="height: 20px;">
  <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>
</div>
```

### Example 2: Using striped and animated option

```ruby
bs_progress "50%", progress: 50, valuemin: 0, valuemax: 100, stripped: true, animated: true
```

returns

```markup
<div class="progress">
  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">50%</div>
</div>
```

### Example 3: Multiple bars

```ruby
bs_progress progress: [
          { value: 15, text: "15%", variant: :success },
          { value: 30, text: "30%", variant: :info }
        ], valuemin: 0, valuemax: 100
end
```

returns

```markup
<div class="progress">
  <div class="progress-bar bg-success" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100">15%</div>
  <div class="progress-bar bg-info" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100">30%</div>
</div>
```

