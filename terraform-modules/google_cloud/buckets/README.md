<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.lmbr-bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_access_control.public_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_access_control) | resource |
| [google_storage_bucket_iam_binding.admins](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_binding) | resource |
| [google_storage_bucket_iam_binding.creators](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_binding) | resource |
| [google_storage_bucket_iam_binding.viewers](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_admins"></a> [bucket\_admins](#input\_bucket\_admins) | Lista de usuários/contas de serviço com permissão de `admin` | `list(string)` | `[]` | no |
| <a name="input_bucket_creators"></a> [bucket\_creators](#input\_bucket\_creators) | Lista de usuários/contas de serviço com permissão de `creator` | `list(string)` | `[]` | no |
| <a name="input_bucket_force_destroy"></a> [bucket\_force\_destroy](#input\_bucket\_force\_destroy) | Forçar a destruição do bucket no comando `terraform destroy` | `bool` | `false` | no |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | Localização do bucket | `string` | `null` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Nome do bucket, todos os buckets possuem um sufixo `lmbr` | `string` | `null` | no |
| <a name="input_bucket_storage_class"></a> [bucket\_storage\_class](#input\_bucket\_storage\_class) | Storage class do bucket. Valores suportados são: STANDARD, MULTI\_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE. Mais sobre storage class https://cloud.google.com/storage/docs/storage-classes#classes | `string` | `"STANDARD"` | no |
| <a name="input_bucket_versioning"></a> [bucket\_versioning](#input\_bucket\_versioning) | Habilitar versionamento do bucket | `bool` | `true` | no |
| <a name="input_bucket_viewers"></a> [bucket\_viewers](#input\_bucket\_viewers) | Lista de usuários/contas de serviço com permissão de `viewer` | `list(string)` | `[]` | no |
| <a name="input_custom_bucket_name"></a> [custom\_bucket\_name](#input\_custom\_bucket\_name) | Nome customizado para importação de bucket. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels para aplicar no bucket | `map(string)` | `{}` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | Lista de regras de lifecycle a ser configurado. O formato é o mesmo mencionado na documentação https://www.terraform.io/docs/providers/google/r/storage_bucket.html#lifecycle_rule com excecão de condition.matches\_storage\_class que deveria ser delimitado por vírgula na string. Veja o exemplo examples/main.tf para mais detalhes. | <pre>set(object({<br>    action    = map(string)<br>    condition = map(string)<br>  }))</pre> | `[]` | no |
| <a name="input_project"></a> [project](#input\_project) | Nome do projeto aonde o bucket será provisionado. | `string` | `null` | no |
| <a name="input_public_bucket"></a> [public\_bucket](#input\_public\_bucket) | Habilitar o bucket publicamente | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Bucket name |
| <a name="output_bucket_url"></a> [bucket\_url](#output\_bucket\_url) | Bucket url |
<!-- END_TF_DOCS -->