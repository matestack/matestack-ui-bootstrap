# Matestack Bootstrap Component: Nav

The Bootstrap `nav` component, implemented in Ruby. Use it like any other matestack component in your apps, pages and components. It offers customizable options to simply achieve what is possible in bootstrap with this component. See below for more information about the possible options.

## `navigation(*args, &block)`
----

Returns a bootstrap nav. Also the nav is customizable with the following options.

**Required options**

* `id`

**Optional options**

* `items` - expects an array with hashes with `type`, `path`, `text`, `active` or `disabled` as possible keys
  * Set `active` to true, if the current item is the active element

* `variant` - Either `:tabs` or `:pills`
* `fill` - If set true, all available space will be filled proportionately with your *.nav-items*
* `justified` - If set true, all horizontal space will be occupied by nav links, but unlike the *.nav-fill* above, every nav item will be the same width.
* `vertical` - If set true, navigation items will be stacked up
* `horizontal` - Change the horizontal alignment of your nav with flexbox utilities. By default, navs are left-aligned, but you can easily change them to `:center` or `:right` aligned.

* Html attributes - all w3c confirm html attributes for div's can be set via options and will be added to the surrounding nav div.

## Examples

### Example 1: Basic Navigation with center horizontal alignment

```ruby
def response
  tab_nav tab_nav_config do
    tab_nav_content id: :a, active: true do
      plain "A"
    end
    tab_nav_content id: :b do
      plain "B"
    end
    tab_nav_content id: :c do
      plain "C"
    end
  end
end

def tab_nav_config
  {
    id: "navigation",
    items: [
      { id: :a, text: "Tab A", active: true},
      { id: :b, text: "Tab B" },
      { id: :c, text: "Tab C" }
    ],
    variant: :pills,
    class: "mb-5"
  }
end
```
