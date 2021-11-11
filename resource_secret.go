package main

import (
	"fmt"

	"github.com/hashicorp/terraform-plugin-sdk/helper/schema"
)

func resourceSecret() *schema.Resource {
	return &schema.Resource{
		Create: resourceCreate,
		Read:   resourceRead,
		Delete: resourceDelete,
		Importer: &schema.ResourceImporter{
			State: resourceImporter,
		},
		Schema: map[string]*schema.Schema{
			"value": {
				Type:      schema.TypeString,
				Computed:  true,
				Sensitive: true,
			},
		},
	}
}

func resourceCreate(d *schema.ResourceData, meta interface{}) error {
	return fmt.Errorf("this resource can only be created on import")
}

func resourceRead(d *schema.ResourceData, meta interface{}) error {
	return nil
}

func resourceDelete(d *schema.ResourceData, meta interface{}) error {
	d.SetId("")
	return nil
}

func resourceImporter(d *schema.ResourceData, meta interface{}) ([]*schema.ResourceData, error) {
	value := d.Id()
	d.SetId("-")
	d.Set("value", value)
	return []*schema.ResourceData{d}, nil
}
