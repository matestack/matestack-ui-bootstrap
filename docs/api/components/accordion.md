# Matestack Bootstrap Component: Accordion

The Bootstrap `accordion` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `bs_accordion(*args, &block)`
----

Returns a bootstrap accordion containing card header and collapsable card-body elements or content specified by a block.

**Optional options**

* `:items` - expects an array with 2 hashes, one for `header` and one for `body`. The two hashes can have the following keys
  * `header`:
    * `class` & `id` - adding custom class and id to header component
    * `size` - customize heading element, by default it's set as `h2`
    * `variant` - Specify a variant for the xxxx. Variant represent bootstraps contextual classes and can have one of the following values: `:primary, :secondary, :success, :info, :warning, :info, :light, :dark` or your custom contextual class.
    * `text` - header text block
  * `body`:
    * `class` - adding custom class to body component
    * `multi` - If set true, collapse body can be control by multiple sources
    * `text` - adding text block to body
<br>
* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding accordion div.

## Examples

### Example 1:

```ruby
bs_accordion id: "accordionExample", items: [
  { header: { text: "Collapsible Group Item #1", variant: :light, class: "text-left p-3 rounded-0" },
    body: { text: "Random Text for Collapse #1" } },
  { header: { text: "Collapsible Group Item #2", variant: :light, class: "text-left p-3 rounded-0" },
    body: { text: "Random Text for Collapse #2" } }
]
```

returns

```html
<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header p-0" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-light btn-block text-left p-3 rounded-0" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Collapsible Group Item #1
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
        Random Text for Collapse #1
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header p-0" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-light btn-block text-left collapsed p-3 rounded-0" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Collapsible Group Item #2
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
        Random Text for Collapse #2
      </div>
    </div>
  </div>
</div>
```
