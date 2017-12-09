module "ds-vm" {
  source = "HopeUA/vm/azurerm"

  namespace = "ds-lelli"
  name = "vm-lelli"
  location = "${var.location}"
  vm_size = "Basic_A2"
  os {
	  offer = "linux-data-science-vm-ubuntu"
	  publisher = "microsoft-ads"
	  sku = "linuxdsvmubuntu"
	  version = "latest"
	}

	admin {
		name = "terraform"
		public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDxZ8sLmRI4bgCVo7Oon8FQrmNjCeJrcv8q6gj0xs6E0xBFEHHvtuV7IuHUyzh+0vZr0ySeaZHRMR+TG37MuoZgxAeXTscETAlcckCPxv8k/jvRjxre7Cg3Pu0613srbTRnzU7wNP1PnhAR3/aQ97WLjj4EsX4uQ0Kkv4aFqhWyrKQo3wr3NkXTs8AtFiTWtRFc+c2RWd/1GIg33pcdXCBPmqeUi4Xh+A6hQLlyjTSH9QUuu9Vc/5kyMfIsMPyOPFrCczlmNe5lme/FmUIXJgU+DoTlqb4TxCb3M8tXPdoVzGKKRfqTTzeJTaM5TNS+4USFJjinCNhco8gw+dbgM74wQfniLEqYcGP+rnFVYwrr8pdRCkCbdQD5ahWubjHPdJ5Fmr1l6w35KaGc26cEaAhfu2ggf6L1zn99Zazt9ashy5nHEQxpCEHjqvHglMv0R+WIs4zcEj1K7Qemb8NLtAp0x0ik1dJgfg8zYyF2P6cM5EVgDULwyUTOb7KQzFVNeSbGlT/S8vVioMPSZd74U7D2tWUvPQfCDF5FJ4un2oI1/NzCbnpu+sHnnZaSz6t4rlMgh4E45qzb4foJ2bIcpiAwgMux+yK4AE56QRHQc2kO4f4eAzwAH71XwvXzkbrHl2w6vHy7SIQtd29dFBBLBni2d9jLUQB1HNl5tJ0xEk077w== andreas@Andreass-MBP.fritz.box"
	}
}