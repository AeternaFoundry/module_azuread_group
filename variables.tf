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
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    display_name               = string
    administrative_unit_ids    = optional(set(string))
    assignable_to_role         = optional(bool)
    auto_subscribe_new_members = optional(bool)
    behaviors                  = optional(set(string))
    description                = optional(string)
    external_senders_allowed   = optional(bool)
    hide_from_address_lists    = optional(bool)
    hide_from_outlook_clients  = optional(bool)
    mail_enabled               = optional(bool)
    mail_nickname              = optional(string)
    members                    = optional(set(string))
    onpremises_group_type      = optional(string)
    owners                     = optional(set(string))
    prevent_duplicate_names    = optional(bool)
    provisioning_options       = optional(set(string))
    security_enabled           = optional(bool)
    theme                      = optional(string)
    types                      = optional(set(string))
    visibility                 = optional(string)
    writeback_enabled          = optional(bool)
    dynamic_membership = optional(object({
      enabled = bool
      rule    = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
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
        v.dynamic_membership == null || (length(v.dynamic_membership.rule) <= 3072)
      )
    ])
    error_message = "must be at most 3072 characters"
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

