# Copyright (c) 2023, 2025, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl/

provider "oci" {
  region               = var.region
  ignore_defined_tags  = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  alias                = "home"
  region               = local.regions_map[local.home_region_key]
  ignore_defined_tags  = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

provider "oci" {
  alias                = "secondary_region"
  region               = local.regions_map[local.home_region_key]
  ignore_defined_tags  = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    oci = {
      source                = "oracle/oci"
      configuration_aliases = [oci.home]
    }
  }
}
