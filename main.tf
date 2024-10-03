
resource "restful_operation" "this" {
  for_each = var.subscription

  path   = "/api/create-subscription"
  method = "POST"

  body = {
    SubscriptionName = each.value.name
    SkuId            = each.value.sku
  }

  poll = {
    url_locator       = "header.Location"
    status_locator    = "code"
    default_delay_sec = 15
    status = {
      success = "200"
      pending = ["202"]
    }
  }
}

data "restful_resource" "subscription_metadata" {
  for_each = var.subscription

  id     = "/api/create-subscription/${restful_operation.this[each.key].output}"
  method = "GET"
}

