output "groups_id" {
  description = "Map of id values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.id }
}
output "groups_administrative_unit_ids" {
  description = "Map of administrative_unit_ids values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.administrative_unit_ids }
}
output "groups_assignable_to_role" {
  description = "Map of assignable_to_role values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.assignable_to_role }
}
output "groups_auto_subscribe_new_members" {
  description = "Map of auto_subscribe_new_members values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.auto_subscribe_new_members }
}
output "groups_behaviors" {
  description = "Map of behaviors values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.behaviors }
}
output "groups_description" {
  description = "Map of description values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.description }
}
output "groups_display_name" {
  description = "Map of display_name values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.display_name }
}
output "groups_dynamic_membership" {
  description = "Map of dynamic_membership values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => one(v.dynamic_membership) }
}
output "groups_external_senders_allowed" {
  description = "Map of external_senders_allowed values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.external_senders_allowed }
}
output "groups_hide_from_address_lists" {
  description = "Map of hide_from_address_lists values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.hide_from_address_lists }
}
output "groups_hide_from_outlook_clients" {
  description = "Map of hide_from_outlook_clients values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.hide_from_outlook_clients }
}
output "groups_mail" {
  description = "Map of mail values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.mail }
}
output "groups_mail_enabled" {
  description = "Map of mail_enabled values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.mail_enabled }
}
output "groups_mail_nickname" {
  description = "Map of mail_nickname values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.mail_nickname }
}
output "groups_members" {
  description = "Map of members values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.members }
}
output "groups_object_id" {
  description = "Map of object_id values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.object_id }
}
output "groups_onpremises_domain_name" {
  description = "Map of onpremises_domain_name values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.onpremises_domain_name }
}
output "groups_onpremises_group_type" {
  description = "Map of onpremises_group_type values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.onpremises_group_type }
}
output "groups_onpremises_netbios_name" {
  description = "Map of onpremises_netbios_name values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.onpremises_netbios_name }
}
output "groups_onpremises_sam_account_name" {
  description = "Map of onpremises_sam_account_name values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.onpremises_sam_account_name }
}
output "groups_onpremises_security_identifier" {
  description = "Map of onpremises_security_identifier values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.onpremises_security_identifier }
}
output "groups_onpremises_sync_enabled" {
  description = "Map of onpremises_sync_enabled values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.onpremises_sync_enabled }
}
output "groups_owners" {
  description = "Map of owners values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.owners }
}
output "groups_preferred_language" {
  description = "Map of preferred_language values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.preferred_language }
}
output "groups_prevent_duplicate_names" {
  description = "Map of prevent_duplicate_names values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.prevent_duplicate_names }
}
output "groups_provisioning_options" {
  description = "Map of provisioning_options values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.provisioning_options }
}
output "groups_proxy_addresses" {
  description = "Map of proxy_addresses values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.proxy_addresses }
}
output "groups_security_enabled" {
  description = "Map of security_enabled values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.security_enabled }
}
output "groups_theme" {
  description = "Map of theme values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.theme }
}
output "groups_types" {
  description = "Map of types values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.types }
}
output "groups_visibility" {
  description = "Map of visibility values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.visibility }
}
output "groups_writeback_enabled" {
  description = "Map of writeback_enabled values across all groups, keyed the same as var.groups"
  value       = { for k, v in azuread_group.groups : k => v.writeback_enabled }
}

