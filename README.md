# terraform-azure-mcaf-subscription-management-csp
This terraform module will be able to manage subscriptions for CSP agreements.

## how to work with this module, this is very much schuberg philis specific

you need to configure the restful provider.
make sure to ask the saas team to whitelist your outgoing ip.

```terraform

provider "restful" {
  base_url = "https://our-csp-app-uri-here"

  header = {
    Content-Type = "application/json"
  }

  security = {
    apikey = [
      {
        in    = "header"
        name  = "x-functions-key"
        value = var.subscription_vending_function_key
      },
      {
        in    = "header"
        name  = "x-customer-key"
        value = var.subscription_vending_customer_key
      },
    ]
  }
}

```

for variables, you need to provide a sku as well, default is 0001, which is fine.
the following options are available.

```
"enabledAzurePlans": [
  {
    "skuId": "0001",
    "skuDescription": "Microsoft Azure Plan"
  }
  {
    "skuId": "0002",
    "skuDescription": "Microsoft Azure Plan for DevTest"
  },
]
```


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version |
| ------------------------------------------------------------------------- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7  |
| <a name="requirement_restful"></a> [restful](#requirement\_restful)       | 0.14.0  |

## Providers

| Name                                                          | Version |
| ------------------------------------------------------------- | ------- |
| <a name="provider_restful"></a> [restful](#provider\_restful) | 0.14.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                               | Type        |
| ---------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [restful_operation.this](https://registry.terraform.io/providers/magodo/restful/0.14.0/docs/resources/operation)                   | resource    |
| [restful_resource.subscription_metadata](https://registry.terraform.io/providers/magodo/restful/0.14.0/docs/data-sources/resource) | data source |

## Inputs

| Name                                                                   | Description | Type                                                                                    | Default | Required |
| ---------------------------------------------------------------------- | ----------- | --------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_subscription"></a> [subscription](#input\_subscription) | n/a         | <pre>object({<br>    name = string<br>    sku  = optional(string, "0001")<br>  })</pre> | n/a     |   yes    |

## Outputs

| Name                                                                        | Description |
| --------------------------------------------------------------------------- | ----------- |
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | n/a         |
<!-- END_TF_DOCS -->

## License

**Copyright:** Schuberg Philis

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
