variable "subscription" {
  type = object({
    name = string
    sku  = optional(string, "0001")
  })
}