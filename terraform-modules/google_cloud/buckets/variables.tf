variable "bucket_name" {
  description = "Nome do bucket, todos os buckets possuem um sufixo `lmbr`"
  type        = string
  default     = null
}

variable "project_id" {
  description = "Nome do projeto aonde o bucket será provisionado."
  type        = string
  default     = null
}

variable "custom_bucket_name" {
  description = "Nome customizado para importação de bucket."
  type        = string
  default     = null
}

variable "bucket_force_destroy" {
  description = "Forçar a destruição do bucket no comando `terraform destroy`"
  type        = bool
  default     = true
}

variable "bucket_location" {
  description = "Localização do bucket"
  type        = string
  default     = null
}

variable "bucket_versioning" {
  description = "Habilitar versionamento do bucket"
  type        = bool
  default     = true
}

variable "bucket_storage_class" {
  description = "Storage class do bucket. Valores suportados são: STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE. Mais sobre storage class https://cloud.google.com/storage/docs/storage-classes#classes"
  type        = string
  default     = "STANDARD"
}

variable "public_bucket" {
  description = "Habilitar o bucket publicamente"
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "Lista de regras de lifecycle a ser configurado. O formato é o mesmo mencionado na documentação https://www.terraform.io/docs/providers/google/r/storage_bucket.html#lifecycle_rule com excecão de condition.matches_storage_class que deveria ser delimitado por vírgula na string. Veja o exemplo examples/main.tf para mais detalhes."
  type = set(object({
    action    = map(string)
    condition = map(string)
  }))
  default = []
}

variable "labels" {
  description = "Labels para aplicar no bucket"
  type        = map(string)
  default     = {}
}

variable "bucket_admins" {
  description = "Lista de usuários/contas de serviço com permissão de `admin`"
  type        = list(string)
  default     = []
}

variable "bucket_creators" {
  description = "Lista de usuários/contas de serviço com permissão de `creator`"
  type        = list(string)
  default     = []
}

variable "bucket_viewers" {
  description = "Lista de usuários/contas de serviço com permissão de `viewer`"
  type        = list(string)
  default     = []
}
