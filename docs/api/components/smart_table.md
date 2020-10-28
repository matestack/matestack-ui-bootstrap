# Matestack Bootstrap Content: Table

The Bootstrap `table` content, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `table(*args, &block)`
----

Returns a bootstrap table content by passing data models as param. Also the table is customizable with the following options. 

**Optional options**

*Smart Table Functionality*
* `:base_query` - expects a model as param
* `:include` - expects an array with different property of the given model. Put in the array which property you want to display on the table
* `:filter` - expects an array with different property of the given model. Put in the array which property you want to have filter for. Different filter will have different search field
* `:filter_option`- expects either `:like` or `:equal`. Specify your query filter option
* `:order`- expects an array with different hashes. 
* `:pagination` - expects a number. set how many items per page the table should display
<br>

*Bootstrap Table Customization Options*

* `:with_index` - Set true to have the first column as Index

* `:variant` - Specify a variant for the table. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class. The default is `:primary`
* `:striped` -  Set true to add zebra-striping to table row
* `:hoverable` - Set true to enable a hover state on table rows
* `:borderless` -  Set true for a table without borders.
* `:border_variant` - set bootstraps contextual classes to change colors of the table border
* `:responsive` - Set true for horizontally scrolling tables or set a specific breakpoint to create responsive tables up to a particular breakpoint. From that breakpoint and up, the table will behave normally and not scroll horizontally.
* `:footer` - expect an array with footer elements. If not set, footer will not be added to the table
* `:thead_class` - adding custom class to table header
* `:tbody_class` - adding custom class to table body
* `:tfoot_class` - adding custom class to table footer
<br>

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding table div.

## Examples

### Example 1: Basic Smart Table 

```ruby
smart_table base_query: Person.all, 
                include: [:created_at, :name, :email, :age],
                filter: [:name, :email], filter_option: :like,
                order: [{created_at: :desc}]
                # pagination: 3
```

### Example 2: Smart Table with different customization options

```ruby
smart_table base_query: Person.all, 
            include: [:created_at, :name, :email, :age],
            filter: [:name, :email], filter_option: :like,
            order: [{created_at: :desc}],
            # pagination: 3,
            with_index: true, thead_class: "table-dark", 
            responsive: :md, striped: true
```
