variable "groups" {
  description = <<EOT
Map of groups, attributes below
Required:
    - display_name
Optional:
    - administrative_unit_ids
    - assignable_to_role
    - auto_subscribe_new_members
    - behaviors
    - description
    - external_senders_allowed
    - hide_from_address_lists
    - hide_from_outlook_clients
    - mail_enabled
    - mail_nickname
    - members
    - onpremises_group_type
    - owners
    - prevent_duplicate_names
    - provisioning_options
    - security_enabled
    - theme
    - types
    - visibility
    - writeback_enabled
    - dynamic_membership (block):
        - enabled (required)
        - rule (required)
EOT

  type = map(object({
    display_name               = string
    types                      = optional(set(string))
    theme                      = optional(string)
    security_enabled           = optional(bool)
    provisioning_options       = optional(set(string))
    prevent_duplicate_names    = optional(bool)
    owners                     = optional(set(string))
    onpremises_group_type      = optional(string)
    members                    = optional(set(string))
    visibility                 = optional(string)
    mail_nickname              = optional(string)
    hide_from_outlook_clients  = optional(bool)
    hide_from_address_lists    = optional(bool)
    external_senders_allowed   = optional(bool)
    description                = optional(string)
    behaviors                  = optional(set(string))
    auto_subscribe_new_members = optional(bool)
    assignable_to_role         = optional(bool)
    administrative_unit_ids    = optional(set(string))
    mail_enabled               = optional(bool)
    writeback_enabled          = optional(bool)
    dynamic_membership = optional(object({
      enabled = bool
      rule    = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.groups : (
        length(v.display_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.groups : (
        v.administrative_unit_ids == null || (alltrue([for x in v.administrative_unit_ids : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))]))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.groups : (
        v.dynamic_membership == null || (length(v.dynamic_membership.rule) >= 0 && length(v.dynamic_membership.rule) <= 3072)
      )
    ])
    error_message = "must be between 0 and 3072 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.groups : (
        v.members == null || (alltrue([for x in v.members : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))]))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.groups : (
        v.owners == null || (alltrue([for x in v.owners : can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", x))]))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

