# Matestack Bootstrap Content: Table

The Bootstrap `table` content, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `table(*args, &block)`
----

Returns a bootstrap table content by passing data models as param. Also the table is customizable with the following options. 

**Optional options**
*Smart Table Functionality*
* `:base_query` - expects a model data
* `:include` - expects an array with different property of the given model. Put in the array which property you want to display on the table
* `:filter` - expects an array with different property of the given model. Put in the array which property you want to have filter for. Different filter will have different search field
* `:filter_option`- expects either `:like` or `:equal`. Specify how your query filter option
* `:order`- expects an array with different hashes. 
* `:pagination` - 
<br>

*Bootstrap Table Customization Options*

* `:with_index` - 

* `:variant` - Specify a variant for the table. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
* `:striped` -  
* `:hoverable` - 
* `:borderless` -  
* `:border_variant` - 
* `:responsive` - 
* `:thead_class` - 
* `:tbody_class` - 
* `:tfoot_class` - 
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding table div.

## Examples

### Example 1: 

```ruby

```

returns

```html

```