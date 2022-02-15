# Migrate from 2.x to 3.0

**Please follow the migration guides from `matestack-ui-core` and `matestack-ui-vuejs` first!**

## Admin template class

- `Matestack::Ui::Bootstrap::Apps::AdminTemplate` is now `Matestack::Ui::Bootstrap::Layouts::AdminTemplate`

--> Search & Replace

## Manually including the registry is not longer required

- `include Matestack::Ui::Bootstrap::Registry` can now be removed as it the component will be automatically available when installing `matestack-ui-bootstrap`
