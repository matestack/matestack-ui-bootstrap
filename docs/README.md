---
description: 'Matestack Ui Bootstrap - Beautiful, reactive web UIs, Ruby and you!'
---

# Welcome

As an extension for `matestack-ui-core`, `matestack-ui-bootstrap`ships all you need to build beautiful, reactive UIs in pure Ruby and smart CRUD components based on Bootstrap v5. Don't think about styling anymore and just create admin or application UIs faster than ever before!

{% hint style="info" %}
Read about `matestack-ui-core` here: [https://docs.matestack.io/matestack-ui-core](https://docs.matestack.io/matestack-ui-core)
{% endhint %}

## Why?

How much do you enjoy copy&pasting complex DOM structures and giant chains of CSS classes across your APP in order to create a decent looking UI?

With `matestack-ui-core` you're luckily able to build complex DOM structures ONCE in pure Ruby in a Matestack component and reuse it across your app without copy&pasting. So this component may look like this \(without using `matestack-ui-bootstrap`!\):

{% code title="app/matestack/components/card\_component.rb" %}
```ruby
class Components::CardComponent < Matestack::Ui::Component
​
  required :title
  optional :image_path, :content
​
  def response
    div class: "card shadow-sm border-0 bg-light" do
      img path: context.image_path, class: "w-100" if context.image_path
      body_partial
    end
  end
​
  private
​
  def body_partial
    div class: "card-body" do
      h5 context.title, class: "card-title"
      paragraph context.content, class: "card-text" if context.content
    end
  end
​
end
```
{% endcode %}

**`matestack-ui-core` has no opinion about styling. That's why you need to build a Bootstrap card component \(or whatever CSS approach you prefer\) yourself.** 

In case you're into Bootstrap: Wouldn’t it be cool to have all Bootstrap components available like that in pure Ruby?

That's at least what we thought and why we've created `matestack-ui-bootstrap`shipping all you need to build beautiful, reactive UIs in pure Ruby and smart CRUD components based on Bootstrap v5.

So **the card component is already implemented** and would simply ****be used like that without any need of implementing the component yourself:

```ruby
bs_card title: "foo", body: "bar"
```

which renders:

```markup
<div class="card">
  <div class="card-body">
    <h5 class="card-title">foo</h5>
    <p class="card-text">bar</p>
  </div>
</div>
```

{% page-ref page="api/components/card.md" %}

You can see, how the prebuilt card component save you from writing 6 lines of HTML. And that's just a simple example. When using all kinds prebuilt components, you will stop writing a ton of HTML or copy&pasting DOM structure around. Do you what that makes with the readability and maintainability of your app? Not to speak about developer happiness...



## Live Demo <a id="live-demo"></a>

Based on `matestack-ui-core` and `matestack-ui-bootstrap` this reactive dummy app was created in pure Ruby without writing any JavaScript, ERB/HAML/SLIM and CSS: \([check it out](https://dummy.matestack.io/) \| [source code](https://github.com/matestack/matestack-ui-bootstrap/tree/main/spec/dummy)\)

![https://dummy.matestack.io](https://gblobscdn.gitbook.com/assets%2F-MSlZxQYRyTJNqEznL8o%2F-MTevzmZSIIaZYSkG4fv%2F-MTfYhwWbFzn_uGOlml9%2Fimage.png?alt=media&token=cbf6d7df-7d94-450e-9925-b42eb2cb0a3f)

## Getting Started

Before you dive into `matestack-ui-bootstrap`, make sure to have a solid understanding of `matestack-ui-core` first: [https://docs.matestack.io/matestack-ui-core/getting-started/concepts-rails-integration](https://docs.matestack.io/matestack-ui-core/getting-started/concepts-rails-integration)

After that, it might be a good idea to get into using `matestack-ui-bootstrap` following the quick start guide:

{% page-ref page="getting-started/quick-start.md" %}

If you know how to use matestack-ui-bootstrap, the API documentation should serve you well:

## Roadmap

Do you want to know what we're currently working on and what's planned for the next releases? Check out our GitHub Project board: [https://github.com/orgs/matestack/projects/1](https://github.com/orgs/matestack/projects/1)

