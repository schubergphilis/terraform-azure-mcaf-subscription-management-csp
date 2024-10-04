variable "subscription" {
  type = object({
    name = string
    sku  = optional(string, "0001")
  })
  nullable = false
  description = <<DESCRIPTION

- `name` = (Required) - name that the subscription will get.
- `sku` = (Optional) - Production or a DevTest type of azure plan.

```hcl
sub1 = {
  name = "sub1"
  sku  = "0001"
}

DESCRIPTION
}